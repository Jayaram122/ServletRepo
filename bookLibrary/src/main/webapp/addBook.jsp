<%@page import="java.sql.*" %>
<html>
<head><title>Add Book</title></head>
<body>

<%
int a=1;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_db", "root", "Jayaram");
     Statement stmt = con.createStatement();
     ResultSet re = stmt.executeQuery("select max(id) from books");
     while(re.next())
     {
    	int id= re.getInt(1);
    	a= id+1;
     }
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
    <h2>Add New Book</h2>
    <form action="add" method="post">
     <h2>Book Id:<%out.println(a); %></h2>
        Title: <input type="text" name="title" required><br>
        Author: <input type="text" name="author" required><br>
        Year: <input type="number" name="year" required><br>
        Quantity: <input type="number" name="quantity" required><br>
        Price: <input type="text" name="price" required><br>
        <input type="submit" value="Add Book">
    </form>
</body>
</html>
