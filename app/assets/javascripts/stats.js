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
  var phrase_count_list = document.getElementById("phrase_count_list");
  
  // Clear out any old results in the phrase count display
  while (phrase_count_list.firstChild) {
    phrase_count_list.removeChild(phrase_count_list.firstChild);
  }

  for (key in stats.data.discriminatory_phrase_count) {
    phrase = key + ": " + stats.data.discriminatory_phrase_count[key]
    var entry = document.createElement('li');
    entry.appendChild(document.createTextNode(phrase));
    phrase_count_list.appendChild(entry);
  }
}
