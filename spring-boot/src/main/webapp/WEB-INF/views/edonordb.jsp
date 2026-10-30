<%@ page import="java.util.List"%>
<%@ page import="edu.sehs4701.edonor.domain.Edonor"%>


<!DOCTYPE html>
<html xmlns="http://wwww.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<link rel="stylesheet" href="/css/databaseStyle.css">
<!-- Link to an external CSS file -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<title>Edonor Registration</title>
</head>
<body>
	<div>
		<p style="text-align: center;">
			<img src="../images/300.jpg" align="center">
		</P>
	</div>
	<div class="container">
		<h2>Spring Boot Edonor System - Edonor Registration</h2>
		<div align="right">
			<a href="/userhome">Home</a><br /> <a href="/new">Add New</a> <br />
			<a href="/logout">Logout</a>

		</div>
		<div class="col-sm-5" align="center"></div>
		<div class="panel-body" align="center"></div>
		<table class="table">
			<thead class="thread-dark">
				<tr>
					<th>Edonor ID</th>
					<th>Edonor Name</th>
					<th>Course</th>
					<th>Fee</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
				// Assuming 'listedonor' is a List<EDonor> passed to the JSP
				List<Edonor> listedonor = (List<Edonor>) request.getAttribute("listedonor");
				if (listedonor != null) {
					for (Edonor edonor : listedonor) {
				%>
				<tr>
					<td><%=edonor.getId()%></td>
					<td><%=edonor.getEdonorname()%></td>
					<td><%=edonor.getEmail()%></td>
					<td><%=edonor.getPassword()%></td>
					<td><a href="/edit/<%=edonor.getId()%>">Edit</a></td>
					<td><a href="/delete/<%=edonor.getId()%>">Delete</a></td>
				</tr>
				<%
				}
				} else {
				%>
				<tr>
					<td colspan="5">No donors available.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>