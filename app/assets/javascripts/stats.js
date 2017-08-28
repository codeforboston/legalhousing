// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.




var getStats = function(){
  var e = document.getElementById('date_range');
  var dateRange = e.options[e.selectedIndex].value;
  if (!dateRange) {
    return;
  }
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
       //displayStats(data);
       drawPieChart(data);
       drawBarChart(data);
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

function drawPieChart(stats){
  $(function () {
    const totalCount = stats.data.num_listings;
    const discriminatoryCount = stats.data.num_discriminatory;
    const nonDiscriminatoryCount = totalCount - discriminatoryCount;

    var myChart = Highcharts.chart('pie-chart-container', {
      chart: {
        type: 'pie'
      },
      credits: {
        enabled: false
      },
      title: {
        text: 'Statistics'
      },
      series: [{
        data: [
          { name: 'Discriminatory Listings', y: discriminatoryCount },
          { name: 'Non-Discriminatory Listings', y: nonDiscriminatoryCount }
        ]
      }]
    });
  });
}

function drawBarChart(stats){
  $(function () {
    const series = _.compact(_.map(stats.data.discriminatory_phrase_count, function (count, phrase) {
      return { phrase: phrase, count: count };
    }));
    const topPhrases = _.take(_.orderBy(series, ['count'], ['desc']), 20);

    var myChart = Highcharts.chart('bar-chart-container', {
      chart: {
        type: 'bar'
      },
      credits: {
        enabled: false
      },
      legend: {
        enabled: false
      },
      title: {
        text: 'Most common discriminatory phrases'
      },
      xAxis: {
        categories: _.map(topPhrases, 'phrase')
      },
      yAxis: {
        title: {
          text: 'Count of discriminatory phrase'
        }
      },
      series: [{
        data: _.map(topPhrases, 'count')
      }]
    });
  });
}
