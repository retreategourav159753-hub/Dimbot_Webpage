package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    public static final String URL = System.getenv("DB_URL");
    public static final String USER = System.getenv("DB_USER");
    public static final String PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName())) {
                    userName = cookie.getValue();
                    break;
                }
            }
        }
        List<String> labels = new ArrayList<>();
        List<Integer> values = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT activity_date, COUNT(*) AS visits " +
                    "FROM activity_log " +
                    "WHERE userName=? " +
                    "GROUP BY activity_date " +
                    "ORDER BY activity_date";

            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, userName);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                labels.add(
                        rs.getDate("activity_date").toString());
                values.add(
                        rs.getInt("visits"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("labels", labels);
        request.setAttribute("values", values);

        request.getRequestDispatcher("Dashboard.jsp")
                .forward(request, response);
    }

}
