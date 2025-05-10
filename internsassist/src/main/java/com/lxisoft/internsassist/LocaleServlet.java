package com.lxisoft.internsassist;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LocaleServlet")
public class LocaleServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lang = request.getParameter("lang");
    
        switch (lang) {
            case "loginml":
                Locale mlLocale = new Locale.Builder().setLanguage("en").build();
                ResourceBundle mlResourceBundle = ResourceBundle.getBundle("messages_ml", mlLocale);
                request.setAttribute("language", mlResourceBundle);

                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response); 

                break;
        
            case "loginen":
                Locale enLocale = Locale.ENGLISH;
                ResourceBundle enResourceBundle = ResourceBundle.getBundle("messages_en", enLocale);
                request.setAttribute("language", enResourceBundle);

                RequestDispatcher dispatcher1 = request.getRequestDispatcher("login.jsp");
                dispatcher1.forward(request, response); 

                break;

            case "signupen":
                Locale enSignup = Locale.ENGLISH;
                ResourceBundle enSignupResourceBundle = ResourceBundle.getBundle("messages_en", enSignup);
                request.setAttribute("language", enSignupResourceBundle);

                RequestDispatcher dispatcher2 = request.getRequestDispatcher("signup.jsp");
                dispatcher2.forward(request, response); 

                break;

                case "signupml":
                Locale mlSignup = new Locale.Builder().setLanguage("en").build();
                ResourceBundle mlSignupResourceBundle = ResourceBundle.getBundle("messages_ml", mlSignup);
                request.setAttribute("language", mlSignupResourceBundle);

                RequestDispatcher dispatcher3 = request.getRequestDispatcher("signup.jsp");
                dispatcher3.forward(request, response); 

                break;
        
        }
        
    }
}


