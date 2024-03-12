<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
int f;
String user_name = request.getParameter("name");
String password = request.getParameter("password");

try
{

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");

Statement stm = con.createStatement();
ResultSet rs=stm.executeQuery("select name,password from admins where name='"+user_name+"' and password='"+password+"'");
f =0;
while(rs.next())
{
	String n = rs.getString("name");
	String p = rs.getString("password");
	
f=1;

}

if(f==1)
{
	response.sendRedirect("view.jsp");	
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