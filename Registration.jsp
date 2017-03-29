<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <title>Registration</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="c.css" />
    
        
        
        <script>
        function passwordValidation()
        { 
            var pswd = document.forms["Registration"]["password"].value;
            var rpswd = document.forms["Registration"]["reenterpassword"].value;
           
           if (Registration.password.value.length<=5){
            	document.getElementById('errpswdlen').innerHTML=" Min. password length is 6 ";
                return false;     	
            }
            else if (pswd===null || pswd==="" || pswd!==rpswd) 
            {
            	document.getElementById('errpswd').innerHTML=" Both passwords should match";
            return false;
            }
            else if (Registration.answer1.value.length<=1){
            	document.getElementById('erranswer').innerHTML=" Min. answer length is 2 ";
                return false;     	
            }

            
        }
      
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
 
  <a href="Home.jsp">Home</a>
<ul>
<div class="dropdown">
<button onclick="myFunction()" class="dropbtn">Login&#9207</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="Adminlogin.jsp">Admin</a>
    <a href="Login.jsp">Any walkin</a>
    
  </div>
</div>
<div class="dropdown1">
<button onclick="myFunction1()" class="dropbtn1">Registration&#9207</button>
  <div id="myDropdown1" class="dropdown-content1">
    <a href="Adminregistration.jsp">Admin</a>
    <a href="Registration.jsp">Any walkin</a>
    
  </div>
</div>
<li style="margin-left:600px";>
<div class="dropdown">
<button onclick="myFunction2()" class="dropbtn2">Reports&#9207</button>
  <div id="myDropdown2" class="dropdown-content2">
    <a href="Myacclogin.jsp">My Account</a>
    <a href="Adminlogin.jsp">Update DB</a>
    
    
  </div>
</div>

      <a href="Aboutus.jsp" >About Us</a>
      <a href="Contactus.jsp">Contact Us</a>
 </li>
  </ul>
      <br/>
        <form action="http://localhost:8081/JES/RegistrationServlet" name="Registration" onsubmit="return passwordValidation()" method="post">
		<center style="font-size:60%;"><p style="color:red;">${regfailure}</p><p style="color:red;">${existsmessage}</p>
                    <legend>Registration</legend></br>
                    <legend>
			<label>First Name:</label>
			<input type="text" name="firstname" id="FName" placeholder="Enter First name" pattern="[a-zA-Z]{2,}" title="Minimum 2 letters"  required/>
			<br />
			<div style="color:red;" id="errfname"></div>
                        <label>Last Name:</label>
			<input type="text" name="lastname" id="LName" placeholder="Enter Last name" pattern="[a-zA-Z]{2,}" title="Minimum 2 letters" required/>
			<br />
			<div style="color:red;" id="errlname"></div>
                        
                      <!--   <label>Date Of Birth</label>
                       <input type="date" name="dateofbirth" required/>
                        <br/>
                        <label>Gender:</label>
                          <input type="radio" name="gender" value="male"> Male
                          <input type="radio" name="gender" value="female"> Female
                          <input type="radio" name="gender" value="other"> Other<br>
                        -->
                        <label>Contact Number:</label>
                       
                        <input id="contactnumber" type="tel" name="contactnumber" pattern="^\d{3}\d{3}\d{4}$" title="This should be 10 digits" placeholder="Enter Contact Number" required >
			<br />
                        <label>Street:</label>
                        <input type="text" name="street" placeholder="Enter Street Name" required />
			<br />
                        <label>City:</label>
                        <input type="text" name="city" placeholder="Enter City" required />
			<br />
                        <label>State:</label>
                        <select name="state" style="width: 173px;">
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
                        <label>ZIP Code:</label>
                        <input type="text" pattern="(\d{5}([\-]\d{4})?)" title="Five digit zip code" name="zipcode" style="width: 167px;" placeholder="Enter Zip code " required/>
                        <br/>
                        <label>Type :</label>
                        <input type="text" name="type" value="Any Walkin"  readonly required />
                        <br/>
                        
                        <label>User Id:</label>
						<input type="email" name="email" id="email" placeholder="User Id is your Email Id" placeholder="Enter Email Id" required/>
			<br />
                         
                        <label>Password:</label>
                        <input type="password" name="password" id="password" placeholder="Enter password" required />
                        <br />
                        <div style="color:red;" id="errpswdlen"></div>
                        <label>Confirm Password:</label>
                        <input type="password" name="reenterpassword" placeholder="Enter confirm password" required />
                        <br>
                        <div style="color:red;" id="errpswd"></div>
			
                        <label>Security Question :</label>
                        <select name="security1"style="width: 174px;">
	                <option value="What was your childhood nickname">1:What was your childhood nickname</option>
	                <option value="What is the name of your childhood best friend">2:What is the name of your childhood best friend</option>
	                <option value="In what city were you born">3:In what city were you born</option>
                        </select>
                        <br/>
                        <label>Security Answer:</label>
                        <input type="password" name="answer1" id="sqanswer" placeholder="Enter Security Answer" required />
			<br />
						<div style="color:red;" id="erranswer"></div>
					<!-- 	<label>Security Question 2:</label>
                        <select name="security2"style="width: 174px;">
	                <option value="What was your favorite sport in high school">What was your favorite sport in high school</option>
	               <option value="Who is your favorite actor, musician, or artist">Who is your favorite actor, musician, or artist</option>
	                <option value="What is the name of your favorite pet">What is the name of your favorite pet</option> 
                        </select>
                         
			<br />
                        <label>Answer:</label>
                        <input type="password" name="answer2" required /> -->
			<br /><br />
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;              
			<input type="submit" value="submit" />&nbsp; &nbsp;&nbsp; &nbsp; 
			<button onclick="goBack()">Go Back</button>
  			<br><br>
  			
				
                       </legend>
		</center>
	</form>
        
        
        
        
    </body>
</html>
