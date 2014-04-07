<%@page import="sos.pojo.dto.Driver"%>
<%@page import="sos.pojo.dto.Bus"%>
<%@page import="sos.pojo.dto.Branch"%>
<%@page import="sos.pojo.dto.Route"%>
<%@page import="sos.services.DbOperation"%>
<%@page import="sos.pojo.dto.Station"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if (session.getAttribute("Admin") != null) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>RESULT LIST</title>
<link href="style.css" media="screen" rel="stylesheet" />
<script type="text/javascript" src="jScripts/regExControls.js"></script>
<script type="text/javascript" src="jScripts/CRUD.js"></script>
</head>

<body>
	<%
		ArrayList<Station> list = (ArrayList<Station>) session
					.getAttribute("list");
			DbOperation dbOperation = new DbOperation();
	%>
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
			<div style="clear: both;"></div>
		</div>


		<!-- banner -->

		<div>
			<p></p>
			<input type="button" value="<<<Admin Panel"
				onclick="document.location('adminPanel.jsp')" class="btnClass" />
			<p></p>
		</div>

		<!-- Content -->
		<div id='big-content'>
			<div id='top-content'></div>
			<div id='content'>
				<table border=1 class="cssTable">
					<%
						switch (Integer.parseInt(session.getAttribute("class")
									.toString())) {
							case 0: // If No Result returns
								out.print("No Result");
								break;
							case 1: //List Station from Result
					%>
					<tr>

						<td>Id</td>
						<td>Station Name</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text" value="${item.getName() }"
								id="name.${item.getId() }" onblur='usualNameControl(this.value)' /></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('1','id.${item.getId()}-name.${item.getId() }')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('1',${item.getId()})" class="btnClass" /></td>
						</tr>


					</c:forEach>
					<%
						break;
							case 2: //List Passenger From Result
					%>
					<tr>
						<td>Id</td>
						<td>Passenger Name</td>
						<td>Passenger SurName</td>
						<td>Passenger Phone</td>
						<td>Passenger Gender</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId()}" readonly /></td>
							<td><input type="text" value="${item.getName() }"
								id="name.${item.getId()}" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getSurname() }"
								id="surname.${item.getId()}" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getPhone() }"
								id="phone.${item.getId()}" onblur='phoneControl(this.value)' /></td>
							<td><input type="text" value="${item.getGender() }"
								id="gender.${item.getId()}" readonly /></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('2','id.${item.getId()}-name.${item.getId()}-surname.${item.getId()}-phone.${item.getId()}-gender.${item.getId()}')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('2',${item.getId()})" class="btnClass" /></td>
						</tr>



					</c:forEach>

					<%
						break;
							case 3: // List Drivers from Result
					%>
					<tr>
						<td>Id</td>
						<td>Driver Name</td>
						<td>Driver SurName</td>
						<td>Driver Phone</td>
						<td>Driver Birth Year</td>
						<td>Driver TC Number</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text" value="${item.getName() }"
								id="name.${item.getId() }" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getSurname() }"
								id="surname.${item.getId() }" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getPhone() }"
								id="phone.${item.getId() }" onblur='phoneControl(this.value)' /></td>
							<td><input type="text" value="${item.getBirthYear() }"
								id="birthYear.${item.getId() }" onblur='yearControl(this.value)' /></td>
							<td><input type="text" value="${item.getTcno() }"
								id="tcno.${item.getId() }" onblur='idNumberControl(this.value)' /></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('3','id.${item.getId()}-name.${item.getId()}-surname.${item.getId()}-phone.${item.getId()}-birthYear.${item.getId()}-tcno.${item.getId()}')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('3',${item.getId()})" class="btnClass" /></td>
						</tr>


					</c:forEach>

					<%
						break;
							case 4: //List Admin Users from Result
					%>
					<tr>
						<td>Id</td>
						<td>Admin Name</td>
						<td>Admin SurName</td>
						<td>Admin Phone</td>
						<td>Admin Birth Year</td>
						<td>Admin TC Number</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}" readonly /></td>
							<td><input type="text" value="${item.getName() }"
								onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getSurname() }"
								onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getPhone() }"
								onblur='phoneControl(this.value)' /></td>
							<td><input type="text" value="${item.getUsername() }"
								onblur='usualControl(this.value)' /></td>
							<td><input type="text" value="${item.getPassword() }"
								onblur='passwordControl(this.value)' /></td>
							<td><input type="button" value="DELETE"
								onclick="doDeleteObject('4',${item.getId()})" class="btnClass" /></td>

						</tr>
					</c:forEach>

					<%
						break;
							case 5: //List Bus from Result
					%>
					<tr>
						<td>Id</td>
						<td>Bus Plate</td>
						<td>Bus Brand</td>
						<td>Bus Model</td>
						<td>Bus Model Year</td>
						<td>Bus Capacity</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text" value="${item.getPlate() }"
								id="plate.${item.getId() }" onblur='plateControl(this.value)' /></td>
							<td><input type="text" value="${item.getBrand() }"
								id="brand.${item.getId() }" onblur='usualControl(this.value)' /></td>
							<td><input type="text" value="${item.getModel() }"
								id="model.${item.getId() }" onblur='usualControl(this.value)' /></td>
							<td><input type="text" value="${item.getModelYear() }"
								id="modelYear.${item.getId() }" onblur='yearControl(this.value)' /></td>
							<td><input type="text" value="${item.getCapacity() }"
								id="capacity.${item.getId() }"
								onblur='capacityControl(this.value)' /></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('5','id.${item.getId()}-plate.${item.getId()}-brand.${item.getId()}-model.${item.getId()}-modelYear.${item.getId()}-capacity.${item.getId()}')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('5',${item.getId()})" class="btnClass" /></td>
						</tr>


					</c:forEach>

					<%
						break;
							case 6: //List Branch from Result
					%>
					<tr>
						<td>Id</td>
						<td>Branch Name</td>
						<td>Branch Country</td>
						<td>Branch City</td>
						<td>Branch County</td>
						<td>Branch District</td>
						<td>Branch Phone</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text" value="${item.getBranchName() }"
								id="branchName.${item.getId() }"
								onblur='usualNameControl(this.value)' /></td>
							<td><input type="text" value="${item.getCountry() }"
								id="country.${item.getId() }" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getCity() }"
								id="city.${item.getId() }" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getCounty() }"
								id="county.${item.getId() }"
								onblur='usualNameControl(this.value)' /></td>
							<td><input type="text" value="${item.getDistrict() }"
								id="district.${item.getId() }"
								onblur='usualNameControl(this.value)' /></td>
							<td><input type="text" value="${item.getPhone() }"
								id="phone.${item.getId() }" onblur='phoneControl(this.value)' /></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('6','id.${item.getId()}-branchName.${item.getId()}-country.${item.getId()}-city.${item.getId()}-county.${item.getId()}-district.${item.getId()}-phone.${item.getId()}')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('6',${item.getId()})" class="btnClass" /></td>
						</tr>


					</c:forEach>

					<%
						break;
							case 7: // List Routes from Result 
								ArrayList<Object> stations = dbOperation.getStationNames();
								ArrayList<Station> station = new ArrayList<Station>();
								for (Object o : stations) {
									station.add(((Station) (o)));
								}
								request.setAttribute("station", station);
					%>
					<tr>
						<td>Id</td>
						<td>Route Name</td>
						<td>Route From Station</td>
						<td>Route To Station</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text" value="${item.getRouteName() }"
								id="routeName.${item.getId() }"
								onblur='usualNameControl(this.value)' /></td>
							<td><select id="fStationId.${item.getId() }">

									<c:forEach items="${station }" var="stationItem">
										<c:choose>
											<c:when
												test="${item.getFrom().getName().equalsIgnoreCase(stationItem.getName()) }">
												<option value="${item.getFrom().getId() }" selected>${stationItem.getName()}</option>
											</c:when>
											<c:otherwise>
												<option value="${stationItem.getId() }">${stationItem.getName() }</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
							</select></td>

							<td><select id="tStationId.${item.getId() }">
									<c:forEach items="${station }" var="stationItem">
										<c:choose>
											<c:when
												test="${item.getTo().getName().equalsIgnoreCase(stationItem.getName()) }">
												<option value="${item.getTo().getId() }" selected>${stationItem.getName()}</option>
											</c:when>
											<c:otherwise>
												<option value="${stationItem.getId() }"><c:out
														value="${stationItem.getName()}" /></option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select></td>
							<tr>
								<td><input type="button" value="UPDATE"
									onclick="doUpdateObject('7','id.${item.getId()}-name.${item.getId() }-fStationId.${item.getId() }-tStationId.${item.getId() }')"
									class="btnClass" /> <input type="button" value="DELETE"
									onclick="doDeleteObject('7',${item.getId()})" class="btnClass" /></td>
							</tr>
						</tr>
					</c:forEach>

					<%
						break;
							case 8: // List RouteStation from Result 
								ArrayList<Object> routes = dbOperation.getRouteNames();
								ArrayList<Route> route = new ArrayList<Route>();
								for (Object o : routes) {
									route.add(((Route) (o)));
								}
								request.setAttribute("route", route);
								stations = dbOperation.getStationNames();
								station = new ArrayList<Station>();
								for (Object o : stations) {
									station.add(((Station) (o)));
								}
								request.setAttribute("station", station);
					%>
					<tr>
						<td>Id</td>
						<td>Route Station Name</td>
						<td>Route Name</td>
						<td>Route Stop Station</td>
						<td>Route Station Price</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text"
								value="${item.getRouteStationName() }"
								id="routeStationName.${item.getId() }"
								onblur='usualNameControl(this.value)' /></td>
							<td><select id="routeId.${item.getId() }">

									<c:forEach items="${route }" var="routeItem">
										<c:choose>
											<c:when
												test="${item.getRoute().getRouteName().equalsIgnoreCase(routeItem.getRouteName()) }">
												<option value="${item.getRoute().getId() }" selected>${routeItem.getRouteName()}</option>
											</c:when>
											<c:otherwise>
												<option value="${routeItem.getId() }">${routeItem.getRouteName() }</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
							</select></td>

							<td><select id="stopId.${item.getId() }">
									<c:forEach items="${station }" var="stationItem">
										<c:choose>
											<c:when
												test="${item.getStop().getName().equalsIgnoreCase(stationItem.getName()) }">
												<option value="${item.getStop().getId() }" selected>${stationItem.getName()}</option>
											</c:when>
											<c:otherwise>
												<option value="${stationItem.getId() }"><c:out
														value="${stationItem.getName()}" /></option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
							</select></td>
							<td><input type="text" value="${item.getPrice() }"
								id="price.${item.getId() }" onblur='priceControl(this.value)' /></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('8','id.${item.getId()}-routeStationName.${item.getId() }-routeId.${item.getId() }-stopId.${item.getId() }-price.${item.getId()}')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('8',${item.getId()})" class="btnClass" /></td>
						</tr>

					</c:forEach>

					<%
						break;
							case 9: // List User Employee from Result 
								ArrayList<Object> branches = dbOperation.getBranchNames();
								ArrayList<Branch> branch = new ArrayList<Branch>();
								for (Object o : branches) {
									branch.add(((Branch) (o)));
								}
								request.setAttribute("branch", branch);
					%>
					<tr>
						<td>Id</td>
						<td>Employee Name</td>
						<td>Employee Surname</td>
						<td>Employee Phone</td>
						<td>Employee User Name</td>
						<td>Employee Password</td>
						<td>Employee Branch</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text" value="${item.getName() }"
								id="name.${item.getId() }" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getSurname() }"
								id="surname.${item.getId() }" onblur='nameControl(this.value)' /></td>
							<td><input type="text" value="${item.getPhone() }"
								id="phone.${item.getId() }" onblur='phoneControl(this.value)' /></td>
							<td><input type="text" value="${item.getUsername() }"
								id="username.${item.getId() }" onblur='usualControl(this.value)' /></td>
							<td><input type="text" value="${item.getPassword() }"
								id="password.${item.getId() }"
								onblur='passwordControl(this.value)' /></td>
							<td><select id="branchId.${item.getId() }">

									<c:forEach items="${branch }" var="branchItem">
										<c:choose>
											<c:when
												test="${item.getBranch().getBranchName().equalsIgnoreCase(branchItem.getBranchName()) }">
												<option value="${item.getBranch().getId() }" selected>${branchItem.getBranchName()}</option>
											</c:when>
											<c:otherwise>
												<option value="${branchItem.getId() }">${branchItem.getBranchName() }</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('9','id.${item.getId()}-name.${item.getId()}-surname.${item.getId()}-phone.${item.getId()}-username.${item.getId()}-password.${item.getId()}-branchId.${item.getId()}')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('9',${item.getId()})" class="btnClass" /></td>
						</tr>

					</c:forEach>

					<%
						break;
							case 10: // List Journey from Result 
								routes = dbOperation.getRouteNames();
								route = new ArrayList<Route>();
								for (Object o : routes) {
									route.add(((Route) (o)));
								}
								request.setAttribute("route", route);
								stations = dbOperation.getStationNames();
								station = new ArrayList<Station>();
								for (Object o : stations) {
									station.add(((Station) (o)));
								}
								request.setAttribute("station", station);
								ArrayList<Object> busses = dbOperation.getBusNames();
								ArrayList<Bus> bus = new ArrayList<Bus>();
								for (Object o : busses) {
									bus.add(((Bus) (o)));
								}
								request.setAttribute("bus", bus);
								ArrayList<Object> drivers = dbOperation.getDriverNames();
								ArrayList<Driver> driver = new ArrayList<Driver>();
								for (Object o : drivers) {
									driver.add(((Driver) (o)));
								}
								request.setAttribute("driver", driver);
					%>
					<tr>
						<td>Id</td>
						<td>Journey Number</td>
						<td>Bus Plate</td>
						<td>Route Name</td>
						<td>First Driver</td>
						<td>Second Driver</td>
						<td>Departure Date</td>
						<td>Departure Time</td>
						<td>Arrival Date</td>
						<td>Arrival Time</td>
					</tr>
					<c:forEach items="${list}" var="item">
						<tr>

							<td><input type="text" value="${item.getId()}"
								id="id.${item.getId() }" readonly /></td>
							<td><input type="text" value="${item.getJourneyNo() }"
								id="journeyNo.${item.getId() }"
								onblur='numberControl(this.value)' /></td>
							<td><select id="busId.${item.getId() }">

									<c:forEach items="${bus }" var="busItem">
										<c:choose>
											<c:when
												test="${item.getBus().getPlate().equalsIgnoreCase(busItem.getPlate()) }">
												<option value="${item.getBus().getId() }" selected>${busItem.getPlate()}</option>
											</c:when>
											<c:otherwise>
												<option value="${busItem.getId() }">${busItem.getPlate() }</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
							</select></td>

							<td><select id="routeId.${item.getId() }">
									<c:forEach items="${route }" var="routeItem">
										<c:choose>
											<c:when
												test="${item.getRoute().getRouteName().equalsIgnoreCase(routeItem.getRouteName()) }">
												<option value="${item.getRoute().getId() }" selected>${routeItem.getRouteName()}</option>
											</c:when>
											<c:otherwise>
												<option value="${routeItem.getId() }">${routeItem.getRouteName() }</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
							</select></td>

							<td><select id="driverId1.${item.getId() }">
									<c:forEach items="${driver }" var="driverItem">
										<c:choose>
											<c:when
												test="${item.getDriver1().getName().equalsIgnoreCase(driverItem.getName()) && item.getDriver1().getSurname().equalsIgnoreCase(driverItem.getSurname())}">
												<option value="${item.getDriver1().getId() }" selected>${driverItem.getName()}
													${driverItem.getSurname()}</option>
											</c:when>
											<c:otherwise>
												<option value="${driverItem.getId() }">${driverItem.getName()}
													${driverItem.getSurname()}</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
							</select></td>

							<td><select id="driverId2.${item.getId() }">
									<c:forEach items="${driver }" var="driverItem">
										<c:choose>
											<c:when
												test="${item.getDriver2().getName().equalsIgnoreCase(driverItem.getName()) && item.getDriver2().getSurname().equalsIgnoreCase(driverItem.getSurname())}">
												<option value="${item.getDriver2().getId() }" selected>${driverItem.getName()}
													${driverItem.getSurname()}</option>
											</c:when>
											<c:otherwise>
												<option value="${driverItem.getId() }">${driverItem.getName()}
													${driverItem.getSurname()}</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
							</select></td>
							<td><input type="text"
								value="${item.getDepartureTime().toString().split(' ')[0] }"
								id="departureDate.${item.getId() }"
								onblur='dateControl(this.value)' /></td>
							<td><input type="text"
								value="${item.getDepartureTime().toString().split(' ')[1].split('\\.')[0] }"
								id="departureTime.${item.getId() }"
								onblur='timeControl(this.value)' /></td>
							<td><input type="text"
								value="${item.getArrivalTime().toString().split(' ')[0] }"
								id="arrivalDate.${item.getId() }"
								onblur='dateControl(this.value)' /></td>
							<td><input type="text"
								value="${item.getArrivalTime().toString().split(' ')[1].split('\\.')[0]  }"
								id="arrivalTime.${item.getId() }"
								onblur='timeControl(this.value)' /></td>
						</tr>
						<tr>
							<td><input type="button" value="UPDATE"
								onclick="doUpdateObject('10','id.${item.getId()}-journeyNo.${item.getId()}-routeId.${item.getId()}-busId.${item.getId()}-driverId1.${item.getId()}-driverId2.${item.getId()}-departureDate.${item.getId()}-departureTime.${item.getId()}-arrivalDate.${item.getId()}-arrivalTime.${item.getId()}')"
								class="btnClass" /> <input type="button" value="DELETE"
								onclick="doDeleteObject('10',${item.getId()})" class="btnClass" /></td>
						</tr>

					</c:forEach>
					<%
						break;
							}
					%>
				</table>
				<div style="clear: both;"></div>
				<div></div>
			</div>
			<div id='bottom-content'></div>
		</div>
	</div>
</body>
</html>
<%
	} else {
		response.sendRedirect("index.jsp");
	}
%>