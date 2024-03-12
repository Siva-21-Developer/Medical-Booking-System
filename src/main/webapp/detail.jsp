<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/all.min.css">
<title>details</title>
<style type="text/css">
      * {
		padding: 0;
		margin: 0;
	}
    .waves
    {
        z-index: -10;
    }
	svg {
		position: absolute;
		top: 0;
		left: 0;
    width: 100%;
    height: 100%;
		box-sizing: border-box;
		display: block;
		background-color: #0e4166;
    background-image: linear-gradient(to bottom, rgba(14, 65, 102, 0.86), #0e4166);
	}
.card
{
position:absolute;
border-radius:10px;
left:50%;
top:50%;
transform: translate(-50%,-50%);
padding: 20px;
box-shadow: 1px 3px 11px 1px #333;
}

.fa-user
{
    font-size: 150px;
    padding: 20px;
    border: 1px solid white;
    border-radius: 10px;
}

.card-title
{
font-size: 40px;
}

</style>
</head>
<body>
<div class="waves">
    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="100%" height="100%" viewBox="0 0 1600 900" preserveAspectRatio="xMidYMax slice">
        <defs>
          <linearGradient id="bg">
            <stop offset="0%" style="stop-color:rgba(130, 158, 249, 0.06)"></stop>
            <stop offset="50%" style="stop-color:rgba(76, 190, 255, 0.6)"></stop>
            <stop offset="100%" style="stop-color:rgba(115, 209, 72, 0.2)"></stop>
          </linearGradient>
          <path id="wave" fill="url(#bg)" d="M-363.852,502.589c0,0,236.988-41.997,505.475,0
        s371.981,38.998,575.971,0s293.985-39.278,505.474,5.859s493.475,48.368,716.963-4.995v560.106H-363.852V502.589z" />
        </defs>
        <g>
          <use xlink:href='#wave' opacity=".3">
            <animateTransform attributeName="transform" attributeType="XML" type="translate" dur="10s" calcMode="spline" values="270 230; -334 180; 270 230" keyTimes="0; .5; 1" keySplines="0.42, 0, 0.58, 1.0;0.42, 0, 0.58, 1.0" repeatCount="indefinite" />
          </use>
          <use xlink:href='#wave' opacity=".6">
            <animateTransform attributeName="transform" attributeType="XML" type="translate" dur="8s" calcMode="spline" values="-270 230;243 220;-270 230" keyTimes="0; .6; 1" keySplines="0.42, 0, 0.58, 1.0;0.42, 0, 0.58, 1.0" repeatCount="indefinite" />
          </use>
          <use xlink:href='#wave' opacty=".9">
            <animateTransform attributeName="transform" attributeType="XML" type="translate" dur="6s" calcMode="spline" values="0 230;-140 200;0 230" keyTimes="0; .4; 1" keySplines="0.42, 0, 0.58, 1.0;0.42, 0, 0.58, 1.0" repeatCount="indefinite" />
          </use>
        </g>
      </svg>
    </div>
<div class="card mb-3" style="width: 640px;background-color:rgba(10, 7, 16, 0.403); color:white; height:500px;">
  <div class="row g-0">
    <div class="col-md-4">
      <i class="img-fluid rounded-start fa-solid fa-user"> </i>
    </div>
    <div class="col-md-8">
      <div class="card-body">

 <%
   String number = request.getParameter("phone");

 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
 Statement stm = con.createStatement();

   int i =0;
   try
   {   String query="select name,email,dob,phone,card from registers where phone='"+number+"'";
       ResultSet rs=stm.executeQuery(query);
       while(rs.next())
       {
   		   i =1;
    	   String name = rs.getString(1);
    	   out.println("<h1 class="+"card-title"+">"+name+"</h1>");
    	   String mail = rs.getString(2);
    	   out.println("<h3 class="+"card-text"+">Email :"+mail+"</h3>");
    	   String dob = rs.getString(3);
    	   out.println("<h3 class="+"card-text"+">DOB&nbsp;&nbsp;&nbsp;&nbsp;:"+dob+"</h3>");
    	   String phone = rs.getString(4);
    	   out.println("<h3 class="+"card-text"+">Mobile&nbsp;&nbsp;&nbsp;&nbsp;:"+phone+"</h3>");
    	   String card = rs.getString(5);
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
         <p class="card-text"> <br>
        </p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
  
      </div>
    </div>
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

	   String query="select name,mobile,date,time,service,doctor,amount from appointments where mobile="+number+"";
       ResultSet rs=stm.executeQuery(query);
 	   int numbe = 1;
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
     	  numbe = numbe+1;
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
   
</body>
</html>
