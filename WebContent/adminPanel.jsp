<%@page import="sos.pojo.dto.Bus"%>
<%@page import="sos.pojo.dto.Driver"%>
<%@page import="sos.pojo.dto.Branch"%>
<%@page import="sos.services.DbOperation"%>
<%@page import="sos.pojo.dto.Route"%>
<%@page import="sos.pojo.dto.Station"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sos.services.utility.Util"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% if(session.getAttribute("Admin")!=null){ %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
	<title>ADMIN PANEL</title>
    <link href="style.css" media="screen" rel="stylesheet"/>
   	
    <script type="text/javascript" src="jScripts/regExControls.js"></script>
    <script type="text/javascript" src="jScripts/CRUD.js"></script>
</head>

<body>
	<div id='wrapper'>
    
    	<!-- Menu -->
    	<div id='menu'>
        	<div id='left-corner'></div>
            <div id='middle-box'>
            	<ul>
                	<li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="logout">LOGOUT</a></li>
                </ul>
            </div>
            <div id='right-corner'></div>
            <div style="clear:both;"></div>
        </div>
        
        
        <!-- banner -->
        
        <div>
        	<p></p>
        		<input type="button" value="STATION OPERATIONS"  onclick="showDiv('stationDiv')" class="btnClass"/>
                <input type="button" value="ROUTE OPERATIONS" onclick="showDiv('routeDiv')" class="btnClass" />
                <input type="button" value="ROUTE STATION OPS" onclick="showDiv('routeStationDiv')" class="btnClass"/>
                <input type="button" value="DRIVER OPERATIONS" onclick="showDiv('driverDiv')" class="btnClass"/>
                <input type="button" value="BUS OPERATIONS" onclick="showDiv('busDiv')" class="btnClass"/><br/><br/>
                <input type="button" value="BRANCH OPERATIONS" onclick="showDiv('branchDiv')" class="btnClass"/>
                <input type="button" value="BRANCH EMPLOYEE OPS" onclick="showDiv('employeeDiv')" class="btnClass"/>
                <input type="button" value="PASSENGER OPERATIONS" onclick="showDiv('passengerDiv')" class="btnClass"/>
                <input type="button" value="JOURNEY OPERATIONS" onclick="showDiv('journeyDiv')" class="btnClass"/>
                
            <p></p>
        </div>
        
        <!-- Content -->
        <div id='big-content'>
        	<div id='top-content'>
            		
              </div>
            </div>
            <div id='content'>
            	<div id="stationDiv" style="display:none">
                    	<p><b>Station Operations<b></p>
						<form id="station" >
                        	Station Name :
							<input type="hidden" name="fid" value="1"/> 
							<input type="text" name="name" id="name" placeholder="Station Name" onblur='usualNameControl(this.value)'/>
	
							<input type="button" value="Add" onclick="doAddObject('station')" class="btnClass"/>
							<input type="button" value="Search" onclick="doListObject('station')" class="btnClass"/>
						</form>
                    </div>
                    <div id="busDiv" style="display:none">
                        <form id="bus">
                        	<input type="hidden" name="fid" value="5"/> 
                        	<table class="cssTable">
                        	<tr><td>Bus Operations</td><td></td></tr>
								<tr>
                                	<td>Brand :</td>
                                    <td><input type="text" name="brand" id="brand" placeholder="Bus Brand" onblur="usualControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Capacity :</td>
                                    <td><input type="text" name="capacity" id="capacity" placeholder="Bus Capacity" onblur="capacityControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Model :</td>
                                    <td><input type="text" name="model" id="model" placeholder="Bus Model" onblur="usualControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Model Year :</td>
                                    <td><input type="text" name="modelYear" id="modelYear" placeholder="Bus Model Year" onblur="yearControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Plate :</td>
                                    <td><input type="text" name="plate" id="plate" placeholder="Bus Plate" onblur="plateControl(this.value)"/></td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('bus')" class="btnClass"/>
                                	<input type="button" value="Search" onclick="doListObject('bus')" class="btnClass"/>
                                </td>
                                </tr>
                            </table>    
                        </form>
                    </div>
                    <div id="passengerDiv" style="display:none">
                        <form id="passenger">
                            <input type="hidden" name="fid" value="2"/>
                            <table class="cssTable">
                            <tr><td>Passenger Operations</td><td></td></tr>
								<tr>
                                	<td>Name :</td>
                                    <td><input type="text" name="name" id="name" placeholder="Passenger Name" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Surname :</td>
                                    <td><input type="text" name="surname" id="surname" placeholder="Passenger Surname" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Phone :</td>
                                    <td><input type="text" name="phone" id="phone" placeholder="Passenger Phone" onblur="phoneControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Gender :</td>
                                    <td><input type="radio" name="gender" value="Male" checked/>Male
                            			<input type="radio" name="gender" value="Female"/>Female<br/>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('passenger')" class="btnClass"/>
                                	<input type="button" value="Search" onclick="doListObject('passenger')" class="btnClass"/>
                                </td>
                                </tr>
                            </table> 
                        </form>
                    </div>
                    <div id="branchDiv" style="display:none">
                        <form id="branch">
                            <input type="hidden" name="fid" value="6"/>
                            <table class="cssTable">
                            <tr><td>Branch Operations</td><td></td></tr>
								<tr>
                                	<td>Name :</td>
                                    <td><input type="text" name="branchName" id="branchName" placeholder="Branch Name" onblur="usualNameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Country :</td>
                                    <td><input type="text" name="country" id="country" placeholder="Branch Country" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>City :</td>
                                    <td><input type="text" name="city" id="city" placeholder="Branch City" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>County :</td>
                                    <td><input type="text" name="county" id="county" placeholder="Branch County" onblur="usualNameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>District :</td>
                                    <td><input type="text" name="district" id="district" placeholder="Branch District" onblur="usualNameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Phone :</td>
                                    <td><input type="text" name="phone" id="phone" placeholder="Branch Phone" onblur="phoneControl(this.value)"/></td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('branch')" class="btnClass"/>
                                	<input type="button" value="Search" onclick="doListObject('branch')" class="btnClass"/>
                                </td>
                                </tr>
                            </table>  
                        </form>
                    </div>
                    <div id="employeeDiv" style="display:none">
                        <form id="userEmployee" >
                            <input type="hidden" name="fid" value="9"/>
                            <table class="cssTable">
                            <tr><td>User Employee Operations</td><td></td></tr>
								<tr>
                                	<td>Name :</td>
                                    <td><input type="text" name="name" id="name" placeholder="Employee Name" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Surname :</td>
                                    <td><input type="text" name="surname" id="surname" placeholder="Employee Surname" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Phone :</td>
                                    <td><input type="text" name="phone" id="phone" placeholder="Employee Phone" onblur="phoneControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>User Name :</td>
                                    <td><input type="text" name="username" id="username" placeholder="Employee User Name" onblur="usualControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Password :</td>
                                    <td><input type="text" name="password" id="password" placeholder="Employee Password" onblur="passwordControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Branch :</td>
                                    <td><select name="branchId" id="branchId">
                                        <% DbOperation dbOperation=new DbOperation();
                                        ArrayList<Object> branches = dbOperation.getBranchNames();
                                        ArrayList<Branch> branch = new ArrayList<Branch>();
                                        for (Object o : branches ){branch.add(((Branch)(o)));}
                                        request.setAttribute("branch", branch);
                                        %>
                                        <c:forEach items="${branch}" var="item">
                                        <option value="${item.getId() }">${item.getBranchName() }</option>
                                        </c:forEach>
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('userEmployee')" class="btnClass"/>
                                	<input type="button" value="Search" onclick="doListObject('userEmployee')" class="btnClass"/>
                                </td>
                                </tr>
                            </table>   
                        </form>
                    </div>
                    <div id="routeDiv" style="display:none">
                        <form id="route" >
                            <input type="hidden" name="fid" value="7"/>
                            <table class="cssTable">
                            <tr><td>Route Operations</td><td></td></tr>
								<tr>
                                	<td>Name :</td>
                                    <td><input type="text" name="routeName" id="routeName" placeholder="Route Name" onblur="usualNameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>From :</td>
                                    <td><select name="fStationId" id="fStationId">
                                        <% 
                                        ArrayList<Object> stations = dbOperation.getStationNames();
                                        ArrayList<Station> station = new ArrayList<Station>();
                                        for (Object o : stations ){station.add(((Station)(o)));}
                                        request.setAttribute("station", station);
                                        %>
                                        
                                        <c:forEach items="${station}" var="item">
                                        <option value="${item.getId() }">${item.getName() }</option>
                                        </c:forEach>
                                        
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                	<td>To :</td>
                                    <td><select name="tStationId" id="tStationId">
                                        
                                        <c:forEach items="${station}" var="item">
                                        <option value="${item.getId() }">${item.getName() }</option>
                                        </c:forEach>
                                        
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('route')" class="btnClass"/>
                                	<input type="button" value="Search" onclick="doListObject('route')" class="btnClass"/>
                                </td>
                                </tr>
                            </table>  
                        </form>
                    </div>
                    <div id="routeStationDiv" style="display:none">
                        <form id="routeStation" >
                            <input type="hidden" name="fid" value="8"/> 
                            <table class="cssTable">
                            <tr><td>Route Station Operations</td><td></td></tr>
								<tr>
                                	<td>Name :</td>
                                    <td><input type="text" name="routeStationName" id="routeStationName" placeholder="Route Station Name" onblur="usualNameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Route :</td>
                                    <td><select name="routeId" id="routeId">
                                        <% ArrayList<Object> routes = dbOperation.getRouteNames();
                                        ArrayList<Route> route = new ArrayList<Route>();
                                        for (Object o : routes ){route.add(((Route)(o)));}
                                        request.setAttribute("route", route);
                                        %>
                                        
                                        <c:forEach items="${route}" var="item">
                                        <option value="${item.getId() }">${item.getRouteName() }</option>
                                        </c:forEach>
                                        
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                	<td>Stop :</td>
                                    <td><select name="stopId" id="stopId">
                                        <c:forEach items="${station}" var="item">
                                        <option value="${item.getId() }">${item.getName() }</option>
                                        </c:forEach>
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                	<td>Price :</td>
                                    <td><input type="text" name="price" id="price" placeholder="Price" onblur="priceControl(this.value)"/></td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('routeStation')" class="btnClass"/>
                                	<input type="button" value="Search" onclick="doListObject('routeStation')" class="btnClass"/>
                                </td>
                                </tr>
                            </table>  
                        </form>
                    </div>
                    <div id="journeyDiv" style="display:none">
                        <form id="journey" >
                            <input type="hidden" name="fid" value="10"/>
                            <table class="cssTable">
                            <tr><td>Journey Operations</td><td></td></tr>
								<tr>
                                	<td>Name :</td>
                                    <td><input type="text" name="journeyNo" id="journeyNo" placeholder="Journey Number" onblur="numberControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Route :</td>
                                    <td><select name="routeId" id="routeId">
                                        <c:forEach items="${route}" var="item">
                                        <option value="${item.getId() }">${item.getRouteName() }</option>
                                        </c:forEach>
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                	<td>Bus :</td>
                                    <td><select name="busId" id="busId">
                                        <% ArrayList<Object> busses = dbOperation.getBusNames();
                                        ArrayList<Bus> bus = new ArrayList<Bus>();
                                        for (Object o : busses ){bus.add(((Bus)(o)));}
                                        request.setAttribute("bus", bus);
                                        %>
                                        <c:forEach items="${bus}" var="item">
                                        <option value="${item.getId() }">${item.getPlate() }</option>
                                        </c:forEach>
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                	<td>Driver1 :</td>
                                    <td><select name="driverId1" id="driverId1">
                                        <% ArrayList<Object> drivers = dbOperation.getDriverNames();
                                        ArrayList<Driver> driver = new ArrayList<Driver>();
                                        for (Object o : drivers ){driver.add(((Driver)(o)));}
                                        request.setAttribute("driver", driver);
                                        %>
                                        <c:forEach items="${driver}" var="item">
                                        <option value="${item.getId() }">${item.getName() } ${item.getSurname() }</option>
                                        </c:forEach>
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                	<td>Driver2 :</td>
                                    <td><select name="driverId2" id="driverId2">
                                        <c:forEach items="${driver}" var="item">
                                        <option value="${item.getId() }">${item.getName() } ${item.getSurname() }</option>
                                        </c:forEach>
                                        </select>
                            		</td>
                                </tr>
                                <tr>
                                	<td>Departure Date and Time :</td>
                                    <td><input type="text" name="departureDate" id="departureDate" placeholder="dd-MM-yyyy" onblur="dateControl(this.value)"/>
			                            <input type="text" name="departureTime" id="departureTime" placeholder="hh:mm:ss" onblur="timeControl(this.value)"/>
                            		</td>
                                </tr>
                                <tr>
                                	<td>Arrival Date and Time :</td>
                                    <td><input type="text" name="arrivalDate" id="arrivalDate" placeholder="dd-MM-yyyy" onblur="dateControl(this.value)"/>
                           				<input type="text" name="arrivalTime" id="arrivalTime" placeholder="hh:mm:ss" onblur="timeControl(this.value)"/>
                                    </td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('journey')" class="btnClass"/>	
                                	<input type="button" value="Search" onclick="doListObject('journey')" class="btnClass"/>
                                </td>
                                </tr>
                            </table>  
                        </form>
                    </div>
                    <div id="driverDiv" style="display:none">
                    <form id="driver">
                        <input type="hidden" name="fid" value="3"/>
                        <table class="cssTable">
                        <tr><td>Driver Operations</td><td></td></tr>
								<tr>
                                	<td>Name:</td>
                                    <td><input type="text" name="name" id="name" placeholder="Driver Name" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Surname :</td>
                                    <td><input type="text" name="surname" id="surname" placeholder="Driver Surname" onblur="nameControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Phone :</td>
                                    <td><input type="text" name="phone" id="phone" placeholder="Driver Phone" onblur="phoneControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>Birth Year :</td>
                                    <td><input type="text" name="birthYear" id="birthYear" placeholder="Driver Birth Year" onblur="yearControl(this.value)"/></td>
                                </tr>
                                <tr>
                                	<td>TC No :</td>
                                    <td><input type="text" name="tcno" id="tcno" placeholder="Driver TC No" onblur="idNumberControl(this.value)"/></td>
                                </tr>
                                <tr>
                                <td>
                                	
                                </td>
                                <td>
                                	<input type="button" value="Add" onclick="doAddObject('driver')" class="btnClass"/>
                                	<input type="button" value="Search" onclick="doListObject('driver')" class="btnClass"/>
                                </td>
                                </tr>
                            </table>  
                    </form>
                    </div>
              <div style="clear:both;"></div>
              <div id="footer">
              		
                
            </div>
            <div id='bottom-content'></div>
        </div>
    </div>
</body>
</html>
<%}
else{
	response.sendRedirect("index.jsp");
}%>

