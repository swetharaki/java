<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>


<%
	if(request.getSession().getAttribute("adminemail") == null) {
		response.sendRedirect(request.getContextPath() + "/Adminlogin.jsp");
		return;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Update DB2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="c.css" />
   
    <script>   
    function goBack() 
	{
    	window.history.back();
	}
    function logout() 
	{
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
 
  				<a class="active" href="Adminhome.jsp"> Home </a></li>
       			
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
    <a href="AdminEditmyaccount.jsp">My Account</a>
    <a href="Updatedb.jsp">DB Update</a>
    
    
  </div>
</div>

      <a href="AdminAboutus.jsp" >About Us</a>
      <a href="AdminContactus.jsp">Contact Us</a>
 </li>
  </ul>
  
  <%
  String emil=request.getParameter("id");
 	System.out.println(emil); 
  
 	
 	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs=null;
 	
 	try{
 		String emilid=request.getParameter("id");
 		System.out.println(emilid);
 		System.out.println(emil);
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
		
	    
	   ps1=con.prepareStatement("select * from user_registration where email=?");
		
		ps1.setString(1, emilid);
		rs=ps1.executeQuery();
			
		if (rs.next()){
			String bemail = rs.getString("email");
			String bfirstname = rs.getString("firstname");
			String blastname = rs.getString("lastname");
			String bcontactnumber = rs.getString("contactnumber");
			String bstreet = rs.getString("street");
			String bcity = rs.getString("city");
			String bstate = rs.getString("state");
			String bzipcode = rs.getString("zipcode");
			String bstatus="Deleted";
			System.out.println(bfirstname);
		
				
	
	    ps= con.prepareStatement("insert into user_backup (email,firstname,lastname,contactnumber,street,city,state,zipcode,status,datestamp) values(?,?,?,?,?,?,?,?,?,now()) ");
	    

	    	ps.setString(1,bemail);
	    	ps.setString(2,bfirstname);
			ps.setString(3,blastname);
			ps.setString(4,bcontactnumber);
			ps.setString(5,bstreet);
			ps.setString(6,bcity);
			ps.setString(7,bstate);
			ps.setString(8,bzipcode);
			ps.setString(9,bstatus);
			
			int n=ps.executeUpdate();
			System.out.println("inserted");

		}
		


	/*
	String firstname=request.getParameter("firstname"); 
	String lastname=request.getParameter("lastname");
	String contactnumber=request.getParameter("contactnumber");
	String street=request.getParameter("street"); 
	String city=request.getParameter("city"); 
	String state=request.getParameter("state"); 
	String zipcode=request.getParameter("zipcode");
	String status="Changed";*/
	
	
PreparedStatement ps2= con.prepareStatement("delete from user_registration where email=?");
    
			
		ps2.setString(1,emil);
		int n=ps2.executeUpdate();
		System.out.print("deleted");

		
}
catch(Exception e){
		e.printStackTrace();
				
	}
 	
 	
  %>
  
  <br/><br/><br/><br/><br>
  <center style="font-size:40%">
  <!--  <form name="Login" action="http://localhost:8081/JES/UpdateDBServlet" onsubmit="return loginValidation()" method="post">  -->
		 	<table border="2" >
		 	<thead>
			<tr>
				<th>Date Stamp</th>
				<th>Status</th>
				<th>Type</th>
				<th>Email Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Contact Number</th>
				<th>Street</th>
				<th>City</th>
				<th>State</th>
				<th>Zip code</th>
				<th>Password</th>
				<th>Security Question</th>
				<th>Security Answer</th>
				<th>Action</th>
				
			</tr>
			</thead>
		<%
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
			
			PreparedStatement ps3=con.prepareStatement("select * from user_registration");
			//ps.setString(1, emil);
			ResultSet rs1=ps3.executeQuery();
			
		while(rs1.next())
		{

		%>
		<tbody>
    		<tr>
    	<td><%=rs1.getString("datestamp")%></td>
        <td><%=rs1.getString("status")%></td>
        <td><%=rs1.getString("type")%></td>
        <td><%=rs1.getString("email")%></td>
    	<td><%=rs1.getString("FirstName")%></td>
    	<td><%=rs1.getString("LastName")%></td>
    	<td><%=rs1.getString("contactnumber")%></td>
    	<td><%=rs1.getString("street")%></td>
    	<td><%=rs1.getString("city")%></td>
    	<td><%=rs1.getString("state")%></td>
    	<td><%=rs1.getString("zipcode")%></td>
    	<td><%=rs1.getString("password")%></td>
    	<td><%=rs1.getString("security1")%></td>
    	<td><%=rs1.getString("answer1")%></td>
    	<td><a href="Updatedb.jsp?id=<%=rs1.getString("email")%>">Delete</a>
    	<a href="Updateuser.jsp?id=<%=rs1.getString("email")%>">Change</a></td>
        
    		</tr>
    	</tbody>
    	
        <%

		}
	%>
	</table>
	<br>
	<center style="font-size:200%">

		 	<table border="2" >
		 	<thead>
			<tr style="font-weight:bold" style="font-size:75%">
				<th>Date Stamp</th>
				<th>Class Id</th>
				<th>Class Name</th>
				<th>Minimum Jail</th>
				<th>Maximum Jail</th>
				<th>Minimum Fine</th>
				<th>Maximum Fine</th>
				<th>Action</th>	
			</tr>
			</thead>
	<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
			
			PreparedStatement ps4=con2.prepareStatement("select * from classes");
			//ps.setString(1, emil);
			ResultSet rs2=ps4.executeQuery();
			
		while(rs2.next())
		{

		%>
		
    		<tr>
    	<td><%=rs2.getString("datestamp")%></td>
        <td><%=rs2.getString("classid")%></td>
    	<td><%=rs2.getString("classname")%></td>
    	<td><%=rs2.getString("minjail")%></td>
    	<td><%=rs2.getString("maxjail")%></td>
    	<td><%=rs2.getString("minfine")%></td>
    	<td><%=rs2.getString("maxfine")%></td>
    	<td><a href="Updatedb.jsp?id=<%=rs2.getString("classid")%>">Delete</a>
    	<a href="Updateuser.jsp?id=<%=rs2.getString("classid")%>">Change</a></td>
        
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
 <button onclick="goBack()">Go Back</button><a href="Logout.jsp"><button>Exit</button></a>

</center>
    
        
    </body>
</html>
