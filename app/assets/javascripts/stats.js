// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


var trackChanges = function(){
  $.ajax({
      type: 'POST',
      url: '/tools/track_changes.json',
      data: {data: "startdata"},
      async: false,
      dataType: 'json',
      success: function(data) {
        console.log(data);
      },
      failure: function(result){
        console.log(data);
      }
  });
};


var getStats = function(){
  $.ajax({
    type: 'POST',
    url: '/tools/stats',
    data: {token: "3m"},
    async: false,
    dataType: 'json',
    success: function(data){
      console.log(data);
    },
    failure: function(result){
      alert('ERROR');
    }
  });
};
