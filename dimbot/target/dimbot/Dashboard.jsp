<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <% List<String> labels =
            (List<String>) request.getAttribute("labels");

                List<Integer> values =
                    (List<Integer>) request.getAttribute("values");
                        if(labels == null){
                        labels = new java.util.ArrayList<>();
                            }

                            if(values == null){
                            values = new java.util.ArrayList<>();
                                }
                                %>
                                <!DOCTYPE html>
                                <html lang="en">

                                <head>
                                    <meta charset="UTF-8">
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                    <title>Dimbot</title>
                                    <link rel="stylesheet"
                                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                                    <link rel="icon" href="https://i.ibb.co/PGKcsTyZ/dd.png">
                                    <link rel="stylesheet" href="Dashboard.css">
                                    <script type="text/javascript"
                                        src="https://www.gstatic.com/charts/loader.js"></script>

                                </head>

                                <body>
                                    <% String userName=null; Cookie[] cookies=request.getCookies(); if (cookies !=null){
                                        for(Cookie cookie : cookies){ if(cookie.getName().equals("user")){
                                        userName=cookie.getValue(); } } } if(userName==null){
                                        response.sendRedirect(request.getContextPath() + "/Login.jsp" ); } %>

                                        <script>
                                            google.charts.load('current', { 'packages': ['corechart'] });
                                            google.charts.setOnLoadCallback(drawChart);

                                            function drawChart() {

                                                var data = new google.visualization.DataTable();

                                                data.addColumn('date', 'Date');
                                                data.addColumn('number', 'Visits');

                                                data.addRows([
        <%
        for (int i = 0; i < labels.size(); i++) {
                                                    String[] d = labels.get(i).split("-");
        %>
                                                        [new Date(<%= d[0] %>, <%= Integer.parseInt(d[1]) - 1 %>, <%= d[2] %>), <%= values.get(i) %>],
        <%
        }
        %>
    ]);

                                                var options = {
                                                    title: 'Daily User Activity',
                                                    legend: 'none'
                                                };

                                                var chart = new google.visualization.LineChart(
                                                    document.getElementById('myChart')
                                                );

                                                chart.draw(data, options);
                                            }
                                        </script>
                                        <header class="header-main sticky">
                                            <div class="dim_logo">
                                                <img src="https://i.ibb.co/PGKcsTyZ/dd.png" alt="Dimbot Logo"
                                                    style="width: 30%;">
                                            </div>
                                            <nav class="nav_bar">
                                                <ul>
                                                    <li><a href="home.jsp" class="header_links">Home</a></li>
                                                    <li><a href="Courses.jsp" class="header_links">Courses</a></li>
                                                    <li><a href="#ContactUs" class="header_links">Contact Us</a></li>
                                                </ul>
                                            </nav>

                                            <div class="search_bar">
                                                <input type="search" placeholder="Search what you want to learn..."
                                                    class="search_input">
                                                <button type="submit" class="search_icon"><i
                                                        class="fa fa-search"></i></button>
                                            </div>

                                            <div class="user_name">
                                                <button class="logo_user"
                                                    style="background:none; border: none; padding: none; cursor: pointer;"
                                                    type="button">
                                                    <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png"
                                                        alt="" class="username_logo">
                                                </button>
                                                <a href="#dashboard" class="header_links">
                                                    <%= userName %>
                                                </a>
                                            </div>
                                            <div class="user_log">
                                                <form action="LogoutServlet" method="post">
                                                    <button type="submit" class="header_links"
                                                        style="background: none; border: none; font-size: 16px;">Log
                                                        out</button>
                                                </form>
                                            </div>
                                        </header>
                                        <section class="first-wave">
                                            <div class="welcome">
                                                <h1 class="greet">Dashboard</h1>
                                                <p class="about_us">Hello <%= userName%>
                                                </p>
                                            </div>
                                        </section>
                                        <h1 style="color: white; margin-top: 50px; margin-left: 100px;">Your Profile.
                                        </h1>
                                        <Section class="profile">
                                            <div id="myChart" style="width:50%; max-width:600px; height:29.17%;background: #e6e6e6;
    backdrop-filter: blur(20px);padding:20px;
    margin:20px;border-radius:10px;
    box-shadow:0 0 10px #ccc;
    box-sizing: border-box;"></div>
                                            <div class="cards streak-card">
                                                <div class="streak-icon">🔥</div>

                                                <h2>
                                                    ${streak}
                                                </h2>

                                                <p>Day Streak</p>
                                            </div>
                                            <div class="cards">

                                            </div>
                                        </Section>


                                </body>

                                </html>