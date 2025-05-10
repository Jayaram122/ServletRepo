package com.lxisoft.internsassist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.InputStream;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.Blob;

@WebServlet("/InternDetails")
public class InternDetalis extends HttpServlet
{
    Connection connection;

    public void init(){
        
        String url="jdbc:mysql://localhost:3306/internsassist";
        String name="root";
        String pass="Jayaram";
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url,name,pass); 
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
   
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{

        Internsassist interns = this.profile(request);
        request.setAttribute("intern" , interns);

        RequestDispatcher d = request.getRequestDispatcher("profileAdminOption.jsp");
        d.forward(request, response);
    }

    public Internsassist profile(HttpServletRequest request)
    {
        Internsassist intern = new Internsassist();

        try{   
            String pname = request.getParameter("name");
            String getQuery = "select * from internsassistinfo where user_Name='" +pname+"'";
            Statement statement = connection.createStatement();
            ResultSet result =statement.executeQuery(getQuery);

            while(result.next()){
                intern.setRealName(result.getString("name"));
               intern.setPoints(result.getInt("point"));
               intern.setPhone(result.getString("phoneNumber"));
               intern.setMail_id(result.getString("mail_Id"));
               intern.setRole_name(result.getString("role_Name"));
               Blob photoBlob = result.getBlob("photo");

               if (photoBlob != null) {
                InputStream photoStream = photoBlob.getBinaryStream();
                intern.setInputstream(photoStream);
            } else {
                intern.setInputstream(null); // Or set a default image stream if desired
            }
            }
        }

        catch(SQLException e){
            e.printStackTrace();
        }

        return intern ;
    }
    
}