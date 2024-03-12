<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Here you Go</title>
<style type="text/css">
.card-text
{
position:absolute;
text-align:center;
width:100%;
height:100%;
}

</style>
</head>
<body>
<%
	
	String name = request.getParameter("user");
    String number = request.getParameter("number");
   int i =0;
   try
   {
	   Class.forName("com.mysql.cj.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
	   Statement stm = con.createStatement();
	   String query="select card from appointments where mobile='"+number+"'and name='"+name+"'";
       ResultSet rs=stm.executeQuery(query);
       while(rs.next())
       {
   		   i =1;
    	   String card = rs.getString(1);
    	   out.println("<h3 class="+"card-text"+"> Card Number:"+card+"</h3>");
       }
       if(i==0)
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