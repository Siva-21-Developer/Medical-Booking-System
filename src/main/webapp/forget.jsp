<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<body>
<%
String name = request.getParameter("user");
String number = request.getParameter("phone");
String pass = request.getParameter("password");

if((name!=null) && (pass!=null))
{
try
{

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");

Statement stm = con.createStatement();
stm.executeUpdate("update registers set password='"+pass+"' where name='"+name+"' and phone='"+number+"'");
out.println("success");
response.sendRedirect("login.html");
}


catch(Exception e)
{
	out.println(e);
}

}

else
{
	
out.println("<h1></h1>");
}


%>
</body>
</html>