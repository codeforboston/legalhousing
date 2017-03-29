var loadData = function(){
  $.ajax({
    type: 'GET',
    url: '/visualization.json',
    dataType: 'json',
    success: function(data){
      var listings = data.filter(function(point){
        return point.latitude;
      });
      drawPieChart(data);
      initMap(listings);
    },
    failure: function(result){
      alert('ERROR');
    }
  })
}

function initMap(listings) {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 3,
    center: {lat: 42.3601, lng: 71.0589}
  });

  // Create an array of alphabetical characters used to label the markers.
  var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  // Add some markers to the map.
  // Note: The code uses the JavaScript Array.prototype.map() method to
  // create an array of markers based on a given "locations" array.
  // The map() method here has nothing to do with the Google Maps API.
  var markers = listings.map(function(location, i) {
    var temp = {lat: parseFloat(location.latitude), lng: parseFloat(location.longitude)}
    return new google.maps.Marker({
      position: temp,
      label: labels[i % labels.length]
    });
  });

  // Add a marker clusterer to manage the markers.
  var markerCluster = new MarkerClusterer(map, markers,
      {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
}

function drawPieChart(data){
  d3plus.viz()
    .container("#viz")
    .data(data)
    .type("pie")
    .id("discriminatory")
    .size("id")
    .draw()
}

$(document).ready(function(){
  loadData();
})