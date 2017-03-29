<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>  
<%@ page import="java.io.PrintWriter"%>

<%
	if(request.getSession().getAttribute("email") == null) {
		response.sendRedirect(request.getContextPath() + "/Login.jsp");
		return;
	
	}
%> 


<html>
    <head>
        <title>View History</title>
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


		<br/><br/><br/><br/> 		
		<center style="font-size:75%;">
		 	<table border="2" >
		 	<thead>
			<tr>
				<th>S No:</th>
				<th>History Id</th>
				<th>UserId</th>
				<th>Name</th>
				<th>Minimum Fine</th>
				<th>Maximum Fine</th>
				<th>Minimum Jail</th>
				<th>Maximum Jail</th>
				
			</tr>
			</thead>
		<%
		try
		{   String emil = (String) request.getSession().getAttribute("email");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
			
			PreparedStatement ps=con.prepareStatement("select * from history where userid=?");
			ps.setString(1, emil);
			ResultSet rs=ps.executeQuery();
			int i=1;
		while(rs.next())
		{
		
		%>
		<tbody>
    		<tr>
        <td><%=i%></td>
    	<td><%=rs.getString("historyid")%></td>
    	<td><%=rs.getString("userid")%></td>
    	<td><%=rs.getString("username")%></td>
    	<td>$ <%=rs.getString("minimumfine")%></td>
    	<td>$ <%=rs.getString("maximumfine")%></td>
    	<td><%=rs.getString("minimumjail")%> months</td>
    	<td><%=rs.getString("maximumjail")%> months</td>
    		</tr>
    	</tbody>
    	<%
    	i++;

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
	<br/><br/>
    <button onclick="goBack()">Go Back</button><a href="Logout.jsp"><button>Exit</button></a>

</center>
    
        
    </body>
</html>
