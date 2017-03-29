package logic;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import  java.sql.*;
import java.io.PrintWriter;


@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
	    Connection con=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		ResultSet rs=null;
		
		String uniqpswd=null;


		public void init(ServletConfig config) throws ServletException 
	{
			
			}
	
		
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String firstname=request.getParameter("firstname"); 
		String lastname=request.getParameter("lastname"); 
		String emil=request.getParameter("email");
		//String dateofbirth=request.getParameter("dateofbirth");
		//String gender=request.getParameter("gender");
		String contactnumber=request.getParameter("contactnumber");
		String street=request.getParameter("street"); 
		String city=request.getParameter("city"); 
		String state=request.getParameter("state"); 
		String zipcode=request.getParameter("zipcode"); 
		String password=request.getParameter("password"); 
		String reenterpassword=request.getParameter("reenterpassword"); 
		String security1=request.getParameter("security1"); 
		String answer1=request.getParameter("answer1"); 
		String status="New";
		String type=request.getParameter("type"); 
		
		//String security2=request.getParameter("security2"); 
		//String answer2=request.getParameter("answer2"); 
		
		
		PrintWriter out=response.getWriter();

try{
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
		
	    
	   ps1=con.prepareStatement("select * from user_registration where email=?");
		
		ps1.setString(1, emil);
		rs=ps1.executeQuery();
			
		if (rs.next()){
				request.setAttribute("existsmessage", "Email ID Already Exists");
				RequestDispatcher rd=request.getRequestDispatcher("/Registration.jsp");
				rd.forward(request, response);
		}
			else{
			
			
		
	    
	    
	    PreparedStatement ps= con.prepareStatement("insert into user_registration (FirstName,LastName,email,contactnumber,street,city,state,zipcode,password,reenterpassword,security1,answer1,status,type,datestamp) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now()) ");
	    
	    
		//String str="insert into user_reg values(?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		
			//ps=con.prepareStatement(str);
			ps.setString(1,firstname);
			ps.setString(2,lastname);
			ps.setString(3,emil);
		    //ps.setString(4,dateofbirth);
			//ps.setString(5,gender);
			ps.setString(4,contactnumber);
			ps.setString(5,street);
			ps.setString(6,city);
			ps.setString(7,state);
			ps.setString(8,zipcode);
			ps.setString(9,password);
			ps.setString(10,reenterpassword);
			ps.setString(11,security1);
			ps.setString(12,answer1);
			ps.setString(13,status);
			ps.setString(14,type);
			
			//ps.setString(13,security2);
			//ps.setString(14,answer2);
			
			int n=ps.executeUpdate();
		
	
		if(n!=0)
		{
			if(type == "Admin")
			{
			System.out.println(n +"Inserted");
			request.setAttribute("regsuccess", "Registration Successful , please Login");
			RequestDispatcher rd=request.getRequestDispatcher("/Adminlogin.jsp");
			rd.forward(request, response);
			}
			else{
				System.out.println(n +"Inserted");
				request.setAttribute("regsuccess", "Registration Successful , please Login");
				RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
				rd.forward(request, response);
			}
		}
		else
		{	
			request.setAttribute("regfailure", "Registration Failure , please Try Again");
			RequestDispatcher rd=request.getRequestDispatcher("/Registration.jsp");
			rd.forward(request, response);	
			
		}
			}
}
	catch(Exception e){
			e.printStackTrace();
			request.setAttribute("regfailure", "Registration Failure , please Try Again");
			RequestDispatcher rd=request.getRequestDispatcher("/Registration.jsp");
			rd.forward(request, response);	
				
			
		}
		
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
