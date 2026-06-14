<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dimbot - Error</title>
    <link rel="icon" href="https://i.ibb.co/PGKcsTyZ/dd.png">
    <link rel="stylesheet" href="Dashboard.css">
</head>

<body>
    <header class="header-main sticky">
        <div class="dim_logo">
            <img src="https://i.ibb.co/PGKcsTyZ/dd.png" alt="Dimbot Logo" style="width: 30%;">
        </div>
        <nav class="nav_bar">
            <ul>
                <li><a href="home.jsp" class="header_links">Home</a></li>
                <li><a href="Courses.jsp" class="header_links">Courses</a></li>
                <li><a href="#ContactUs" class="header_links">Contact Us</a></li>
            </ul>
        </nav>
    </header>

    <section class="first-wave">
        <div class="welcome">
            <h1 class="greet">Oops!</h1>
            <p class="about_us">
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage == null) {
                        errorMessage = "Something went wrong. Please try again later.";
                    }
                %>
                <%= errorMessage %>
            </p>
        </div>
    </section>

    <a href="home.jsp" style="text-decoration: none;">
        <button class="dashboard_button">Back to Home &#8594;</button>
    </a>

</body>

</html>
