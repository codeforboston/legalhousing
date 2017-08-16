var loadData = function(){
  $.ajax({
    type: 'GET',
    url: '/visualization.json',
    async: false,
    dataType: 'json',
    success: function(data){
      drawPieChart(data);
      console.log('success');
    },
    failure: function(result){
      alert('ERROR');
    }
  })
}
function drawPieChart(data){
  var discriminatoryData = data.filter(function (datum) {
    return datum.discriminatory;
  });
  var groupedData = [
    { label: "Discriminatory", size: discriminatoryData.length },
    { label: "Non-Discriminatory", size: data.length - discriminatoryData.length }
  ];
  d3plus.viz()
    .container("#viz")
    .data(groupedData)
    .type("pie")
    .id("label")
    .size("size")
    .draw();
}
$(document).ready(function(){
  loadData();
})
