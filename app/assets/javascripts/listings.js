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
        latitudeItem = document.getElementsByClassName('latitude-item'),
        descriptionItem = document.getElementsByClassName('description-item');

    function sortItem(it){
        var newArr = [];
        for(i = 0; i < it.length; i++){
            newArr.push(it[i].innerHTML);
        }
        newArr.sort();
    };
    latitudeLabel.addEventListener('click', sortItem(descriptionItem));
});
