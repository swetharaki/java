<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>  
<%@ page import="java.io.PrintWriter"%>

<%
	if(request.getSession().getAttribute("email") == null) {
		response.sendRedirect(request.getContextPath() + "/Login.jsp");
		return;
	}
%>    



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Edit</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="c.css" />
    <script>   
    function goBack() 
	{
    	window.history.back();
	}

</script>


<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction1() {
    document.getElementById("myDropdown1").classList.toggle("show1");
}
function myFunction2() {
    document.getElementById("myDropdown2").classList.toggle("show2");
}

function myFunction3() {
    document.getElementById("myDropdown3").classList.toggle("show3");
}
// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');


      }
    }
  }
  if (!event.target.matches('.dropbtn1')) {

    var dropdowns1 = document.getElementsByClassName("dropdown-content1");
    var j;
    for (j = 0; j < dropdowns1.length; j++) {
      var openDropdown1 = dropdowns1[j];
      if (openDropdown1.classList.contains('show1')) {
        openDropdown1.classList.remove('show1');

      }
    }
  }

if (!event.target.matches('.dropbtn2')) {

    var dropdowns2 = document.getElementsByClassName("dropdown-content2");
    var k;
    for (k = 0; k < dropdowns2.length; k++) {
      var openDropdown2 = dropdowns2[k];
      if (openDropdown2.classList.contains('show2')) {
        openDropdown2.classList.remove('show2');

      }
    }
  }

if (!event.target.matches('.dropbtn3')) {

    var dropdowns3 = document.getElementsByClassName("dropdown-content3");
    var n;
    for (n = 0; n < dropdowns3.length; n++) {
      var openDropdown3 = dropdowns3[n];
      if (openDropdown3.classList.contains('show3')) {
        openDropdown3.classList.remove('show3');

      }
    }
  }

}
</script>
</head>
<body>

<p><img src="logo.jpg" alt="Smiley face" height="80" width="120" align="left"/>
<pre><h1 align="left">        
  JAIL EXPOSURE SYSTEM </h1></pre>
</p>

<h2>	
<div>
 
  				<a class="active" href="Userhome.jsp"> Home </a></li>
       			
<ul>
<div class="dropdown">
<button onclick="myFunction()" class="dropbtn">Login&#9207</button>
  <div id="myDropdown" class="dropdown-content">
    <a >Admin</a>
    <a >Any walkin</a>
    
  </div>
</div>
<div class="dropdown1">
<button onclick="myFunction1()" class="dropbtn1">Registration&#9207</button>
  <div id="myDropdown1" class="dropdown-content1">
    <a >Admin</a>
    <a >Any walkin</a>
    
  </div>
</div>



<li style="margin-left:600px";>
<div class="dropdown">
<button onclick="myFunction2()" class="dropbtn2">Reports&#9207</button>
  <div id="myDropdown2" class="dropdown-content2">
    <a href="Editmyaccount.jsp">My Account</a>
    <a >DB Update</a>
    
    
  </div>
</div>

      <a href="UserAboutus.jsp" >About Us</a>
      <a href="UserContactus.jsp">Contact Us</a>
 </li>
  </ul>
  
       
		 		
		<%
		try
		{   String emil = (String) request.getSession().getAttribute("email");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
			
			PreparedStatement ps=con.prepareStatement("select * from user_registration where email=?");
			ps.setString(1, emil);
			ResultSet rs=ps.executeQuery();
			
		while(rs.next())
		{

		%>
		<script>
		function editValidate() 
		{
		    if ((Editmyaccount.firstname.value == "<%=rs.getString("FirstName")%>") && (Editmyaccount.lastname.value == "<%=rs.getString("lastname")%>") && (Editmyaccount.contactnumber.value == "<%=rs.getString("contactnumber")%>") && (Editmyaccount.street.value == "<%=rs.getString("street")%>") && (Editmyaccount.city.value == "<%=rs.getString("city")%>") && (Editmyaccount.state.value == "<%=rs.getString("state")%>") && (Editmyaccount.zipcode.value == "<%=rs.getString("zipcode")%>"))
	    	{
	    		document.getElementById('erredit').innerHTML="Sorry , No Changes Made ";
                return false;
	    	}
		}
		</script>
		<center style="font-size:75%;">
		<form  action="http://localhost:8081/JES/EditmyaccountServlet" name="Editmyaccount" onsubmit="return editValidate()" method="post">
		<p style="color:red;">${changefailure}</p><p style="color:blue;">${changesuccess} </p><br />
			<legend>Edit Profile:</legend><br/>
			
			<label>FirstName:</label>
			<input type="text" name="firstname" id="fname" value="<%=rs.getString("firstName")%>" required />
			<br />
			<label>LastName:</label>
			<input type="text" name="lastname" id="lname" value="<%=rs.getString("lastName")%>" required/>
			<br />
			<label>contact number:</label>
			<input type="text" name="contactnumber" id="contactnumber" value="<%=rs.getString("contactnumber")%>" required/>
			<br />
			<label>street:</label>
			<input type="text" name="street" id="street" value="<%=rs.getString("street")%>"required/>
			<br />
			<label>city:</label>
			<input type="text" name="city" id="city" value="<%=rs.getString("city")%>"required/>
			<br />
			<label>State:</label>
                        <select name="state" style="width: 173px;">
    <option value="<%=rs.getString("state")%>"><%=rs.getString("state")%></option>
                     
	<option value="Alabama">Alabama</option>
	<option value="Alaska">Alaska</option>
	<option value="Arizona">Arizona</option>
	<option value="Arkansas">Arkansas</option>
	<option value="California">California</option>
	<option value="Colorado">Colorado</option>
	<option value="Connecticut">Connecticut</option>
	<option value="Delaware">Delaware</option>
	<option value="District Of Columbia">District Of Columbia</option>
	<option value="Florida">Florida</option>
	<option value="Georgia">Georgia</option>
	<option value="Hawaii">Hawaii</option>
	<option value="Idaho">Idaho</option>
	<option value="Illinois">Illinois</option>
	<option value="Indiana">Indiana</option>
	<option value="Iowa">Iowa</option>
	<option value="Kansas">Kansas</option>
	<option value="Kentucky">Kentucky</option>
	<option value="Louisiana">Louisiana</option>
	<option value="Maine">Maine</option>
	<option value="Maryland">Maryland</option>
	<option value="Massachusetts">Massachusetts</option>
	<option value="Michigan">Michigan</option>
	<option value="Minnesota">Minnesota</option>
	<option value="Mississippi">Mississippi</option>
	<option value="Missouri">Missouri</option>
	<option value="Montana">Montana</option>
	<option value="Nebraska">Nebraska</option>
	<option value="Nevada">Nevada</option>
	<option value="New Hampshire">New Hampshire</option>
	<option value="New Jersey">New Jersey</option>
	<option value="New Mexico">New Mexico</option>
	<option value="New York">New York</option>
	<option value="North Carolina">North Carolina</option>
	<option value="North Dakota">North Dakota</option>
	<option value="Ohio">Ohio</option>
	<option value="Oklahoma">Oklahoma</option>
	<option value="Oregon">Oregon</option>
	<option value="Pennsylvania">Pennsylvania</option>
	<option value="Rhode Island">Rhode Island</option>
	<option value="South Carolina">South Carolina</option>
	<option value="South Dakota">South Dakota</option>
	<option value="Tennessee">Tennessee</option>
	<option value="Texas">Texas</option>
	<option value="Utah">Utah</option>
	<option value="Vermont">Vermont</option>
	<option value="Virginia">Virginia</option>
	<option value="Washington">Washington</option>
	<option value="West Virginia">West Virginia</option>
	<option value="Wisconsin">Wisconsin</option>
	<option value="Wyoming">Wyoming</option>
</select>			
			<br />
			
			<label>zipcode:</label>
			<input type="text" name="zipcode" id="zipcode" value="<%=rs.getString("zipcode")%>" required/>
			<br />
			<div style="color:red;" id="erredit"></div>
			<p style="color:red;">${message}</p>
   
	 <p><input type="submit" value="Change" /></form></center>
	 <center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="goBack()">Back</button>&nbsp;<a href="Logout.jsp"><button> Exit </button></a></center></p>
	

    	
        <%

		}
	%>
    
    
    <%
    ps.close();
	rs.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
	%>
 


	 
    </body>
</html>
