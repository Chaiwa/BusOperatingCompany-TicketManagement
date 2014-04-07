//For Add from Admin Panel
function doAddObject(formId) {
	// Controls from regExControls.js
	if (usual != true && password != true && capacity != true && year != true
			&& plate != true && name != true && phone != true
			&& usualName != true && price != true && number != true
			&& idNumber != true && date != true && time != true) {
		formId = document.getElementById(formId);
		var checkFields = false;
		var path = "AddObject?";
		for (var i = 0, l = formId.elements.length; i < (l); i++) {
			var element = formId.elements[i];
			if (i == 0) {
				if (element.name != "" && element.value != "") {
					path = path + element.name + "="
							+ element.value.toLowerCase();
				}
			} else {
				if (element.name != "" && element.value != "") {
					if (element.name == "gender") {
						if (element.checked == true) {
							path = path + "&" + element.name + "="
									+ element.value.toLowerCase();
						}
					} else {
						path = path + "&" + element.name + "="
								+ element.value.toLowerCase();
					}
				}
				if (element.value == "" && checkFields == false) {
					checkFields = true;
				}
			}
		}
		if (checkFields == false) {
			if (window.XMLHttpRequest) {

				xmlhttp = new XMLHttpRequest();
			} else {

				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {

				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

					alert(xmlhttp.responseText);

				}
			};
			xmlhttp.open("GET", path, true);
			xmlhttp.send();
		} else {
			alert("Please Fill All Fields...");
		}
	} else {
		alert("Enter Valid Value ! ");
	}

}

// For Search
function doListObject(formId) {
	// Controls from regExControls.js
	if (usual != true && password != true && capacity != true && year != true
			&& plate != true && name != true && phone != true
			&& usualName != true && price != true && number != true
			&& idNumber != true && date != true && time != true) {
		formId = document.getElementById(formId);
		var path = "ListObject?";
		for (var i = 0, l = formId.elements.length; i < (l - 1); i++) {
			var element = formId.elements[i];
			if (i == 0) {
				if (element.name != "" && element.value != "") {
					path = path + element.name + "="
							+ element.value.toLowerCase();
				}
			} else {
				if (element.name != "" && element.value != "") {
					if (element.name == "gender") {
						if (element.checked == true) {
							path = path + "&" + element.name + "="
									+ element.value.toLowerCase();
						}
					} else {
						path = path + "&" + element.name + "="
								+ element.value.toLowerCase();
					}
				}
			}

		}
		document.location = path;
	} else {
		alert("Enter Valid Value ! ");
	}
}
// For Journey and Ticket Operation

function doGetSeat(routeStationId, journeyId) {

	var journey = journeyId.split(".")[1];
	var routeStation = routeStationId.split(".")[1];

	var path = "GetSeat?routeStationId=" + routeStation + "&" + "journeyId="
			+ journey;

	if (window.XMLHttpRequest) {

		xmlhttp = new XMLHttpRequest();
	} else {

		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

			document.getElementById("responseAJAX").innerHTML = xmlhttp.responseText;

		}
	};
	xmlhttp.open("GET", path, true);
	xmlhttp.send();

}
// To Search Journey
function doSearchJourney(formId) {
	formId = document.getElementById(formId);
	var path = "SearchJourney?";
	for (var i = 0, l = formId.elements.length; i < (l - 1); i++) {
		var element = formId.elements[i];
		if (i == 0) {
			path = path + element.name + "=" + element.value.toLowerCase();
		} else {
			if (element.name != "" && element.value != "") {
				if (element.name == "gender") {
					if (element.checked == true) {
						path = path + "&" + element.name + "="
								+ element.value.toLowerCase();
					}
				} else {
					path = path + "&" + element.name + "="
							+ element.value.toLowerCase();
				}
			}
		}

	}

	document.location = path;

}
// To Delete searched Records
function doDeleteObject(fid, id) {

	var path = "DeleteObject?fid=" + fid + "&id=" + id;

	if (window.XMLHttpRequest) {

		xmlhttp = new XMLHttpRequest();
	} else {

		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

			alert(xmlhttp.responseText);
			document.location("search.jsp");

		}
	};
	xmlhttp.open("GET", path, true);
	xmlhttp.send();
}
// To Update searched Records
function doUpdateObject(fid, ids) {
	// Controls from regExControls.js
	if (usual != true && password != true && capacity != true && year != true
			&& plate != true && name != true && phone != true
			&& usualName != true && price != true && number != true
			&& idNumber != true && date != true && time != true) {
		var path = "UpdateObject?fid=" + fid;
		var idArray = ids.split("-");

		for (var i = 0; i < idArray.length; i++) {
			element = document.getElementById(idArray[i]);
			path = path + "&" + idArray[i].split(".")[0] + "="
					+ element.value.toLowerCase();
		}

		if (window.XMLHttpRequest) {

			xmlhttp = new XMLHttpRequest();
		} else {

			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {

			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				alert(xmlhttp.responseText);

			}
		};
		xmlhttp.open("GET", path, true);
		xmlhttp.send();
	} else {
		alert("Enter Valid Value ! ");
	}
}