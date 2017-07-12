// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var getStats = function(){
  var e = document.getElementById('date_range');
  var dateRange = e.options[e.selectedIndex].value;
  getStatsApi(dateRange);
};

function getStatsApi(dateRange)
 {
   $.ajax({
     type: 'POST',
     url: '/tools/stats.json',
     data: {token: dateRange},
     async: false,
     dataType: 'json',
     success: function(data){
       displayStats(data);
     },
     failure: function(result){
       alert('ERROR');
     }
   });
 }
function displayStats(stats) {
  console.log(stats);
  document.getElementById("num_list").innerHTML = stats.data.num_listings;
  document.getElementById("num_disc").innerHTML = stats.data.num_discriminatory;
}
