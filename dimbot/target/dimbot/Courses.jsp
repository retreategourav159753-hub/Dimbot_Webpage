<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dimbot</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="icon" href="https://i.ibb.co/PGKcsTyZ/dd.png">
    <link rel="stylesheet" href="Courses.css">
</head>

<body>
    <%
    String userName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("user")){
                userName = cookie.getValue();
                break;
            }
        }
    }
    %>
    <header class="header-main sticky">
        <div class="dim_logo">
            <img src="https://i.ibb.co/PGKcsTyZ/dd.png" alt="Dimbot Logo" style="width: 30%;">
        </div>
        <nav class="nav_bar">
            <ul>
                <% if(userName != null) { %>
                <li><a href="home.jsp" class="header_links">Home</a></li>
                <li><a href="DashboardServlet" class="header_links">Dashboard</a></li>
                <% }else { %>
                <li><a href="welcome.html" class="header_links">Home</a></li>
                <% } %>
                <li><a href="#ContactUs" class="header_links">ContactUs</a></li>
            </ul>
        </nav>

        <div class="search_bar">
            <input type="search" placeholder="Search what you want to learn..." class="search_input">
            <button type="submit" class="search_icon"><i class="fa fa-search"></i></button>
        </div>

        <% if (userName != null) {%>
        <div class="user_name">
            <button class="logo_user" style="background:none; border: none; padding: none; cursor: pointer;" type="button">
                <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png" alt="" class="username_logo" >
            </button>
             <a href="#dashboard" class="header_links"><%= userName %></a>
        </div>
        <div class="user_log">
        <form action="LogoutServlet" method="post">
            <button type="submit" class="header_links" style="background: none; border: none; font-size: 16px;">Log out</button>
        </form>
        </div>
        <% } else { %>
            <div class="user_log">
            <ul>
                <li><a href="Login.jsp" class="header_links">Login</a></li>
                <li><a href="Register.html" class="header_links">Sign Up</a></li>
            </ul>
        </div>
        <% } %>
    </header>
    <section class="first-wave">
        <div class="welcome">
            <% if (userName != null) { %>
                <h1 class="greet">Hello, <%= userName %>!</h1>
            <% } else { %>
                <h1 class="greet">Hello, Unknown!</h1>
            <% } %>
            <p class="about_us">Here are the list of courses you might like!</p>
        </div>
    </section>


    <% if(userName != null){ %>

    <h1 class="courses_01">Frontend Web Development.</h1>   
    <Section class="second-wave">

        <a href="TrackLinkServlet?url=https://www.w3schools.com/html/default.asp" target="_blank">
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

        <a href="TrackLinkServlet?url=https://www.w3schools.com/css/default.asp" target="_blank">
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

        <a href="TrackLinkServlet?url=https://www.geeksforgeeks.org/javascript/javascript-tutorial/" target="_blank">
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

        <a href="TrackLinkServlet?url=https://www.w3schools.com/typescript/" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://icon.icepanel.io/Technology/svg/TypeScript.svg"
                            alt="" class="lang-logo">
                        <h4 class="lang_txt">TypeScript (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                            alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>
    </Section>

    <h1 class="android_text">Backend Web Development.</h1>
    <Section class="third-wave">
        
        <a href="TrackLinkServlet?url=https://www.w3schools.com/python/default.asp" target="_blank">
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

        <a href="TrackLinkServlet?url=https://www.geeksforgeeks.org/java/learn-java-for-android-app-development-a-complete-guide/" target="_blank">
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

        <a href="TrackLinkServlet?url=https://www.w3schools.com/php/" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/5968/5968332.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">PHP (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https://www.w3schools.com/react/default.asp" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://cdn-icons-png.flaticon.com/512/919/919851.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">React (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https://www.w3schools.com/cs/index.php" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/6132/6132221.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">C# (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>
    </Section>

    <h1 class="courses_01">R/NR Database Languages.</h1>   
    <Section class="third-wave">

        <a href="TrackLinkServlet?url=https://www.w3schools.com/mysql/default.asp" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/919/919836.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">MySQL (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                            alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https://www.w3schools.com/postgresql/index.php" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://cdn-icons-png.flaticon.com/512/10832/10832145.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">PostgreSQL (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                            alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="TrackLinkServlet?url=https://www.w3schools.com/mongodb/index.php" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://www.vectorlogo.zone/logos/mongodb/mongodb-icon.svg" alt="" class="lang-logo">
                        <h4 class="lang_txt">MongoDB (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

    </Section>


    <h1 class="android_text">For Android App Development.</h1>
    <Section class="third-wave">
        
        <a href="TrackLinkServlet?url=https://www.geeksforgeeks.org/android/a-complete-guide-to-learn-xml-for-android-app-development/" target="_blank">
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

        <a href="TrackLinkServlet?url=https://www.geeksforgeeks.org/java/learn-java-for-android-app-development-a-complete-guide/" target="_blank">
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

        <a href="TrackLinkServlet?url=https://www.geeksforgeeks.org/kotlin/kotlin-android-tutorial/" target="_blank">
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

        <a href="TrackLinkServlet?url=https://reactnative.dev/" target="_blank">
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

        <a href="TrackLinkServlet?url=https://roadmap.sh/java" target="_blank">
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
    <% } else { %>
        <h1 class="courses_01">Frontend Web Development.</h1>   
    <Section class="second-wave">

        <a href="https://www.w3schools.com/html/default.asp" target="_blank">
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

        <a href="https://www.w3schools.com/css/default.asp" target="_blank">
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

        <a href="https://www.geeksforgeeks.org/javascript/javascript-tutorial/" target="_blank">
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

        <a href="https://www.w3schools.com/typescript/" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://icon.icepanel.io/Technology/svg/TypeScript.svg"
                            alt="" class="lang-logo">
                        <h4 class="lang_txt">TypeScript (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png"
                            alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>
    </Section>

    <h1 class="android_text">Backend Web Development.</h1>
    <Section class="third-wave">
        
        <a href="https://www.w3schools.com/python/default.asp" target="_blank">
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

        <a href="https://www.geeksforgeeks.org/java/learn-java-for-android-app-development-a-complete-guide/" target="_blank">
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

        <a href="https://www.w3schools.com/php/" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/5968/5968332.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">PHP (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="https://www.w3schools.com/react/default.asp" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="	https://cdn-icons-png.flaticon.com/512/919/919851.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">React (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>

        <a href="https://www.w3schools.com/cs/index.php" target="_blank">
            <div class="flip-card">
                <div class="flip-card-inner">
                    <div class="flip-card-front">
                        <img src="https://cdn-icons-png.flaticon.com/512/6132/6132221.png" alt="" class="lang-logo">
                        <h4 class="lang_txt">C# (by w3Schools)</h4>
                    </div>
                    <div class="flip-card-back">
                        <img src="https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/w3schools-logo-icon.png" alt="" class="source_logo">
                        <h2 class="source-text">Go there!</h2>
                    </div>
                </div>
            </div>
        </a>
    </Section>


    <div style="margin-top: 200px;">
        <h1 class="welcome">Please login to access the other courses.</h1>
        <a href="Login.jsp" style="text-decoration: none;">
        <button class="dashboard_button">Login</button>
        </a>
    </div>
    <% } %>

</body>

</html>