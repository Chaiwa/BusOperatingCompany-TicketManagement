<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%if(session.getAttribute("Employee")!=null || session.getAttribute("Admin")!=null){ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>JOURNEY LIST</title>
<link href="style.css" media="screen" rel="stylesheet" />
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
			<div style="clear: both;"></div>
		</div>


		<!-- banner -->

		<div>
			<p></p>
				<input type="button" value="<<<Search Journey" onclick="document.location('searchJourney.jsp')" class="btnClass" />

			<p></p>
		</div>

		<!-- Content -->
		<div id='big-content'>
			<div id='top-content'></div>
			<div id='content'>
				<div id="responseAJAX"></div>
				<table border=1 class="cssTable">
					<tr>
						<td>Journey Number</td>
						<td>Route</td>
						<td>Departure Time</td>
						<td>Arrival Time</td>
						<td>Bus Model</td>
						<td>Price</td>
					</tr>
					<c:forEach items="${routeStationList}" var="routeStation">
						
							<c:forEach items="${journeyList}" var="journey">
							<tr>
								<c:if
									test="${journey.getRoute().getId() == routeStation.getRoute().getId()}">
									<input type="hidden"
										id="routeStationId.${routeStation.getId()}"
										value="${routeStation.getId() }"/> <input type="hidden"
										id="journeyId.${journey.getId()}" value="${journey.getId() }"/>
											<td><c:out value="${journey.getJourneyNo() }" /></td>
											<td><c:out
													value="${routeStation.getRouteStationName() }" /></td>
											<td><c:out
													value="${journey.getDepartureTime().toString().split(' ')[1] }" /></td>
												<td><c:out
														value="${journey.getArrivalTime().toString().split(' ')[1] }" /></td>
												<td><c:out value="${journey.getBus().getModel() }" /></td>
												<td><c:out value="${routeStation.getPrice() }" /></td>
												<td><input type="button" value="CHOOSE"
													onclick="doGetSeat('routeStationId.${routeStation.getId()}','journeyId.${journey.getId()}')" class="btnClass"/></td>
								</c:if>
								</tr>
							</c:forEach>
						
					</c:forEach>
				</table>
				<div style="clear: both;"></div>
				<div></div>
			</div>
			<div id='bottom-content'></div>
		</div>
	</div>
</body>
</html>
<%}else{
	response.sendRedirect("index.jsp");
}%>