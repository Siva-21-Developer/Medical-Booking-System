<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Successful</title>
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/all.min.css">


    <style>
        body
        {
            background-color: rgb(38, 235, 38);
        }
        *
        {
            margin: 0;
            padding: 0;
        }

.container1
{
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    position:absolute;
    top:150px;
    width: 100%;
    display: block;
    text-align: center;
    z-index: 100;
}

.container1 h1
{
margin: 20px;
position: relative;
display: block;
}

.container1 h1 a{
    color:black;
    text-decoration: none;
}

html, body { height: 100%; }
body {
  background:radial-gradient(ellipse at center, rgba(255,254,234,1) 0%, rgba(255,254,234,1) 35%, #B7E8EB 100%);
  overflow: hidden;
}

.ocean { 
  height: 5%;
  width:100%;
  position:absolute;
  bottom:0;
  left:0;
  background: #015871;
  z-index:-10;
}

.wave {
  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/85486/wave.svg) repeat-x; 
  position: absolute;
  top: -198px;
  width: 6400px;
  height: 198px;
  animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) infinite;
  transform: translate3d(0, 0, 0);
}

.wave:nth-of-type(2) {
  top: -175px;
  animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) -.125s infinite, swell 7s ease -1.25s infinite;
  opacity: 1;
}

@keyframes wave {
  0% {
    margin-left: 0;
  }
  100% {
    margin-left: -1600px;
  }
}

@keyframes swell {
  0%, 100% {
    transform: translate3d(0,-25px,0);
  }
  50% {
    transform: translate3d(0,5px,0);
  }
}


    </style>
</head>
<body>
<div class="ocean">
  <div class="wave"></div>
  <div class="wave"></div>
</div>
<%

//String name = request.getParameter("name");
//String email = request.getParameter("email");
//String date = request.getParameter("date");
//String pass = request.getParameter("password");
//String phone = request.getParameter("phone");
//String address = request.getParameter("address");

String number = request.getParameter("number");
String amount = request.getParameter("amount");
int first =Integer.parseInt(request.getParameter("first"));
int otp =(int)session.getAttribute("user");
String name = (String)session.getAttribute("name");
String date = (String)session.getAttribute("date");
String time = (String)session.getAttribute("time");



//Random random = new Random();

//int ids = random.nextInt(10000000);

//String id =("HCC"+name+ids);
if (first == otp)
{
try
{

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
Statement stm = con.createStatement();
//stm.executeUpdate("insert into registers (name,email,dob,password,phone,address,card) values('"+name+"','"+email+"','"+date+"','"+pass+"','"+phone+"','"+address+"','"+id+"')");
stm.executeUpdate("UPDATE registers SET amount ='"+amount+"' WHERE phone = '"+number+"'");
out.println("<div class='container1'>");
out.println("<h1><i class='fa-solid fa-circle-check'></i> You Registration Successfully &nbsp;"+name+" </h1>");
out.println("<br><br>");
out.println("<h1> <a href='homes.html'>Click Here</a></h1></div>");
}

catch(Exception e)
{
	out.println(e);
}
}
%>

</body>
</html>