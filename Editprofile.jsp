<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	if(request.getSession().getAttribute("email") == null) {
		response.sendRedirect(request.getContextPath() + "/Login.jsp");
		return;
	}
%>


<html>
    <head>
        <title>Edit Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="main.css" />
    
    </head>
<body>
<p><img src="logo.jpg" alt="Smiley face" height="80" width="120" align="left"/>
<pre><h1 align="center">        
  JAIL EXPOSURE SYSTEM </h1></pre>
</p>
   	
<h2>	
<div>
  <ul>
				<a class="active" href="Userhome.jsp"> Home </a></li>
       			<a class="active" href="Calculatepenalty.jsp">Calculate Penalty</a>
                <a class="active" href="Viewhistory.jsp">View History</a>
                <a class="active" href="Editprofile.jsp">Edit Profile</a>
                <a class="active" href="Changepassword.jsp">Change Password</a>
                <a class="active" href="Logout.jsp">Logout</a>
  </ul>
</div>
</h2>

</body>
</html>