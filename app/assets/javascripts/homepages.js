$(document).ready(function () {
  var page = 2;
  $('#load-more').click(function (e) {
    e.preventDefault();
    $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: {page_no: page},
        dataType: "script",
        success: function () {
          $('#load-more').show();
          page++;
        }
    });
  });
  $('.sort').on('change', function (e) {
    var name = getUrlVars()["name"];
    e.preventDefault();
    var data= "";
    var selected = this.value;
    if(selected == "ratings") {
      data = {name:name, ratings: selected}
    }
    else if(selected == "price") {
      data = {name:name, price: selected}
    }
    $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: data,
        dataType: "script",
        success: function () {
        }
    }); 
  });
  
  $('#rating_filter').on('change', function (e) {
    var name = getUrlVars()["name"];
    e.preventDefault();
    $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: {rating: this.value},
        dataType: "script",
        success: function () {
        }
    }); 
  }); 
  google.maps.event.addDomListener(window, 'load', initMap);
});
function getUrlVars() {
  var vars = {};
  var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
    vars[key] = value;
  });
  return vars;
}
var expanded = false;
function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}
function Dietary() {
  var category = [];
  $.each($("input[type='checkbox']:checked"), function(){            
    category.push($(this).val());
    console.log('category', category)
    $.ajax({
        type: "GET",
        url: $(this).attr('href'),
        data: {category: category},
        dataType: "script",
        success: function () {
        }
    });
  });
}
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'),{
    center: {lat: 16.9891, lng: 82.2475} ,
    zoom: 8,
  });
  var location = gon.locations;
  console.log('location', location[0][0].id)
  var restaurant = gon.restaurants;
  for(var i = 0 ; i < location.length; i++ ){
    var marker = new google.maps.Marker({
      position: {lat: location[i][0].latitude, lng: location[i][0].longitude},
      map: map,
      title: restaurant[i][0].name,
      icon: {
      path: 'M22-48h-44v43h16l6 5 6-5h16z',  
      fillColor: '#697f8c',
      fillOpacity: 1,
      strokeColor: '#FFFFFF',
      strokeWeight: 5,
      labelClass: "label", 
      }
    }); 
  }
}
