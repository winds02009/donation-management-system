<!DOCTYPE html>
<html xmlns="http://wwww.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<title>Edonor Registration</title>
</head>
<body>
	<div>
		<h2>Spring Boot Edonor System - Edonor Registration</h2>
		<div align="left">
			<h3>
				<a th:href="@{'/new'}">Add New</a>
			</h3>
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
				<tr th:each="edonor : ${listedonor}">
					<td th:text="${edonor.id}">Edonor ID</td>
					<td th:text="${edonor.edonorname}">Edonor Name</td>
					<td th:text="${edonor.course}">Course</td>
					<td th:text="${edonor.fee}">Fee</td>
					<td><a th:href="@{'/edit/' + ${edonor.id}}">Edit</a></td>
					<td><a th:href="@{'/delete/' + ${edonor.id}}">Delete</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>