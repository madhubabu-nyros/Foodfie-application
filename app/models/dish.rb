class Dish < ApplicationRecord
  has_many :ratings, :dependent => :destroy
  has_many :pictures, as: :imageable
  has_and_belongs_to_many :restaurants
  belongs_to :category, optional: true	
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates_presence_of :name, message: '*Enter Dish name'
  validates_presence_of :price, message: '*Enter Dish Price'
  validates :category_id, presence: true
  scope :search, ->(searchdish) {where("name LIKE ?", "#{searchdish}%")}
  scope :sortby_price, ->(price) {order(price)}
  scope :sortby_ratings, ->(name) {joins(:ratings).group('dishes.id').having("name LIKE ?", "#{name}%").order('avg(ratings.number) desc')}
  scope :sortby_rating, ->(rating) {joins(:ratings).group('dishes.id').having('avg(ratings.number) > ?', rating).order('avg(ratings.number) desc')}
  scope :sortby_dietary, ->(category) {where(category_id: category)}

end