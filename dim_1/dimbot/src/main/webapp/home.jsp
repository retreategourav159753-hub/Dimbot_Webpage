<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   if(session.getAttribute("username") == null){
        response.sendRedirect(request.getContextPath() + "/dimbot/welcome.html");
        return;
   }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dimbot</title>

    <link rel="icon" href="https://i.ibb.co/PGKcsTyZ/dd.png">
    <link rel="stylesheet" href="home.css">
</head>

<body>

    <header class="header-main sticky">

        <div class="dim_logo">
            <img src="https://i.ibb.co/PGKcsTyZ/dd.png"
                 alt="Dimbot Logo"
                 style="width: 30%;">
        </div>

        <nav class="nav_bar">
            <ul>
                <li><a href="home.jsp" class="header_links">Home</a></li>
                <li><a href="#Courses" class="header_links">Courses</a></li>
                <li><a href="#ContactUs" class="header_links">Contact Us</a></li>
            </ul>
        </nav>

        <div class="user_log">
            <ul>
                <li><a href="login.jsp" class="header_links">Login</a></li>
                <li><a href="signup.jsp" class="header_links">Sign Up</a></li>
            </ul>
        </div>

    </header>

    <section class="first-wave">

        <div class="welcome">
            <h1 class="greet">Welcome to Dimbot</h1>

            <p class="about_us">
                Your one-stop destination for learning and growth.
                Explore our wide range of courses, connect with experts,
                and unlock your potential. Sign up today and embark on
                a journey of knowledge and success!
            </p>
        </div>

    </section>

    <h1 class="courses_01">Our Trending Courses.</h1>

    <section class="second-wave">

        <!-- Python -->
        <a href="https://www.w3schools.com/python/default.asp" target="_blank">

            <div class="flip-card">

                <div class="flip-card-inner">

                    <div class="flip-card-front">

                        <img src="https://www.python.org/static/img/python-logo-large.c36dccadd999.png?1694722768"
                             alt="Python Logo"
                             class="lang-logo">

                        <h4 class="lang_txt">
                            Python (by w3Schools)
                        </h4>

                    </div>

                    <div class="flip-card-back">

                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                             alt="w3Schools Logo"
                             class="source_logo">

                        <h2 class="source-text">Go there!</h2>

                    </div>

                </div>

            </div>

        </a>

        <!-- CSS -->
        <a href="https://www.w3schools.com/css/default.asp" target="_blank">

            <div class="flip-card">

                <div class="flip-card-inner">

                    <div class="flip-card-front">

                        <img src="https://cdn-icons-png.flaticon.com/512/5968/5968242.png"
                             alt="CSS Logo"
                             class="lang-logo">

                        <h4 class="lang_txt">
                            CSS (by w3Schools)
                        </h4>

                    </div>

                    <div class="flip-card-back">

                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                             alt="w3Schools Logo"
                             class="source_logo">

                        <h2 class="source-text">Go there!</h2>

                    </div>

                </div>

            </div>

        </a>

        <!-- HTML -->
        <a href="https://www.w3schools.com/html/default.asp" target="_blank">

            <div class="flip-card">

                <div class="flip-card-inner">

                    <div class="flip-card-front">

                        <img src="https://cdn-icons-png.flaticon.com/512/1532/1532556.png"
                             alt="HTML Logo"
                             class="lang-logo">

                        <h4 class="lang_txt">
                            HTML (by w3Schools)
                        </h4>

                    </div>

                    <div class="flip-card-back">

                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                             alt="w3Schools Logo"
                             class="source_logo">

                        <h2 class="source-text">Go there!</h2>

                    </div>

                </div>

            </div>

        </a>

        <!-- JavaScript -->
        <a href="https://www.geeksforgeeks.org/javascript/javascript-tutorial/" target="_blank">

            <div class="flip-card">

                <div class="flip-card-inner">

                    <div class="flip-card-front">

                        <img src="https://cdn-icons-png.flaticon.com/512/5968/5968292.png"
                             alt="JavaScript Logo"
                             class="lang-logo">

                        <h4 class="lang_txt">
                            JavaScript (by GeeksforGeeks)
                        </h4>

                    </div>

                    <div class="flip-card-back">

                        <img src="https://media.geeksforgeeks.org/gfg-gg-logo.svg"
                             alt="GeeksforGeeks Logo"
                             class="source_logo">

                        <h2 class="source-text">Go there!</h2>

                    </div>

                </div>

            </div>

        </a>

        <!-- Java -->
        <a href="https://www.youtube.com/playlist?list=PLhvdldYcnZMmxgR8iP46Vr3fCZkbACiSo"
           target="_blank">

            <div class="flip-card">

                <div class="flip-card-inner">

                    <div class="flip-card-front">

                        <img src="https://cdn-icons-png.flaticon.com/512/226/226777.png"
                             alt="Java Logo"
                             class="lang-logo">

                        <h4 class="lang_txt">
                            Java (by Coding Aliens)
                        </h4>

                    </div>

                    <div class="flip-card-back">

                        <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png"
                             alt="YouTube Logo"
                             class="source_logo">

                        <h2 class="source-text">Go there!</h2>

                    </div>

                </div>

            </div>

        </a>

    </section>

</body>

</html>