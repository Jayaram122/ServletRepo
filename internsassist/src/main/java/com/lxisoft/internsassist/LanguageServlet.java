package com.lxisoft.internsassist;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LocaleServlett")
public class LanguageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lang = request.getParameter("lang");
        ResourceBundle resourceBundle;
    
        if("ml".equals(lang)) {
            Locale mlLocale = new Locale.Builder().setLanguage("ml").build();
            resourceBundle = ResourceBundle.getBundle("messages_ml", mlLocale);
        } else {
            Locale enLocale = Locale.ENGLISH;
            resourceBundle = ResourceBundle.getBundle("messages_en", enLocale);
        }

        HttpSession session = request.getSession();
        session.setAttribute("language", resourceBundle);

        response.sendRedirect(request.getHeader("referer"));
    }
    
}