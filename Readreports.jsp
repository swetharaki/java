<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<%@ page import="java.sql.*" %> 
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Read Reports</title>
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
       			<a class="active" href="Calculatepenalty.jsp">Calculate Penalty</a>
                <a class="active" href="Viewhistory.jsp">View History</a>
<ul>
<li style="margin-left:360px";>
<div class="dropdown">
<button onclick="myFunction2()" class="dropbtn2">Reports&#9207</button>
  <div id="myDropdown2" class="dropdown-content2">
    <a href="Updatedb.jsp">Update Db</a>
    <a href="Readreports.jsp">Read</a>
    
  </div>
</div>
<div class="dropdown3">
<button onclick="myFunction3()" class="dropbtn3">My Account&#9207</button>
  <div id="myDropdown3" class="dropdown-content3">
    <a href="Editmyaccount.jsp">Change</a>
    <a href="Viewmyaccount.jsp">Read</a>
    
  </div>
</div>

      <a href="Changepassword.jsp">Change Password</a>
      <a href="Logout.jsp">Logout</a>
       

   </li> 
  </ul>
  
  <br/><br/><br/><br/>
       <!-- <form name="Login" action="http://localhost:8081/JES/LoginServlet" onsubmit="return loginValidation()" method="post"> -->
		 <center style="font-size:60%">
		 	<table border="2" >
		 	<thead>
			<tr>
				<th>Status</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email Id</th>
				<th>Contact Number</th>
				<th>Street</th>
				<th>City</th>
				<th>State</th>
				<th>Zipcode</th>
				
			</tr>
			</thead>
		<%
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
			
			PreparedStatement ps=con.prepareStatement("select * from user_registration");
			//ps.setString(1, emil);
			ResultSet rs=ps.executeQuery();
			
		while(rs.next())
		{

		%>
		<tbody>
    		<tr>
        <td><%=rs.getString("status")%></td>
    	<td><%=rs.getString("FirstName")%></td>
    	<td><%=rs.getString("LastName")%></td>
    	<td><%=rs.getString("email")%></td>
    	<td><%=rs.getString("contactnumber")%></td>
    	<td><%=rs.getString("street")%></td>
    	<td><%=rs.getString("city")%></td>
    	<td><%=rs.getString("state")%></td>
    	<td><%=rs.getString("zipcode")%></td>
    		</tr>
    	</tbody>
        <%

		}
	%>
    </table>
    <%
    ps.close();
	rs.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
	%>
 <button onclick="goBack()">Go Back</button></pre></p>

</center>
    
        
    </body>
</html>
