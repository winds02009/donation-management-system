<%@ page import="jakarta.servlet.http.Cookie"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>


<!DOCTYPE html>
<html>

<head>
<title>Donation Success</title>
</head>
<body>
	<div>
		<p style="text-align: center;">
			<img src="../images/300.jpg" align="center">
		</P>
	</div>

	<%
	// Retrieve the cookies from the request
	Cookie[] cookies = request.getCookies();
	String username = null;
	String email = null;
	String program = null;
	String amount = null;

	if (cookies != null) {
		for (Cookie cookie : cookies) {
			switch (cookie.getName()) {
			case "username":
		username = cookie.getValue().replace("_", " "); // Get the value of the username cookie
		break;
			case "email":
		email = cookie.getValue().replace("_", " "); // Get the value of the email cookie
		break;
			case "program":
		program = cookie.getValue().replace("_", " "); // Get the value of the preferences cookie
		break;
			case "amount":
		amount = cookie.getValue(); // Get the value of the preferences cookie
		break;
			}
		}
	}

	// Display the retrieved cookie values
	%>
	<center>
		<h1>Thank You for Your Donation!</h1>

		<p>
			Dear <strong><%=username%></strong>,
		</p>
		<p>We have received your generous donation. Here are the details
			of your contribution:</p>

		<!-- Display donation details -->
		<table border="1">
			<tr>
				<th>Donation Program</th>
				<td><%=program%></td>
			</tr>
			<tr>
				<th>Donation Amount</th>
				<td><%=amount%></td>
			</tr>
			<tr>
				<th>Your Name</th>
				<td><%=username%></td>
			</tr>
			<tr>
				<th>Your Email</th>
				<td><%=email%></td>
			</tr>
		</table>

		<p>
			We truly appreciate your support for the <strong><%=program%></strong>
			program. Your contribution will make a difference!
		</p>

		<p>
			<a href="/after-donation">Return to Home</a>
		</p>
	</center>
</body>
</html>