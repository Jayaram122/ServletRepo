<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String emailid=session.getAttribute("userEmail"). toString();
String product_id=request.getParameter ("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","Jayaram");
Statement stmst=con.createStatement();
ResultSet rs=stmst.executeQuery("select * from product where id='"+product_id+"'");
while(rs.next())
{
product_price=rs.getInt(4); 
product_total=product_price;
}
ResultSet rs1=stmst. executeQuery("select * from cart where product_id='"+product_id+"' and email='"+emailid+"' and address is NULL"); 
while(rs1.next())
{
cart_total=rs1.getInt(5);
cart_total=cart_total+product_total; 
quantity=rs1.getInt(3); 
quantity=quantity+1; 
z=1;
}
if (z==1)
{
stmst. executeUpdate("update cart set total='"+cart_total+"', quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+emailid+"' and address is null");
response. sendRedirect ("home.jsp?msg=addedExist");
}
if (z==0)
{
PreparedStatement stsmt=con.prepareStatement("insert into cart (email, product_id, quantity, price, total) values (?,?,?,?,?)"); 
stsmt.setString(1, emailid); 
stsmt.setString(2, product_id); 
stsmt.setInt(3, quantity);
stsmt.setInt(4, product_price);
stsmt.setInt(5, product_total);
stsmt.executeUpdate();
response.sendRedirect ("home.jsp?msg=added");
}
}
catch(Exception e)
{
	response.sendRedirect ("home.jsp?msg=Nadded");
	e.printStackTrace();
}
%>
</body>
</html>