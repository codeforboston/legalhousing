var map;
var markers;

function getmarkers() {
  $.ajax({
    type: 'POST',
    dataType: 'json',
    url: '/mappoints.json',
    success: function({data}) {
      addmarkers(data);
      console.log(data);
    }
  });
};

function addmarkers(data) {
  var markers = [];
  for( i = 0; i < data.length; i++ ) {
    var position = new google.maps.LatLng(data[i][1], data[i][2]);
    console.dir(position)
    var marker = new google.maps.Marker({
      position: position,
      map: map,
      title: data[i][0]
    });
    markers.push(marker);
  };

  fitToMarkers(markers);
};

function fitToMarkers(markers) {
  var bounds = new google.maps.LatLngBounds();

  bounds.extend(new google.maps.LatLng('42.6000', '-71.2356'));
  bounds.extend(new google.maps.LatLng('42.0000', '-72.2781'));

  for (var i = 0; i < markers.length; i++) {
    bounds.extend(markers[i].position);
  }
  map.setCenter(bounds.getCenter());
  map.fitBounds(bounds);
}

jQuery(function($) {
  var script = document.createElement('script');
  script.src = "//maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
  document.body.appendChild(script);
});

function initialize() {
  var bounds = new google.maps.LatLngBounds();
  var mapOptions = {
    mapTypeId: 'roadmap'
  };

  map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  map.setTilt(45);
  map.setCenter(new google.maps.LatLng(42.3601, -71.0589));

  var infoWindow = new google.maps.InfoWindow(),
  marker, i;

  getmarkers()

  var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
    this.setZoom(14);
    google.maps.event.removeListener(boundsListener);
  });

}
