// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
    var headingLabel = document.getElementsByClassName('heading-label')[0],
        dateTimeLabel = document.getElementsByClassName('date-time-label')[0],
        addressLabel = document.getElementsByClassName('address-label')[0],
        latitudeLabel = document.getElementsByClassName('latitude-label')[0],
        longitudeLabel = document.getElementsByClassName('longitude-label')[0],
        descriptionLabel = document.getElementsByClassName('description-label')[0],
        descriminatoryLabel = document.getElementsByClassName('descriminatory-label')[0],
        latitudeItem = document.getElementsByClassName('latitude-item')[0],
        descriptionItem = document.getElementsByClassName('description-item')[0],
        descriminatoryItem = document.getElementsByClassName('descriminatory-item')[0],
        housingColumn = document.getElementsByClassName('housing-column'),
        showDiscriminatory = true;
    // function sortItem(it){
    //   // Place all rows in an array
    //   // call a sort method on the array
    //     var newArr = [];
    //     for(i = 0; i < it.length; i++){
    //         newArr.push(it[i].innerHTML);
    //     }
    //
    // };
    // function showHideDiscriminatory()

    function showHideDiscriminatory(){
      newArr = [];
      document.getElementsByClassName('descriminatory-item')[i].innerHTML
      if (showDiscriminatory) {
        for (i = 0; i < housingColumn.length; i++){
            if (document.getElementsByClassName('descriminatory-item')[i].innerHTML === 'true') {
              housingColumn[i].className += ' hidden';
            } else {
              housingColumn[i].className;
            }
         }
      } else {
        for (i = 0; i < housingColumn.length; i++){
              housingColumn[i].className = 'housing-column';
            }
         }
      showDiscriminatory = !showDiscriminatory;
      console.log(showDiscriminatory);
    }

    document.getElementById('click-button').addEventListener('click', showHideDiscriminatory);

    // latitudeLabel.addEventListener('click', sortItem((housingColumn)));
});
