
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
<title>Payment Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/all.min.css">
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-size: 17.5px;
}

body
{
    background-color: #89ffba;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

body::after
{
    position: absolute;
    content: '';
    width: 50%;
    height: 100%;
    background-color: aliceblue;
    z-index: -1;
    right: 0;
}

.container
{
position: absolute;
background-color: white;
border-radius: 10px;
border: none;
width: 900px;
height: 600px;
padding: 50px;
}

.container h1
{
    position: relative;
    width: 550px;
    height: 50px;
}


.form-control
{
    width: 300px;
    margin: 10px -15px;
}

.btn-success
{
    border: none;
    border-radius: 5px;
    width: 250px;
}
.containers {
  display: flex;
  flex-flow: column;
  width: 250px;
  height: 50px;
  align-items: space-around;  
  justify-content: center;
  border-radius: 10px;
}


input {

  height: 35px;
  width: 105px;
  border: none;
  border-radius: 5px;
  text-align: center;
  font-family: arimo;
  font-size: 2.5rem;
  background: white;
  color: black;
}
.card
{
    position: absolute;
    background-color: rgb(245, 245, 245);
    width: 300px;
    height: 300px;
    right: 0;
    top: 0;
    margin: 20px;
    border-radius: 6px;
    text-align: center;
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
</style>
</head>
<body>
    <%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String date = request.getParameter("date");
    String pass = request.getParameter("password");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");

int amount =0;
Random random = new Random();

int cards = random.nextInt(10000000);

String id =("HCC"+name+cards);


int ids = random.nextInt(10000);

int otp=ids;

if(phone!=null)
{

    String  message="SVS HEALTH CARE CENTER - Your otp:"+otp+ ". Don't share this anyone!";

  
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


String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+phone;

//sending get request using java..

URL url=new URL(myUrl);

HttpsURLConnection con=(HttpsURLConnection)url.openConnection();


con.setRequestMethod("GET");

con.setRequestProperty("User-Agent", "Mozilla/5.0");
con.setRequestProperty("cache-control", "no-cache");
out.println("Wait..............");

int code=con.getResponseCode();

out.println("Response code : "+code);

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



try
{

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
Statement stm = con.createStatement();
stm.executeUpdate("insert into registers (name,email,dob,password,phone,address,card,amount) values('"+name+"','"+email+"','"+date+"','"+pass+"','"+phone+"','"+address+"','"+id+"','"+amount+"')");
}
catch(Exception e)
{
	out.println(e);
}
%>
<div class="container">
<%session.setAttribute("user",otp); 
session.setAttribute("name",name);
%>
    <form action="registers.jsp" method="post" autocomplete="off">
        <% out.println("<h1>"+name+"</h1>"); %>
        <% out.println("<h1>"+id+"</h1>"); %>  
        <% out.println("<h1>"+address+"</h1>"); %>
        <br>
       <div class="card">
            <h2>Health Care Center</h2>
            <h3>Discount 10%</h3>
        </div>
        <input type="text" class="form-control" placeholder="Confirm Phone Number" id="number" name="number">
        <input type="text" class="form-control" name="amount">

        <h2>ENTER OTP</h2>
        <div class="containers">
          <input type="text" id='ist' name="first" maxlength="4" class="form-control" placeholder="otp" >
        </div>
        <input type="submit"  value="Payment" class=" btn-success">
        <hr>
    </form>
</div>
</body>
</html>