<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if(request.getSession().getAttribute("adminemail") == null) {
		response.sendRedirect(request.getContextPath() + "/Adminlogin.jsp");
		return;
	}
%>


<!DOCTYPE html>

<html>
    <head>
        <title>Contact Us</title>
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
  
  <br><br><br><br>
  
  		<center style="font-size:75%;">
		<table>
			<caption>Contact Us</caption>
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Sanjay Kumar Yerrolla</td>
					<td>yerrollas@mail.sacredheart.edu</td>
					<td> (203)893-3478</td>
				</tr>
				<tr>
					<td>Shiva Gurram</td>
					<td>gurrams5@mail.sacredheart.edu</td>
					<td>  (203)275-7197</td>
				</tr>
				<tr>
					<td>Bharath Kumar Kasina</td>
					<td>kasinab@mail.sacredheart.edu</td>
					<td> (401)699-1868</td>
				</tr>
                                <tr>
					<td>Spandana Yeddanapudi</td>
					<td>yeddanapudis@mail.sacredheart.edu</td>
					<td> (417)599-2308</td>
				</tr>
			</tbody>
		</table>
	
        </br> </br>
        
        <button onclick="goBack()">Go Back</button><a href="Logout.jsp"><button>Exit</button></a>
        </center>
      
        
    </body>
</html>
