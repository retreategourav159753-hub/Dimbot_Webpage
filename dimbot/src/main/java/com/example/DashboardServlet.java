package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        Cookie[] cookies= request.getCookies();
        if(cookies!=null){
            for(Cookie cookie : cookies){
                if("user".equals(cookie.getName())){
                    userName= cookie.getValue();
                    break;
                }
            }
        }
        

        List<String> labels = new ArrayList<>();
        List<Integer> values = new ArrayList<>();
        Map<String, Integer> activityMap = new HashMap<>();
        int streak = 0;
        int activeDays = 0;
        int score = 0;
        List<String> courseNames = new ArrayList<>();
        List<Integer> courseProgress = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {

            // 1. Daily visit counts + activity map (single pass over the ResultSet)
            String sql = "SELECT activity_date, COUNT(*) AS visits " +
                    "FROM activity_log " +
                    "WHERE userName = ? " +
                    "GROUP BY activity_date " +
                    "ORDER BY activity_date";

            try (PreparedStatement psmt = conn.prepareStatement(sql)) {
                psmt.setString(1, userName);
                try (ResultSet rs = psmt.executeQuery()) {
                    while (rs.next()) {
                        String date = rs.getDate("activity_date").toString();
                        int visits = rs.getInt("visits");

                        labels.add(date);
                        values.add(visits);
                        activityMap.put(date, visits);
                    }
                }
            }

            // 2. Current streak
            String streakSql = "SELECT DISTINCT activity_date " +
                    "FROM activity_log " +
                    "WHERE userName = ? " +
                    "ORDER BY activity_date DESC";

            try (PreparedStatement ps = conn.prepareStatement(streakSql)) {
                ps.setString(1, userName);
                try (ResultSet rst = ps.executeQuery()) {

                    List<LocalDate> activityDates = new ArrayList<>();
                    while (rst.next()) {
                        activityDates.add(rst.getDate("activity_date").toLocalDate());
                    }

                    if (!activityDates.isEmpty()) {
                        LocalDate expectedDate = LocalDate.now();

                        // If today has no entry yet, allow the streak to still count
                        // as "alive" if the most recent activity was yesterday.
                        if (!activityDates.get(0).equals(expectedDate)
                                && activityDates.get(0).equals(expectedDate.minusDays(1))) {
                            expectedDate = expectedDate.minusDays(1);
                        }

                        for (LocalDate dbDate : activityDates) {
                            if (dbDate.equals(expectedDate)) {
                                streak++;
                                expectedDate = expectedDate.minusDays(1);
                            } else {
                                break;
                            }
                        }
                    }
                }
            }

            // 3. Active days in the last 30 days
            String consistencySql = "SELECT COUNT(DISTINCT activity_date) " +
                    "FROM activity_log " +
                    "WHERE userName = ? " +
                    "AND activity_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)";

            try (PreparedStatement psConsistency = conn.prepareStatement(consistencySql)) {
                psConsistency.setString(1, userName);
                try (ResultSet rsConsistency = psConsistency.executeQuery()) {
                    if (rsConsistency.next()) {
                        activeDays = rsConsistency.getInt(1);
                    }
                }
            }

            score = (activeDays * 100) / 30;

            // 4. Per-course progress for the current month
            String progressSql = "SELECT course_name, " +
                    "COUNT(DISTINCT activity_date) AS days " +
                    "FROM activity_log " +
                    "WHERE userName = ? " +
                    "AND MONTH(activity_date) = MONTH(CURDATE()) " +
                    "AND YEAR(activity_date) = YEAR(CURDATE()) " +
                    "GROUP BY course_name";

            try (PreparedStatement psProgress = conn.prepareStatement(progressSql)) {
                psProgress.setString(1, userName);
                try (ResultSet rsProgress = psProgress.executeQuery()) {
                    int daysInMonth = LocalDate.now().lengthOfMonth();

                    while (rsProgress.next()) {
                        String course = rsProgress.getString("course_name");
                        int actDays = rsProgress.getInt("days");
                        int progress = (actDays * 100) / daysInMonth;

                        courseNames.add(course);
                        courseProgress.add(progress);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to load dashboard data. Please try again later.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }

        request.setAttribute("labels", labels);
        request.setAttribute("values", values);
        request.setAttribute("streak", streak);
        request.setAttribute("activityMap", activityMap);
        request.setAttribute("activeDays", activeDays);
        request.setAttribute("score", score);
        request.setAttribute("courseNames", courseNames);
        request.setAttribute("courseProgress", courseProgress);

        request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
    }
}