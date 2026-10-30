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
			<p>Your contribution can make a difference. Your donations can
				change the life of people in our society.</p>
		</section>

		<section id="about">
			<h2>About Us</h2>
			<p>Hong Kong Homeless Care (HKHC) is a non-profit organization targeting to solve the urgent needs of homeless individuals in Hong Kong. We provide immediate relief and long-term solutions for the homeless, working through a network of volunteers, donors, and partner organizations to offer services and resources to the most vulnerable members of our society.</p>
		</section>

		<section id="projects">
			<h2>Our Programs</h2>
			<p>Choose the program you want to support: Homeless Children Program, Elderly Support Program or Community Development Program.</p>
		</section>

		<section id="donate">
			<h2>Donate</h2>
			<p>Every donation makes a difference. $20 could help a person
				from hunger. Support our programs and help homeless people in Hong Kong.</p>
			<button onclick="location.href='Donation'">Donate Now</button>
		</section>

	</main>

	<footer>
		<p>&copy; 2024 HKHC. All rights reserved.</p>
	</footer>
</body>
</html>
