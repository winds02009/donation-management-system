<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make a Donation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
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
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
        }
        input, select {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Make a Donation</h2>
        <form action="/saveDonation" method="POST">
            <label for="donorId">Donor Name:</label>
            <input type="hidden" id="donationID" name="donationID" value="${donation.donationID}" required>
            <input type="text" id="donationName" name="donationName" value="${donation.donationName}" required>
			<label for="email">E-mail Address:</label>
            <input type="text" id="email" name="email" value="${donation.email}" required >          
            <label for="donation_program">Donation Program:</label>
			<select id="donation_program" name="donationProgram">
    		<option value="Homeless Children Program">Homeless Children Program</option>
    		<option value="Elderly Support Program">Elderly Support Program</option>
    		<option value="Community Development Program">Community Development Program</option>
			</select>
            <label for="donationAmount">Amount (HKD):</label>
            <input type="number" id="donationAmount" name="donationAmount" min="1" value="${donation.donationAmount}" required>

            <button type="submit">Donate</button>
        </form>
    </div>
</body>
</html>

