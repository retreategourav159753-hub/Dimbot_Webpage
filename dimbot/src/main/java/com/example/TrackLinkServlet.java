package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TrackLinkServlet")
public class TrackLinkServlet extends HttpServlet{
    public static final String URL = System.getenv("DB_URL");
    public static final String USER = System.getenv("DB_USER");
    public static final String PASSWORD = System.getenv("DB_PASSWORD");

    @Override
    protected void doGet(HttpServletRequest request , HttpServletResponse response)
                   throws ServletException , IOException {
                    String sql = "INSERt INTO activity_log (userName,activity) VALUES (?,?)";
                    String url = request.getParameter("url");
                    Cookie[] cookies = request.getCookies();
                    String userName = null;

                    if(cookies != null){
                        for(Cookie cookie : cookies){
                            if("user".equals(cookie.getName())){
                                userName = cookie.getValue();
                                break;
                            }
                        }
                    }
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        try(Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);
                            PreparedStatement psmt = conn.prepareStatement(sql)){
                                psmt.setString(1,userName);
                                psmt.setString(2,url);
                                int updated = psmt.executeUpdate();
                                if(updated > 0){
                                    response.sendRedirect(url);
                                }
                            }
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                   }
}
