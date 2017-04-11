var loadData = function(){
  $.ajax({
    type: 'GET',
    url: '/visualization.json',
<<<<<<< HEAD
    dataType: 'json',
    success: function(data){
      var listings = data.filter(function(point){
        return point.latitude && point.discriminatory;
      });
      drawPieChart(data);
      initMap(listings);
=======
    async: false,
    dataType: 'json',
    success: function(data){
      drawPieChart(data);
      console.log('success');
>>>>>>> 75b202216ef012d61be355621f9a8ccfcaae61fb
    },
    failure: function(result){
      alert('ERROR');
    }
  })
}
<<<<<<< HEAD

function initMap(listings) {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 11,
    center: {lat: 42.3601, lng: -71.0589}
  });
  var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  if (listings) {
    var markers = listings.map(function(location, i) {
      var temp = {lat: parseFloat(location.latitude), lng: parseFloat(location.longitude)}
      return new google.maps.Marker({
        position: temp,
        label: labels[i % labels.length]
      });
    });
    var geoJson = [];
    for (var listing in listings) {
      var temp = {
        type: 'Feature',
        geometry: {type: 'Point', coordinates: [parseInt(listing.latitude, 10), parseInt(listing.longitude, 10)]},
        properties: {name: 'address: ' + listing.address}
      }
      geoJson.push(temp);
    }
    map.data.addGeoJson({type: 'FeatureCollection', features: geoJson});

    var coordsDiv = document.getElementById('coords');
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(coordsDiv);
    map.addListener('mousemove', function(event) {
      coordsDiv.textContent =
          'lat: ' + Math.round(event.latLng.lat()) + ', ' +
          'lng: ' + Math.round(event.latLng.lng());
    });
  }
  var markerCluster = new MarkerClusterer(map, markers,
      {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
}

=======
>>>>>>> 75b202216ef012d61be355621f9a8ccfcaae61fb
function drawPieChart(data){
  d3plus.viz()
    .container("#viz")
    .data(data)
    .type("pie")
    .id("discriminatory")
    .size("id")
    .draw()
}
<<<<<<< HEAD

$(document).ready(function(){
  loadData();
})
=======
$(document).ready(function(){
  loadData();
})
>>>>>>> 75b202216ef012d61be355621f9a8ccfcaae61fb
