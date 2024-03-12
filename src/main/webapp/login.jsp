<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
int f;
String name = request.getParameter("user");
String pass = request.getParameter("password");

try
{

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");

Statement stm = con.createStatement();
ResultSet rs=stm.executeQuery("select name,password from registers where name='"+name+"' and password='"+pass+"'");
f=0;
while(rs.next())
{
	String n = rs.getString("name");
	String p = rs.getString("password");
	
f=1;

}

if(f==1)
{
	response.sendRedirect("appointments.html");
	
}
else
{
	response.sendRedirect("error.html");
}

rs.close();
stm.close();
con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>