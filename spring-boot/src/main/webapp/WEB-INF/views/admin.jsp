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

<title>Admin - View Donations</title>
<style>
</style>
</head>
<body>

	<div>
		<p style="text-align: center;">
			<img src="../images/300.jpg" align="center">
		</p>

	</div>
	<div class="container">
		<h2>View Donations by Criteria</h2>
		<div align="right">
			<a href="/userhome">Home</a> <br /> <a href="/logout">Logout</a>
			<%
			int fMin = (int) request.getAttribute("minAmount");
			int fMax = (int) request.getAttribute("maxAmount");
			String fProgram = (String) request.getAttribute("program");
			String fEmail = (String) request.getAttribute("email");
			if (fProgram == null) fProgram = "";
			if (fEmail == null) fEmail = "";
			String[] programs = { "Homeless Children Program", "Elderly Support Program", "Community Development Program" };
			%>
			<form action="/view-donations" method="get">
				<label for="minAmount">Filter By Amount (HKD) </label> From <input
					type="number" id="minAmount" name="minAmount" value="<%=fMin%>" min="0"
					max="2000000000" step="1" placeholder="Minimun Amount" required />
				To <input type="number" id="maxAmount" name="maxAmount"
					value="<%=fMax%>" min="0" max="2000000000" step="1"
					placeholder="Maximum Amount" required /> <br />
				<label for="program">Program </label> <select id="program" name="program">
					<option value="">All Programs</option>
					<%
					for (String p : programs) {
					%>
					<option value="<%=p%>" <%=p.equals(fProgram) ? "selected" : ""%>><%=p%></option>
					<%
					}
					%>
				</select>
				<label for="email">Donor Email </label> <input type="text" id="email"
					name="email" value="<%=fEmail.replace("\"", "&quot;")%>" placeholder="contains..." />
				<button type="submit">Filter</button>
				<a href="/admin">Reset</a>
			</form>
			<%
			if (request.getAttribute("total") != null) {
			%>
			<p>
				Matching donations:
				<%=((List<?>) request.getAttribute("listdonation")).size()%>
				| Total amount (HKD):
				<%=request.getAttribute("total")%></p>
			<%
			}
			%>

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
					int min = (int) request.getAttribute("minAmount");

					int max = (int) request.getAttribute("maxAmount");

					if (listdonation != null) {
						for (Donation donation : listdonation) {
							if (min > donation.getDonationAmount()) {
						continue;
							}
							if (max < donation.getDonationAmount()) {
						continue;
							}
					%>
					<tr>
						<td><%=donation.getDonationName()%></td>
						<td><%=donation.getEmail()%></td>
						<td><%=donation.getDonationProgram()%></td>
						<td><%=donation.getDonationAmount()%></td>
						<td><a href="/deletedonation/<%=donation.getDonationID()%>">Delete</a></td>
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


