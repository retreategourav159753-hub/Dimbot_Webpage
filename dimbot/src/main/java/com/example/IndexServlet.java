package com.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/index")
public class IndexServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        Cookie[] cookies = request.getCookies();
        boolean hasVisited = false;
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("user")){
                    hasVisited = true;
                    break;
                }
            }
        }
        if(hasVisited){
            response.sendRedirect(request.getContextPath() + "/home.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/welcome.html");
        }
    }
    
}
