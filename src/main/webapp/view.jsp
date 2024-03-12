<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/all.min.css">

<style>
*
{
padding:0;
margin:0;
}


  body{
  background: linear-gradient(318deg, #ff0062, #ffff00, #00ff00, #00ffff, #0000ff);
background-size: 1000% 1000%;
animation: Coolgradient 41s linear infinite;

}
@keyframes Coolgradient { 
    0%{background-position:5% 0%}
    50%{background-position:96% 100%}
    100%{background-position:5% 0%}
}
.header
{
position:absolute;
width:100%;
height:80px;
background: black;
color: white;
display:flex;
align-items: center;
justify-content:center;
font-size:30px;
}

.container
{
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    font-size: 17px;
    justify-content: space-between;
}

.card
{
    position: relative;
    top: 100px;
    left: 30px;
	height: 500px;
	width: 400px;
	background: rgba(255,255,255,.2);
    border: 1px solid;
    border-radius: 10px;
    border-top-color: rgba(255,255,255,.7);
    border-left-color: rgba(255,255,255,.7);
    border-bottom-color: rgba(255,255,255,.2);
    border-right-color: rgba(255,255,255,.2);
    padding:20px;
	overflow-y: scroll;
	margin-bottom: 25px;
    backdrop-filter: blur(2000px);
    display: flex;
    justify-content: center;
}


.cards
{
    position: relative;
    top: 100px;
    left: 30px;
	height: 550px;
	width: 800px;
	background: rgba(255,255,255,.2);
    border: 1px solid;
    border-radius: 10px;
    border-top-color: rgba(255,255,255,.7);
    border-left-color: rgba(255,255,255,.7);
    border-bottom-color: rgba(255,255,255,.2);
    border-right-color: rgba(255,255,255,.2);
    padding:20px;
	overflow-y: scroll;
	margin-bottom: 25px;
    backdrop-filter: blur(2000px);
    display: flex;
    justify-content: center;
}

#style-1::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: rgba(255,255,255,.2);
}

#style-1::-webkit-scrollbar
{
	width: 8px;
	background:rgba(255,255,255,.2);
}

#style-1::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #555;
}


#style-2::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	border-radius: 10px;
	background-color: rgba(255,255,255,.2);
}

#style-2::-webkit-scrollbar
{
	width: 8px;
	background-color: rgba(255,255,255,.2);
}

#style-2::-webkit-scrollbar-thumb
{
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
	background-color: #D62929;
}

th, td
{
text-align:center;
}


</style>

</head>
<body>
<div class="header">
<h1>ADMIN VIEW</h1>
</div>
<div class="container">
    <div class="card" id="style-1">
      <div >
            <h1>Doctors Details</h1>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">Doctor Name</th>
                    <th scope="col">Department</th>
                  </tr>
                </thead>   
                  <%
            	  Class.forName("com.mysql.cj.jdbc.Driver");
            	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            	  Statement stm = con.createStatement();
                  try
                  {

                	  String query="select name,service from doctor";
                      ResultSet rs=stm.executeQuery(query);
                      int number =1;
                      while(rs.next())
                      {
                	  String name = rs.getString(1);
                	  String depart = rs.getString(2);
                	  out.println("<tbody>");
                	  out.println("<tr>");
                	  out.println("<th scope='row'>"+number+"</th>");
                	  out.println("<td>"+name+"</td>");
                	  out.println("<td>"+depart+"</td>");
                	  out.println("</tr>");
                	  out.println("</tbody>");
                	  number = number+1;
                      }

                  }
                  catch(Exception e)
                  {
                	  out.println(e);
                  }
                  %>
               
              </table>
      </div>
    </div>

    <div class="cards" id="style-2">
        <div class="force-overflow">
              <h1>Patient Appointment Details</h1>
              <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">No</th>
                      <th scope="col">Name</th>
                      <th scope="col">Mobile</th>
                      <th scope="col">Date</th>
                      <th scope="col">Time</th>
                      <th scope="col">Service</th>
                      <th scope="col">Doctor</th>
                      <th scope="col">Amount</th>
                    </tr>
                  </thead>
                  
 <%
   try
   {

	   String query="select name,mobile,date,time,service,doctor,amount from appointments";
       ResultSet rs=stm.executeQuery(query);
 	   int number = 1;
       while(rs.next())
       {
    	   String name = rs.getString(1);
    	   String numbers = rs.getString(2);
    	   String time = rs.getString(3);
    	   String date = rs.getString(4);
    	   String service = rs.getString(5);
    	   String doctor = rs.getString(6);
    	   String amount = rs.getString(7);
    	   out.println("<tbody>");
     	  out.println("<tr>");
     	  out.println("<th scope='row'>"+number+"</th>");
     	  out.println("<td>"+name+"</td>");
     	  out.println("<td>"+numbers+"</td>");
     	  out.println("<td>"+time+"</td>");
     	  out.println("<td>"+date+"</td>");
     	  out.println("<td>"+service+"</td>");
     	  out.println("<td>"+doctor+"</td>");
     	  out.println("<td>"+amount+"</td>");

     	  out.println("</tr>");
     	  out.println("</tbody>");
     	  number = number+1;
       }
        rs.close();
        stm.close();
        con.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %> 
         </table>
        </div>
      </div>
    </div>
</body>
</html>