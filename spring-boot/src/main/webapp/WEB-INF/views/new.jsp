<!DOCTYPE html>
<html xmlns="http://wwww.w3.org/1999/xhtml"
	xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/form.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>

<title>Register New Edonor</title>
</head>
<body>
	<div>
		<p style="text-align: center;">
			<a href="/"><img src="../images/300.jpg" align="center"></a>
		</P>
	</div>
	<div align="center">
		<h1>Register New Edonor</h1>
		<br />
		<div class="col-sm-4">



			<div class="col-sm-4 mx-auto">
				<!-- Form starts here -->
				<form action="/save" method="post">
					<!-- Hidden field for ID -->
					<input type="hidden" name="id" value="${edonor.id}" />

					<!-- Edonor Name -->
					<div class="mb-3 text-start">
						<label for="edonorName" class="form-label">Edonor Name</label> <input
							type="text" id="edonorName" name="edonorname"
							class="form-control" placeholder="Edonor Name"
							value="${edonor.edonorname}" />
					</div>

					<!-- Course -->
					<div class="mb-3 text-start">
						<label for="email" class="form-label">Email</label> <input
							type="email" id="Email" name="email" class="form-control"
							placeholder="Email" value="${edonor.email}" />
					</div>

					<!-- Fee -->
					<div class="mb-3 text-start">
						<label for="password" class="form-label">Password</label> <input
							type="text" id="password" name="password" class="form-control"
							placeholder="Password" value="${edonor.password}" />
					</div>

					<!-- Submit button -->
					<div>
						<button type="submit" class="btn btn-info">Save</button>
					</div>
				</form>
			</div>



		</div>
	</div>
</body>
</html>