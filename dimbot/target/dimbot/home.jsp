<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dimbot</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="https://i.ibb.co/PGKcsTyZ/dd.png">
    <link rel="stylesheet" href="home.css">
</head>

<body>
    <%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("user")){
                userName = cookie.getValue();
            }
        }
    }
    if(userName == null){
        response.sendRedirect(request.getContextPath() + "/Login.jsp");
    }
    %>
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

        <div class="search_bar">
            <input type="search" placeholder="Search what you want to learn..." class="search_input">
            <button type="submit" class="search_icon"><i class="fa fa-search"></i></button>
        </div>

        <div class="user_name">
            <button class="logo_user" style="background:none; border: none; padding: none; cursor: pointer;" type="button">
                <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="" class="username_logo" >
            </button>
             <a href="DashboardServlet" class="header_links"><%= userName %></a>
        </div>
        <div class="user_log">
        <form action="LogoutServlet" method="post">
            <button type="submit" class="header_links" style="background: none; border: none; font-size: 16px;">Log out</button>
        </form>
        </div>
    </header>
    <section class="first-wave">
        <div class="welcome">
            <h1 class="greet">Hello, <%= userName %>!</h1>
            <p class="about_us">We are glad to have you here!. We will wish to boost your skills. Education is not just the memorization of facts; it is the lifelong, transformative process of critical thinking, personal growth, and expanding the mind.</p>
        </div>
    </section>

    <a href="DashboardServlet" style="text-decoration: none;">
    <button class="dashboard_button">My Dashboard &#8594;</button>
    </a>

    <h1 class="courses_01">Today's Trending Courses.</h1>   
    <Section class="second-wave">

        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.w3schools.com%2Fpython%2Fdefault.asp&course=Python" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://www.python.org/static/img/python-logo-large.c36dccadd999.png?1694722768"
                            alt="" class="lang-logo">
                        <h4 class="lang_txt">Python (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                            alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.w3schools.com%2Fcss%2Fdefault.asp&course=CSS" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/5968/5968242.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">CSS (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                            alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.w3schools.com%2Fhtml%2Fdefault.asp&course=HTML" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://cdn-icons-png.flaticon.com/512/1532/1532556.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">HTML (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                            alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.geeksforgeeks.org%2Fjavascript%2Fjavascript-tutorial%2F&course=JavaScript" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://cdn-icons-png.flaticon.com/512/5968/5968292.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">JavaScript (by geeksforgeeks)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://media.geeksforgeeks.org/gfg-gg-logo.svg" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.youtube.com%2Fplaylist%3Flist%3DPLhvdldYcnZMmxgR8iP46Vr3fCZkbACiSo&course=JAVA" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/226/226777.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">Java (by Coding Aliens)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://cdn-icons-png.flaticon.com/512/1384/1384060.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>
    </Section>

    <h1 class="android_text">For Android Development.</h1>
    <Section class="third-wave">
        
        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.geeksforgeeks.org%2Fandroid%2Fa-complete-guide-to-learn-xml-for-android-app-development%2F&course=XML" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://cdn-icons-png.flaticon.com/512/136/136526.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">XML (by geeksforgeeks)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://media.geeksforgeeks.org/gfg-gg-logo.svg" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.geeksforgeeks.org%2Fjava%2Flearn-java-for-android-app-development-a-complete-guide%2F&course=JAVA" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://cdn-icons-png.flaticon.com/512/226/226777.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">Java (by geeksforgeeks)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://media.geeksforgeeks.org/gfg-gg-logo.svg" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Fwww.geeksforgeeks.org%2Fkotlin%2Fkotlin-android-tutorial%2F&course=Kotlin" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://icon.icepanel.io/Technology/svg/Kotlin.svg" alt="" class="lang-logo">
                        <h4 class="lang_txt">Kotlin (by geeksforgeeks)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://media.geeksforgeeks.org/gfg-gg-logo.svg" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Freactnative.dev%2F&course=React Native" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://reactnative.dev/img/header_logo.svg" alt="" class="lang-logo">
                        <h4 class="lang_txt">React Native (by React)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://reactnative.dev/img/header_logo.svg" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https%3A%2F%2Froadmap.sh%2Fjava&course=App Devlopment" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/888/888839.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">App Development (by Roadmap.sh)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://avatars.githubusercontent.com/u/120650344?s=280&v=4" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>
    </Section>

</body>

</html>