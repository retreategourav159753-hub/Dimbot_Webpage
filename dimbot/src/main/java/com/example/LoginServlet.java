package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    public static final String URL = System.getenv("DB_URL");
    public static final String USER = System.getenv("DB_USER");
    public static final String PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        String sql = "SELECT 1 FROM dimbot_userdata WHERE dim_userName = ? AND dim_userPassword = ? AND dim_userEmail = ? LIMIT 1";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement psmt = conn.prepareStatement(sql)) {
                psmt.setString(1, username);
                psmt.setString(2, password);
                psmt.setString(3, email);

                try (ResultSet rs = psmt.executeQuery()) {
                    if (rs.next()) {
                        Cookie loginCookie = new Cookie("user", username);
                        loginCookie.setMaxAge(60 * 60 * 24 * 30);
                        response.addCookie(loginCookie);
                        response.sendRedirect(request.getContextPath() + "/index");
                    }else {
                        RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp");
                        response.setContentType("text/html");
                        PrintWriter out = response.getWriter();
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Invalid credentials');");
                        out.println("window.location.href='" + request.getContextPath() + "/Login.jsp';");
                        out.println("</script>");
                        rd.include(request, response);
                    }
                }
            }

        } catch (Exception e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Database Connection Failed!');");
            out.println("window.history.back();");
            out.println("</script>");
        }
    }
}

