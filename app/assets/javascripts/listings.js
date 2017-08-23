var loadData = function(){
  if (window.location.pathname !== '/tools/stats') {
    // XXX hackish. Best if this script only ran on the stats page.
    return;
  }

  $.ajax({
    type: 'GET',
    url: '/tools/stats.json',
    async: false,
    method: 'POST',
    data: { token: '5y' },
    dataType: 'json',
    success: function(data){
      console.log('success', data);
      drawPieChart(data);
    },
    failure: function(result){
      alert('ERROR');
    }
  })
}
function drawPieChart(data){
  $(function () {
    const series = _.compact(_.map(data.data.discriminatory_phrase_count, function (count, phrase) {
      return { phrase: phrase, count: count };
    }));
    const topPhrases = _.take(_.orderBy(series, ['count'], ['desc']), 20);

    var myChart = Highcharts.chart('container', {
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
        text: 'Most common phrases'
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

  /*
  var discriminatoryData = data.filter(function (datum) {
    return datum.discriminatory;
  });
  var discriminatoryCount = discriminatoryData.length;
  var nonDiscriminatoryCount = data.length - discriminatoryCount;
  var discriminatoryPercent = (100 * discriminatoryCount / data.length).toFixed(0) + "%";
  var nonDiscriminatoryPercent = (100 * nonDiscriminatoryCount / data.length).toFixed(0) + "%";
  var groupedData = [
    {
      label: "Discriminatory (" + discriminatoryPercent + ")",
      size: discriminatoryCount
    },
    {
      label: "Non-Discriminatory (" + nonDiscriminatoryPercent + ")",
      size: nonDiscriminatoryCount
    }
  ];
  d3plus.viz()
    .container("#viz")
    .data(groupedData)
    .type("pie")
    .id("label")
    .size("size")
    .draw();
  */
}
$(document).ready(function(){
  loadData();
})
