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
        <title>View</title>
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
<li style="margin-left:380px";>
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

      <li style="float:right;" ><a href="Changepassword.jsp">Change Password</a>
      <a href="Logout.jsp">Logout</a>
       

    </li>
  </ul>
  
  <br/><br/><br/><br/>
       <center style="font-size:75%;">
		 		
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
		<table border="2">
		 	
			<tbody>
				<tr>
					<th>FirstName:</th>
					<td ><%=rs.getString("FirstName")%></td>
				</tr>
				<tr>
					<th>LastName:</th>
					<td ><%=rs.getString("LastName")%></td>
				</tr>
				<tr>
					<th>contactnumber:</th>
					<td ><%=rs.getString("contactnumber")%></td>
				</tr>
				<tr>
					<th>street:</th>
					<td ><%=rs.getString("street")%></td>
				</tr>
				<tr>
					<th>city:</th>
					<td><%=rs.getString("city")%></td>
				</tr>
				
				<tr>
					<th>state:</th>
					<td><%=rs.getString("state")%></td>
				</tr>
				<tr>
					<th>zipcode:</th>
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
