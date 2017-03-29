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
