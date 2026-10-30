<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="edu.sehs4701.edonor.domain.Donation"%>
<%@ page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="jakarta.servlet.http.HttpServletResponse"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/databaseStyle.css">
<!-- Link to an external CSS file -->

<title>HKHC - My Donation History</title>

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

</head>
<body>
	<div>
		<p style="text-align: center;">
			<img src="../images/300.jpg" align="center">
		</P>
	</div>
	<div class="container">
		<h2>My Donation History</h2>
		<div align="right">
			<a href="/userhome">Home</a> <br /> <a href="/logout">Logout</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>Donor Name</th>
					<th>Email</th>
					<th>Program</th>

					<th>Amount (HKD)</th>
					<!--  <th>Date</th> -->
				</tr>
			</thead>

			<!--
			<tbody>
				<!-- Use JSTL to iterate over donations 
				<c:forEach var="donation" items="${donations}">
					<tr>
						<td>${donation.donationName}</td>
						<td>${donation.email}</td>

						<td>${donation.donation_program}</td>
						<td>${donation.donation_amount}</td>
					</tr>
				</c:forEach>
			</tbody>
			
			-->


			<tbody>
				<%
				// Assuming 'listedonor' is a List<EDonor> passed to the JSP
				List<Donation> listdonation = (List<Donation>) request.getAttribute("listdonation");

				if (listdonation != null) {
					for (Donation donation : listdonation) {
						if (Useremail.equals(donation.getEmail())) {
				%>
				<tr>
					<td><%=donation.getDonationName()%></td>
					<td><%=donation.getEmail()%></td>
					<td><%=donation.getDonationProgram()%></td>
					<td><%=donation.getDonationAmount()%></td>
				</tr>
				<%
				}
				}
				} else {
				%>
				<tr>
					<td colspan="5">No Donation History.</td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>
</body>
</html>

