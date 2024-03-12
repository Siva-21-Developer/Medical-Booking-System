<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
     <%@ page import="java.io.*"%>
    <%@ page import="java.net.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.net.URLEncoder" %>
    <%@ page import="java.net.URL" %>
    <%@ page import="javax.net.ssl.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Successful</title>
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/all.min.css">
<script type="text/javascript">
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
        
            timer = 0;
        if(timer==0)
        {
        window.location.href = "homes.html";
				}
            // timer = duration; // uncomment this line to reset timer automatically after reaching 0
        }
    }, 1000);
}

window.onload = function () {
    var time = 10, // your time in seconds here
        display = document.querySelector('#safeTimerDisplay');
    startTimer(time, display);
};
</script>

    <style>
        *
        {
            margin: 0;
            padding: 0;
        }
        ::-webkit-scrollbar
{
width:10px;
}

::-wegkit-scrollbar-track
{
background:#333;
}

::-webkit-scrollbar-thumb
{
height: 50px;
background: white;
border-radius:30px;
}
        

.container1
{
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    position:absolute;
    width: 100%;
    display: block;
    text-align: center;
    z-index: 100;
    top:100px;
}

.container1 h1
{
margin: 20px;
position: relative;
display: block;
}

.container1 h1 a{
    color: white;
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
try
{
int amount =(int)session.getAttribute("amount");
amount = amount - 1000;
int amt =1000;
int first =Integer.parseInt(request.getParameter("first"));
int otp =(int)session.getAttribute("user");
String name = (String)session.getAttribute("name");
String date = (String)session.getAttribute("date");
String time = (String)session.getAttribute("time");
String mobile = (String)session.getAttribute("mobile");

if(name!=null)
{

    String  message="SVS HEALTH CARE CENTER, \n"
    		+name+ ",\n "
    		+"YOUR APPOINTMENT IS REGISTER. DATE:"+date+", TIME:"+time+"\n AND - "
    		+amt+"- PAYMENT SUCCESSFULLY.";  
//System.out.println(message);
//System.out.println(number);
try
{

String apiKey="YGRCMOBbUf8r3aVoQtxiSAjLH0T1c46qeP2yvkZDszF9wWugEN30lfwCnZo4WjgQxMLikUVAPmtGdOvb";
String sendId="FSTSMS";
//important step...
message=URLEncoder.encode(message, "UTF-8");
String language="english";

String route="p";


String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+mobile;

//sending get request using java..

URL url=new URL(myUrl);

HttpsURLConnection con=(HttpsURLConnection)url.openConnection();


con.setRequestMethod("GET");

con.setRequestProperty("User-Agent", "Mozilla/5.0");
con.setRequestProperty("cache-control", "no-cache");
//out.println("Wait..............");

int code=con.getResponseCode();


StringBuffer response1=new StringBuffer();

BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));

while(true)
{
	String line=br.readLine();
	if(line==null)
	{
		break;
	}
	response1.append(line);
}
}catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}	
}
	 
	if (first == otp)
	{		
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
Statement stm = con.createStatement();
stm.executeUpdate("UPDATE registers SET amount ='"+amount+"' WHERE phone = '"+mobile+"'");
stm.executeUpdate("UPDATE appointments SET amount ='"+amt+"' WHERE mobile ='"+mobile+"'");
out.println("<div class='container1'>");
out.println("<h1><i class='fa-solid fa-circle-check'></i>Your Appointment successfully </h1>");
out.println("<br><br>");
out.println("<div id='safeTimer'>");
out.println("<h2>Back to home Page</h2>");
out.println("<p id='safeTimerDisplay'>5</p> </div>");
stm.close();
con.close();
	}
}

catch(Exception e)
{
	out.println(e);
}




%>

</body>
</html>