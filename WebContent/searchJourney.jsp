<%@page import="java.util.ArrayList"%>
<%@page import="sos.pojo.dto.Station"%>
<%@page import="sos.services.DbOperation"%>
<%@page import="sos.pojo.dto.UserEmployee"%>
<%@page import="sos.pojo.dto.Branch"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% if(session.getAttribute("Employee")!=null || session.getAttribute("Admin")!=null){ %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>SEARCH JOURNEY</title>
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
			<p></p>
		</div>

		<!-- Content -->
		<div id='big-content'>
			<div id='top-content'></div>
			<div id='content'>
				<form id="journey">
					<table class="cssTable">
						<tr><td>Search Journey</td><td></td></tr>
						<tr>
						
							<td>FROM :</td>
							<td><input type="text" name="from" id="from"
								placeholder="FROM" onblur='usualNameControl(this.value)'/></td>
						</tr>
						<tr>
							<td>TO :</td>
							<td><input type="text" name="to" id="to" placeholder="TO" onblur='usualNameControl(this.value)'/></td>
						</tr>
						<tr>
							<td>DATE :</td>
							<td><input type="text" name="date" id="date"
								placeholder="dd-mm-yyyy" onblur='dateControl(this.value)'/></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="button" value="SEARCH JOURNEY"
								onclick="doSearchJourney('journey')" class="btnClass"/></td>
						</tr>
					</table>
				</form>
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