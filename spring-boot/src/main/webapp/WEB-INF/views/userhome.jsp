<%@ page import="jakarta.servlet.http.Cookie"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HKHC Donations</title>
<link rel="stylesheet" href="/css/style.css">
<!-- Link to an external CSS file -->
<style>
main {
	background-image: url(../images/123.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<div>
		<p style="text-align: center;">
			<img src="../images/300.jpg" align="center">
		</P>
	</div>
	<%
	Cookie[] cookies = request.getCookies();
	String Useremail = "";
	for (Cookie cookie : cookies) {
		if ("Useremail".equals(cookie.getName())) {
			Useremail = cookie.getValue();
			break; // Exit the loop once we find the cookie
		}
	}
	%>
	<header>
		<h1>HKHC Donations</h1>

		<h1>
			Welcome
			<%=Useremail%>
			!!
		</h1>
	</header>



	<nav>
		<div class="nav-bar">
			<div>
				<a href="#home">Home</a>
			</div>
			<div>
				<a href="#about">About Us</a>
			</div>
			<div>
				<a href="#projects">Our Projects</a>
			</div>
			<div>
				<a href="/Donation">Donate</a>
			</div>
			<div>
				<a href="/new">Donor Registration</a>
			</div>
			<div>
				<a href="/logout">logout</a>
			</div>

			<div>
				<a href="/user-history">View Donation Record</a>
			</div>


			<%
			if (Useremail.equals("admin")) {
			%>
			<div>
				<a href="/edonordb">Edonor Database</a>
			</div>
			<div>
				<a href="/admin">Donation Database</a>
			</div>
			<%
			}
			%>

		</div>
	</nav>

	<main>
		<section id=home>
			<h2>Welcome to HKHC Donations</h2>
			<p>Your contribution can make a difference. Join us in our
				mission to protect the environment.</p>
		</section>

		<section id="about">
			<h2>About Us</h2>
			<p>HKHC is dedicated to tackling environmental issues by
				promoting sustainable practices and supporting conservation
				projects.</p>
		</section>

		<section id="projects">
			<h2>Our Projects</h2>
			<p>We are involved in a range of projects, from reforestation to
				clean energy initiatives. Learn more about our efforts to make the
				world greener.</p>
		</section>

		<section id="donate">
			<h2>Donate</h2>
			<p>Every donation counts. Support our projects and help us create
				a sustainable future.</p>
			<button onclick="location.href='Donation'">Donate Now</button>
		</section>

	</main>

	<footer>
		<p>&copy; 2024 HKHC. All rights reserved.</p>
	</footer>
</body>
</html>
