<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - View Donations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        input, button {
            padding: 10px;
            font-size: 16px;
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>View Donations by Criteria</h2>
        <form action="view-donations" method="get">
            <label for="minAmount">Minimum Amount (HKD):</label>
            <input type="number" id="minAmount" name="minAmount" value="${param.minAmount}" min="0">
            <button type="submit">Filter</button>
        </form>
        
        <table>
            <thead>
                <tr>
                    <th>Donor Name</th>
                    <th>Program</th>
                    <th>Amount (HKD)</th>
                   <!--  <th>Date</th> -->
                </tr>
            </thead>
            <tbody>
                <!-- Use JSTL to iterate over donations -->
                <c:forEach var="donation" items="${donations}">
                    <tr>
                        <td>${donation.donationName}</td>
                        <td>${donation.donation_program}</td>
                        <td>${donation.donation_amount}</td>
                        <!--  <td>${donation.date}</td> -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>


