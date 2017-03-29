package logic;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import  java.sql.*;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	PreparedStatement ps=null;
	ResultSet rs=null;
	
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		String emil=request.getParameter("email");
		String pswd=request.getParameter("password");
		PrintWriter out=response.getWriter();
		String uniqpswd=request.getParameter("uniquepassword");

		/*if(uniqpswd!="" || uniqpswd != null)
		{
			request.setAttribute("message", "Login Failed");
			RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
			rd.forward(request, response);
		}*/

		try{
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
		
		//String emil=request.getParameter("email");
		//String pswd=request.getParameter("password");
		//PrintWriter out=response.getWriter();
		
			ps=con.prepareStatement("select * from user_registration where email=?");
			
			ps.setString(1, emil);
			rs=ps.executeQuery();
			
			boolean flag=false;
		
			while(rs.next())
			{
				String fname = rs.getString("FirstName"); 
			    String lname = rs.getString("LastName");
				String fstname = fname.substring(0, 1).toUpperCase() + fname.substring(1);
				String lstname = lname.substring(0, 1).toUpperCase() + lname.substring(1);
				String name = fstname + " " + lstname;
				
			 if (rs.getString("password").equals(pswd) && rs.getString("uniquepassword")==null)
				{
					flag=true;
					out.println("LoginSuccess");
					request.getSession().setAttribute("name", name);
					request.getSession().setAttribute("email", emil);
					RequestDispatcher rd=request.getRequestDispatcher("/Userhome.jsp");
					rd.forward(request, response);
					break;
				}
				
				
			}
			if(flag==false)
			{
				request.setAttribute("message", "Login Failed");
				RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
				rd.forward(request, response);
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		
		finally
		{
			try
			{
				ps.close();
				rs.close();
			}
			catch(Exception  e){
				
			}
		}
		
		
		
	}

}

