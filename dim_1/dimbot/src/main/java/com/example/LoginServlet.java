package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    public static final String URL = System.getenv("DB_URL");
    public static final String USER = System.getenv("DB_USER");
    public static final String PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("username");
        String userPassword = request.getParameter("password");
        String userEmail = request.getParameter("email");
        String sql = "SELECT EXISTS(SELECT 1 FROM dimbot_userdata WHERE dim_userName = ? AND dim_userPassword = ? AND dim_userEmail = ?) AS user_exists";

        try {
            boolean userExists = false;
            Class.forName("com.mysql.cj.jdbc.Driver");
            try(Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);
            PreparedStatement psmt = conn.prepareStatement(sql)){
                psmt.setString(1, userName);
            psmt.setString(2, userPassword);
            psmt.setString(3, userEmail);

            try (ResultSet rs = psmt.executeQuery()) {
                if (rs.next()) {
                    userExists = rs.getInt("user_exists") == 1;
                }
            }

            if (userExists) {
                HttpSession session = request.getSession();
                session.setAttribute("username", userName);
                response.sendRedirect(request.getContextPath() + "/home.jsp");
            } else {
                response.setContentType("text/html");

                PrintWriter output = response.getWriter();

                output.println("<script>");
                output.println("alert('Wrong Credentials!');");
                output.println("window.history.back();");
                output.println("</script>");
            }
            }

        } catch(Exception e){
    e.printStackTrace();

    response.setContentType("text/html");
    response.getWriter().println("Error: " + e.getMessage());
}
    }
}
