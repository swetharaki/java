package logic;

import java.io.IOException;
import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import logic.Helloworld.RemindTask;

import javax.servlet.ServletContext;


@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String host;
    private String port;
    private String user;
    private String pass;
	
	Connection con = null;

	PreparedStatement uid_ps = null;
	ResultSet uid_rs = null;

	String a;
	String temppswd;
    Timer timer;
    int seconds=60;
	
	
    /*
    public SendMailServlet(int seconds) {
        super();
        // TODO Auto-generated constructor stub
        timer = new Timer();
        
        a="spandana0123456789bharath0123456789shiva0123456789sanjay";
        Random rnd = new Random();
        StringBuilder ab = new StringBuilder(4);
        for(int i =0;i<8;i++){
        	ab.append(a.charAt(rnd.nextInt(a.length())));
        }
        temppswd = ab.toString();
        System.out.println("temp password " + temppswd);
        timer.schedule(new RemindTask(), seconds*1000);
        
    }
    class RemindTask extends TimerTask {
        public void run() {
             
        System.out.println("Time's up!");
        temppswd ="";
        System.out.println("temp password " + temppswd);
        
        timer.cancel(); //Terminate the timer thread
        }
    }

	*/
    public void init() {
    	
        // reads SMTP server setting from web.xml file
        //ServletContext context = getServletContext();
        //host = context.getInitParameter("host");
       // port = context.getInitParameter("port");
       // user = context.getInitParameter("user");
       // pass = context.getInitParameter("pass");
        
        
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
			
		
		String email=request.getParameter("email");
		String subject="Temporary Password";
		String content=request.getParameter("content");
		
		final String user = "jailexposuresystem@gmail.com"; // requires
		// valid
		// gmail id
		final String pass = "sanjay1234"; // correct password for gmail id
		final String toEmail = email; // can be any
		String pswd=null;													// email id
		String msgpswd=null;
		
		System.out.println("from : "+user);
		
		
		
		a="spandana4175992308bharath4016991868shiva2032757197sanjay2038933478";
        Random rnd = new Random();
        StringBuilder ab = new StringBuilder(4);
        for(int i =0;i<8;i++){
        	ab.append(a.charAt(rnd.nextInt(a.length())));
        }
        temppswd = ab.toString();
        System.out.println("temp password " + temppswd);
        
        msgpswd = "Your temporary password is :" + temppswd + "\nNote: This password will expire in 10 minutes ";
        
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
			
			 PreparedStatement ps= con.prepareStatement("Update user_registration set datestamp=now(),temppassword=? where email=?");
			    
					ps.setString(1,temppswd);
					ps.setString(2,email);

					int n=ps.executeUpdate();
				
			
				if(n!=0)
				{
						System.out.println(n +"Inserted");
				}
				else
				{	
					request.setAttribute("mailfailure", "E-mail Failure , please Try Again");
					RequestDispatcher rd=request.getRequestDispatcher("/Forgotpassword.jsp");
					rd.forward(request, response);	
					
				}
					
			
		} catch (Exception ex) {
			System.out.println("Mail fail");
			System.out.println(ex);
			
			request.setAttribute("mailfailure", "E-mail Failure , please Try Again");
			RequestDispatcher rd=request.getRequestDispatcher("/Forgotpassword.jsp");
			rd.forward(request, response);
		}
		
		 
	       // String subject = request.getParameter("subject");
	       // String content = request.getParameter("content");
	 
	        String resultMessage = "";
	 
	        try {
	            EmailUtility.sendEmail(host, port, user, pass, email, subject,msgpswd);
	            resultMessage = "The e-mail was sent successfully";
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            resultMessage = "There was an error: " + ex.getMessage();
	        } finally {
	            request.setAttribute("emailsent", "An email was sent to your E-Mail, please enter the temporary password and reset password");
	            System.out.print("email sent");
	            request.setAttribute("email", email);
	            getServletContext().getRequestDispatcher("/Resetpassword.jsp").forward(
	                    request, response);
	        }
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
