package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    public static final String URL = System.getenv("DB_URL");
    public static final String USER = System.getenv("DB_USER");
    public static final String PASSWORD = System.getenv("DB_PASSWORD");

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("username");
        String userPassword = request.getParameter("password");
        String userEmail = request.getParameter("email");

        try {
            String sql = "INSERT INTO dimbot_userdata (dim_userName,dim_userPassword,dim_userEmail) VALUES (?,?,?)";

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            PreparedStatement psmt = conn.prepareStatement(sql);

            psmt.setString(1, userName);
            psmt.setString(2, userPassword);
            psmt.setString(3, userEmail);

            int rowsInserted = psmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("home.jsp");
            }
        } catch (Exception e) {

            response.setContentType("text/html");

            PrintWriter output = response.getWriter();

            output.println("<script type='text/javascript'>");

            output.println("alert('Database Connection Failed!');");

            output.println("window.history.back();");

            output.println("</script>");
        }
    }

}
