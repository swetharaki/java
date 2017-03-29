<%-- 
    Document   : reg
    Created on : Feb 6, 2017, 9:04:24 PM
    Author     : ysanj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String firstname=request.getParameter("firstname"); 
String lastname=request.getParameter("lastname"); 
String emailid=request.getParameter("email");
session.putValue("email",emailid);
String gender=request.getParameter("gender");
String phonenumber=request.getParameter("phonenumber");
String street=request.getParameter("street"); 
String city=request.getParameter("city"); 
String state=request.getParameter("state"); 
String zipcode=request.getParameter("zipcode"); 
String password=request.getParameter("password"); 
String Reenterpassword=request.getParameter("Reenterpassword"); 
String security1=request.getParameter("security1"); 
String Answer1=request.getParameter("Answer1"); 
String security2=request.getParameter("security2"); 
String Answer2=request.getParameter("Answer2"); 
 


Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234"); 
Statement st= con.createStatement(); 
ResultSet rs = st.executeQuery("select * from history");

while (rs.next()){
	System.out.println(rs.getString("name"));
	
}

/* ResultSet rs = st.executeQuery("insert into user_reg values ('"+firstname+"','"+lastname+"','"+emailid+"','"+gender+"','"+phonenumber+"','"+street+"','"+city+"','"+street+"','"+zipcode+"','"+password+"','"+Reenterpassword+"','"+security1+"','"+Answer1+"','"+security2+"','"+Answer2+"')"); 
 */
out.println("hi"); 
%>
<a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>
</body>
</html>
