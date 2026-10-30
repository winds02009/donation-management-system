<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donation Success</title>
</head>
<body>
    <h1>Thank You for Your Donation!</h1>

    <p>Dear <strong>${donation.donorId}</strong>,</p>
    <p>We have received your generous donation. Here are the details of your contribution:</p>

    <!-- Display donation details -->
    <table border="1">
        <tr>
            <th>Donation Program</th>
            <td>${donation.donationProgram}</td>
        </tr>
        <tr>
            <th>Donation Amount</th>
            <td>${donation.donationAmount}</td>
        </tr>
        <tr>
            <th>Your Name</th>
            <td>${donation.donorId}</td>
        </tr>
        <tr>
            <th>Your Email</th>
            <td>${donation.email}</td>
        </tr>
    </table>

    <p>We truly appreciate your support for the <strong>${donation.donationProgram}</strong> program. Your contribution will make a difference!</p>

    <p><a href="/">Return to Home</a></p>
</body>
</html>