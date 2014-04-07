
//Checking for add and search
var usual,password,capacity,year,plate,name,phone,usualName,price,number,idNumber,date,time;
//For all general inputs
function usualControl(username){
	var exp = new RegExp(/^[0-9a-zA-Z-_*\u00F6\u015F\u00FC\u0131\u00E7\u015E\u00C7\u00DC\u0130\u00D6\u011E\u011F]+$/);
	if(!exp.test(username)){
		usual=true;
		alert("User Name should include (0-9),(a-z),(A-Z) and (-_*) characters !");
	}
	else{
		usual=false;
	}
}
//For Login
function passwordControl(passwor){
	var exp = new RegExp("^[0-9a-zA-Z!@#$%^&*_-\u00F6\u015F\u00FC\u0131\u00E7\u015E\u00C7\u00DC\u0130\u00D6\u011E\u011F]{6,20}$");
	if(!exp.test(passwor)){
		password=true;
		alert("Password should be at least 6 characters and shouldn't include special characters\n EXCEPT '!@#$%^&*_-'");
	}
	else{
		password=false;
	}
	
}
//Bus Controls
function capacityControl(capacit){
	var exp = new RegExp("^[0-9]{2}$");
	if(!exp.test(capacit)){
		capacity=true;
		alert("The Capacity should be at least 10 and less than 100 !");
	}
	else{
		capacity=false;
	}
}
function yearControl(yea){
	var exp = new RegExp("^[0-9]{4}$");
	if(!exp.test(yea)){
		year=true;
		alert("Year should be like 'YYYY' with numbers !");
	}
	else{
		year=false;
	}
}
function plateControl(plat){
	var exp = new RegExp("^([0-9]{2})([a-zA-Z\u00F6\u015F\u00FC\u0131\u00E7\u015E\u00C7\u00DC\u0130\u00D6\u011E\u011F]{1,3})([0-9]{1,4})$");
	if(!exp.test(plat)){
		plate=true;
		alert("Plate should be like '34abc01' or '(2 Number)(1-3 Letter)(1-4 Number)' !")
	}
	else{
		plate=false;
	}
}
//For people information
function nameControl(nam){
	var exp = new RegExp("^([a-zA-Z\u00F6\u015F\u00FC\u0131\u00E7\u015E\u00C7\u00DC\u0130\u00D6\u011E\u011F])[a-z\\sA-Z()\u00F6\u015F\u00FC\u0131\u00E7\u015E\u00C7\u00DC\u0130\u00D6\u011E\u011F]+$");
	if(!exp.test(nam)){
		name=true;
		alert("Value Should include only a-z and A-Z !");
	}
	else{
		name=false;
	}
}
function phoneControl(phon){
	var exp = new RegExp("^[+][0-9]{11,12}$");
	if(!exp.test(phon)){
		phone=true;
		alert("Phone Must be like +905454515151 !");
	}
	else{
		phone=false;
	}
}
//For branch information
function usualNameControl(nam){
	var exp = new RegExp("^([0-9a-zA-Z\u00F6\u015F\u00FC\u0131\u00E7\u015E\u00C7\u00DC\u0130\u00D6\u011E\u011F])([0-9a-zA-Z-._*\\s()\u00F6\u015F\u00FC\u0131\u00E7\u015E\u00C7\u00DC\u0130\u00D6\u011E\u011F])+$");
	if(!exp.test(nam)){
		
		usualName=true;
		alert("Value should include only 0-9,a-z,A-Z and '-.*_' and white spaces");
	}
	else{
		usualName=false;
	}
}
//For price
function priceControl(pric){
	var exp = new RegExp("^([0-9]*)([.]?)[0-9]+$");
	if(!exp.test(pric)){
		price=true;
		alert("Price should be like this format : '15.26' or '15'");
	}
	else{
		price=false;
	}
}
//For Journey and driver
function numberControl(numbe){
	var exp = new RegExp("^[0-9]+$");
	if(!exp.test(numbe)){
		number=true;
		alert("Value should be number ! ");
	}
	else{
		number=false;
	}
}
function idNumberControl(number){
	var exp = new RegExp("^[0-9]{11}$");
	if(!exp.test(number)){
		idNumber=true;
		alert("Value should be number and 11 length ! ");
	}
	else{
		idNumber=false;
	}
}
//Date and Time Control
function dateControl(dat){
	var exp = new RegExp("^((([0-2])([0-9]))|(([3])([0-1])))-((([0])([0-9]))|(([1])([0-2])))-" +
			"(([2])([0-9]{3}))$");
	if(!exp.test(dat)){
		date=true;
		alert("Date format should be like : dd-MM-yyy !");
	}
	else{
		date=false;
	}
}
function timeControl(tim){
	var exp = new RegExp("^((([0-1])([0-9]))|(([2])([0-3]))):(([0-5])([0-9])):(([0-5])([0-9]))$");
	if(!exp.test(tim)){
		time=true;
		alert("Time format should be like : hh:mm:ss !");
	}
	else{
		time=false;
	}
}
//Div controls to Show
function showDiv(id){
	var element = document.getElementById(id);
	switch(id){
	case "stationDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		
		break;
	case "busDiv" :
		document.getElementById("stationDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		break;
	case "branchDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("stationDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		break;
	case "journeyDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("stationDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		break;
	case "routeDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("stationDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		break;
	case "routeStationDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("stationDiv").style.display="none";
		element.style.display="inline";
		break;
	case "passengerDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("stationDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		break;
	case "employeeDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("driverDiv").style.display="none";
		document.getElementById("stationDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		break;
	case "driverDiv" :
		document.getElementById("busDiv").style.display="none";
		document.getElementById("branchDiv").style.display="none";
		document.getElementById("passengerDiv").style.display="none";
		document.getElementById("journeyDiv").style.display="none";
		document.getElementById("stationDiv").style.display="none";
		document.getElementById("employeeDiv").style.display="none";
		document.getElementById("routeDiv").style.display="none";
		document.getElementById("routeStationDiv").style.display="none";
		element.style.display="inline";
		break;
	}
	
}