$(document).ready(function () {
  //Dishes sort by price or ratings  
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
    //Dishes sort by given rating value 
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
    //Hide dietary drop down list
    $(document).on('click', function (event) {
        if (!$(event.target).closest('.selectBox').length) {
            if (!$(event.target).closest('#checkboxes').length) {
                $('#checkboxes').hide();
            }
        }
    });
    //focus for seach text field
    $('#s').click(function() {
        $('html, body').animate({scrollTop: 0 }, 'slow');
        $('.food_search').focus();
    });
    //scroll down 
    $("#c").click(function(){
        $('html, body').animate({scrollTop:$(document).height()}, 'slow');
    });
    google.maps.event.addDomListener(window, 'load', initMap);
});
//Get values from URL
function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}
//show and hide the deitary drop down box
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
//Dishes sory by dietary
function Dietary() {
    var category = [];
    $.each($("input[type='checkbox']:checked"), function(){            
        category.push($(this).val());
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
//Markers for given Restaurant location
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'),{
        center: {lat: 16.9891, lng: 82.2475} ,
        zoom: 14,
    });
    var location = gon.locations;
    var restaurant = gon.restaurants;
    var pictures = gon.pictures;
    var dishes = gon.dishes_count;
    var infowindow = new google.maps.InfoWindow()
    for(var i = 0 ; i < location.length; i++ ) {
            var marker = new google.maps.Marker({
            position: {lat: location[i][0].latitude, lng: location[i][0].longitude},
            map: map,
            title: restaurant[i][0].name,
            label: {
                 color: 'white',
                 fontWeight: 'bold',
                 text: ''+dishes[i],
               },
            icon: {
            path: 'M22-48h-44v43h16l6 5 6-5h16z',  
            fillColor: '#697f8c',
            fillOpacity: 1,
            strokeColor: '#FFFFFF',
            strokeWeight: 5,
            labelClass: "label",
            labelOrigin: new google.maps.Point(0, -27), 
            }
        }); 
        var content = '<div><img src='+pictures[i][0].name.url+' style="width:300px;height: 300px;"></div><div class="map-restaurant">'+restaurant[i][0].name+'</div><div>'+location[i][0].street+', '+location[i][0].city+', '+location[i][0].state+',<br/ >'+location[i][0].pincode+', '+location[i][0].country+'</div>';     
        google.maps.event.addListener(marker,'click', (function(marker,content,infowindow, i){ 
        	return function() {
           		infowindow.setContent(content);
           		infowindow.open(map,marker);
                var res = restaurant[i][0].id;
                console.log('res', res)
                $.ajax({
                    type: "GET",
                    url: $(this).attr('href'),
                    data: {restaurant: res},
                    dataType: "script",
                    success: function () {
                    }
                });
        	};
       	})(marker,content,infowindow, i)); 
    }
}