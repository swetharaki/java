package logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.Time;


@WebServlet("/ResetServlet")
public class ResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	Connection con=null;
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	ResultSet rs=null;
       
    public ResetServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
		
		String emil=request.getParameter("email");
		System.out.println(emil);
		String temppassword=request.getParameter("temppassword"); 
		System.out.println(temppassword);
		String password=request.getParameter("password"); 
		String reenterpassword=request.getParameter("reenterpassword"); 
		
		
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
			
	
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar calobj = Calendar.getInstance();
			System.out.println(df.format(calobj.getTime()));
			System.out.println(rs.getString("datestamp"));
			System.out.println(rs.getString("temppassword"));
			
			/*DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

			LocalDateTime dateTime1= LocalDateTime.parse(df.format(calobj.getTime()), formatter);
			LocalDateTime dateTime2= LocalDateTime.parse(rs.getString("datestamp"), formatter);*/
			
			String time1 = df.format(calobj.getTime());
			String time2 = rs.getString("datestamp");
			String dbtemppassword = rs.getString("temppassword");
			
			System.out.println(dbtemppassword);
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date1 = (Date) format.parse(time1);
			Date date2 = (Date) format.parse(time2);
			long diffInMinutes = (date1.getTime() - date2.getTime())/ (60 * 1000) % 60; 
			
			//long diffInMinutes = java.time.Duration.between(dateTime1, dateTime2).toMinutes();
			System.out.println(diffInMinutes);
			
			if(diffInMinutes >=10)
			{
				System.out.println("expired");
				request.setAttribute("pswdexp", "Temporary password expired , try again");
				RequestDispatcher rd=request.getRequestDispatcher("/Forgotpassword.jsp");
				rd.forward(request, response);
				
			}
			else if(temppassword.equals(dbtemppassword))
			{
				String temppswd=null;
				System.out.println("temppswd matched");
				PreparedStatement ps= con.prepareStatement("Update user_registration set password=?,reenterpassword=?,datestamp=now(),temppassword=? where email=?");
			    
			    
				
				ps.setString(1,password);
				ps.setString(2,reenterpassword);
				ps.setString(3,temppswd);
				ps.setString(4,emil);
				
				int n=ps.executeUpdate();
			
		
			if(n!=0)
			{
					System.out.println(n +"updated");
					request.setAttribute("pswdchngsucs", " Password Successfully Changed");
					RequestDispatcher rd=request.getRequestDispatcher("/Login.jsp");
					rd.forward(request, response);
				  
			}
			else
			{	
				request.setAttribute("pswdchngfailure", " Failed , please Try Again");
				RequestDispatcher rd=request.getRequestDispatcher("/Forgotpassword.jsp");
				rd.forward(request, response);	
				
			}
			}
		}
}
	catch(Exception e){
			e.printStackTrace();
			request.setAttribute("pswdchngfailure", " Failed , please Try Again");
			RequestDispatcher rd=request.getRequestDispatcher("/Forgotpassword.jsp");
			rd.forward(request, response);	
				
			
		}
	}

}
