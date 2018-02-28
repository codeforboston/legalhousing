// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var getFormData = function () {
	console.log("got into form data");
	var d1_start = document.getElementById("track-form").elements.namedItem("d1_start").value;;
	var d1_end = document.getElementById("track-form").elements.namedItem('d1_end').value;
	var d2_start = document.getElementById("track-form").elements.namedItem('d2_start').value;
	var d2_end = document.getElementById("track-form").elements.namedItem('d2_end').value;
	var phrase = document.getElementById("track-form").elements.namedItem('phrase_content').value;

	// dateRange = {
	//     d1_start : d1_start,
	//     d1_end : d1_end,
	//     d2_start : d2_start,
	//     d2_end : d2_end,
	//     phrase : phrase
	// };
	callTrackChanges(d1_start, d1_end, d2_start, d2_end, phrase);
};

function callTrackChanges(d1_s, d1_e, d2_s, d2_e, phrse) {
	$.ajax({
		type: 'POST',
		url: '/tools/trackchanges',
		data: {
			d1_start: d1_s,
			d1_end: d1_e,
			d2_start: d2_s,
			d2_end: d2_e,
			phrase: phrse
		},
		dataType: 'json',
		success: function (data) {
			displayResults(data);
		},
		failure: function (result) {
			alert('ERROR');
			console.log(result);
		}
	});
}

function displayResults(data) {
	console.log(data);
	console.log("getting display");
	// document.getElementById("num_list").innerHTML = stats.data.num_listings;

	// document.getElementById("num_disc").innerHTML = stats.data.num_discriminatory;

	var numListings1 = data.data.num_listings_1;
	var numDiscrim1 = data.data.num_listings_1_discrim;
	var numListings2 = data.data.num_listings_2;
	var numDiscrim2 = data.data.num_listings_2_discrim;

	document.getElementById("firstRangeResults").innerHTML = numListings1
	document.getElementById("firstRangeResultsDiscrim").innerHTML = numDiscrim1
	document.getElementById("secondRangeResults").innerHTML = numListings2;
	document.getElementById("secondRangeResultsDiscrim").innerHTML = numDiscrim2;

	var phrase = document.getElementById("track-form").elements.namedItem('phrase_content').value;

	document.getElementById("firstDiscrimLbl").innerHTML = "Total " + phrase + ":";
	document.getElementById("secondDiscrimLbl").innerHTML = "Total " + phrase + ":";
	document.getElementById("statsDiscrimLbl").innerHTML = "Percent Change in " + phrase + ":";


	var strListingsChange = "";

	if ((numListings1 > 0) && (numListings2 > 0)) {
		if (numListings1 > numListings2) {
			strListingsChange = "-" + (numListings1 / numListings2 * 100).toString() + "%";
		}
		else {
			strListingsChange = (numListings2 / numListings1 * 100).toString() + "%";
		}
	}
	else {
		strListingsChange = "N/A";
	}

	document.getElementById("ListingsChange").innerHTML = strListingsChange;

	var strDiscrimChange = "";

	if ((numDiscrim1 > 0) && (numDiscrim2 > 0)) {
		if (numDiscrim1 > numDiscrim2) {
			strDiscrimChange = "-" + (numDiscrim1 / numDiscrim2 * 100).toString() + "%";
		}
		else {
			strDiscrimChange = (numDiscrim2 / numDiscrim1 * 100).toString() + "%";
		}
	}
	else {
		strDiscrimChange = "N/A";
	}

	document.getElementById("DiscriminatoryChange").innerHTML = strDiscrimChange;
}
