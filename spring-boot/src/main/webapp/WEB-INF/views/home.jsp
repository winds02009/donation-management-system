<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EdonorPlus Donations</title>
    <link rel="stylesheet" href="/css/style.css"> <!-- Link to an external CSS file -->
</head>
<body>
    <header>
        <h1>EdonorPlus Donations</h1>
    </header>

    <nav>
        <div class="nav-bar">
            <div><a href="#home">Home</a></div>
            <div><a href="#about">About Us</a></div>
            <div><a href="#projects">Our Projects</a></div>
            <div><a href="#donate">Donate</a></div>
            <div><a href="#contact">Contact Us</a></div>
            <div><a href="/new" >Donor Registration</a></div>
        </div>
    </nav>

    <main>
        <section id="home">
            <h2>Welcome to EdonorPlus Donations</h2>
            <p>Your contribution can make a difference. Join us in our mission to protect the environment.</p>
        </section>

        <section id="about">
            <h2>About Us</h2>
            <p>EdonorPlus is dedicated to tackling environmental issues by promoting sustainable practices and supporting conservation projects.</p>
        </section>

        <section id="projects">
            <h2>Our Projects</h2>
            <p>We are involved in a range of projects, from reforestation to clean energy initiatives. Learn more about our efforts to make the world greener.</p>
        </section>

        <section id="donate">
            <h2>Donate</h2>
            <p>Every donation counts. Support our projects and help us create a sustainable future.</p>
            <button onclick="location.href='donation-page.html'">Donate Now</button>
        </section>

        <section id="contact">
            <h2>Contact Us</h2>
            <p>Have questions or want to get involved? Reach out to us!</p>
            <form action="contact-form-handler.php" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="message">Message:</label>
                <textarea id="message" name="message" required></textarea>
                
                <button type="submit">Send</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 EdonorPlus. All rights reserved.</p>
    </footer>
</body>
</html>
