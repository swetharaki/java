package logic;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import  java.sql.*;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/CalculateServlet")
public class CalculateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	private static final String FClassA = null;
	
	
	PreparedStatement ps=null;
	PreparedStatement ps1=null;
	PreparedStatement ps2=null;
	Connection con;
	String userid;
	String username;

	ResultSet rs=null;
	ResultSet rs1=null;
	
	
	 int Totalminjail =  0;
	 int Totalmaxjail =  0;
	 int Totalminfine =  0;
	 int Totalmaxfine =  0;
	 
	 int mnjail = 0;
	 int mxjail = 0;
	 int mnfine = 0;  
	 int mxfine = 0;

	/*list[i]={mclassa,mclassb,mclassc,mclassd,fclassa,fclassb,fclassc,fclassd,fclasse};
    for(n=0;n<=i;n++)
    {
    	if(list[n]="")
    	{
    		list[n]=0;
    	}
     
    }
	*/
       
    
    public CalculateServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try{
		
		int fclsa=Integer.parseInt(request.getParameter("FClassA"));
		System.out.println("xxx " +fclsa);
		int fclsb=Integer.parseInt(request.getParameter("FClassB"));
		int fclsc=Integer.parseInt(request.getParameter("FClassC"));
		int fclsd=Integer.parseInt(request.getParameter("FClassD"));
		int fclse=Integer.parseInt(request.getParameter("FClassE"));
		int mclsa=Integer.parseInt(request.getParameter("MClassA"));
		int mclsb=Integer.parseInt(request.getParameter("MClassB"));
		int mclsc=Integer.parseInt(request.getParameter("MClassC"));
		int mclsd=Integer.parseInt(request.getParameter("MClassD"));
		
		
		
		Map m1 = new HashMap();
		
	    m1.put("FClassA", fclsa);
	    m1.put("FClassB", fclsb);
	    m1.put("FClassC", fclsc);
	    m1.put("FClassD", fclsd);
	    m1.put("FClassE", fclse);
	    m1.put("MClassA", mclsa);
	    m1.put("MClassB", mclsb);
	    m1.put("MClassC", mclsc);
	    m1.put("MClassD", mclsd);
	    
	    Set keys = m1.keySet();
	    
	    Iterator it = keys.iterator();
	    
	    String key;
	    int value;
	    while(it.hasNext())
	    {
	    	key = (String)it.next();
	    	value = (Integer)m1.get(key);
	    	
	    	if(value >= 1)
	    	{
	    		System.out.println(key + value);
	    		
		
		 userid = (String) request.getSession().getAttribute("email");
		 username = (String) request.getSession().getAttribute("name");
		
		PrintWriter out=response.getWriter();

		//try{
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
		
		//String emil=request.getParameter("email");
		//String pswd=request.getParameter("password");
		//PrintWriter out=response.getWriter();
		
			ps=con.prepareStatement("select * from classes where classname=?");
			
			ps.setString(1, key);
			rs=ps.executeQuery();
			
			boolean flag=false;
		
			while(rs.next())
			{
				 mnjail = 0;
				 mxjail = 0;
				 mnfine = 0;  
				 mxfine = 0;
				 
				 int minjailFA = rs.getInt("minjail");
				 int maxjailFA = rs.getInt("maxjail");
				 int minfineFA = rs.getInt("minfine");
				 int maxfineFA = rs.getInt("maxfine");
				 
				 System.out.println("mxjl " +mxjail);
				 System.out.println("minj " +value);
				 
				 mnjail =  value * minjailFA;
				 mxjail =  value * maxjailFA;
				 mnfine =  value * minfineFA;
				 mxfine =  value * maxfineFA;
				 
				 flag=true;
				 System.out.println("maxjail "+ mxjail);
				 
				 Totalminjail =  Totalminjail + mnjail;
				 Totalmaxjail =  Totalmaxjail + mxjail;
				 Totalminfine =  Totalminfine + mnfine;
				 Totalmaxfine =  Totalmaxfine + mxfine;
				 
				 System.out.println("Totalmaxjail " +Totalmaxjail);
				 
		    }
			if(flag==false)
			{
				request.setAttribute("msg1", "Failed , try again!!");
				RequestDispatcher rd=request.getRequestDispatcher("/Calculatepenalty.jsp");
				rd.forward(request, response);
			} 
	
	    	}
	    	 
	    }
			
	    				Class.forName("com.mysql.jdbc.Driver");
	    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jes","root","1234");
					    
						String str="insert into history (userid,username,minimumfine,maximumfine,minimumjail,maximumjail,datestamp) values(?,?,?,?,?,?,now()) ";
						
							
							ps1=con.prepareStatement(str);
							ps1.setString(1,userid);
							ps1.setString(2,username);
							ps1.setInt(3,Totalminfine);
							ps1.setInt(4,Totalmaxfine);
							ps1.setInt(5,Totalminjail);
							ps1.setInt(6,Totalmaxjail);
							
							
							int n=ps1.executeUpdate();
							if(n!=0)
							{
							String str1 = "SELECT LAST_INSERT_ID() FROM history";
							ps2=con.prepareStatement(str1);
							rs1=ps2.executeQuery();
							while(rs1.next())
							 {
								//flag=true;
								int searchid = rs1.getInt(1);;
								System.out.println(searchid);
								request.setAttribute("sid", searchid);
								
								request.setAttribute("mnjl", Totalminjail);
								request.setAttribute("mxjl", Totalmaxjail);
								request.setAttribute("mnfn", Totalminfine);
								request.setAttribute("mxfn", Totalmaxfine); 
								
								  Totalminjail =  0;
								  Totalmaxjail =  0;
								  Totalminfine =  0;
								  Totalmaxfine =  0; 
								  
								RequestDispatcher rd1=request.getRequestDispatcher("/Penaltyresult.jsp");
								rd1.forward(request, response);
								
								 
						    }
						   }
						else
						{   request.setAttribute("msg1", "Failed , try again!!");
							RequestDispatcher rd=request.getRequestDispatcher("/Calculatepenalty.jsp");
							rd.forward(request, response);	
							
						}
				
				
			/*}
			if(flag==false)
			{
				request.setAttribute("msg1", "Failed , try again!!");
				RequestDispatcher rd=request.getRequestDispatcher("/Calculatepenalty.jsp");
				rd.forward(request, response);
			}*/
		} 
		catch (SQLException | ClassNotFoundException e) 
	    {
			
			e.printStackTrace();
			request.setAttribute("msg1", "Failed , try again!!");
			RequestDispatcher rd=request.getRequestDispatcher("/Calculatepenalty.jsp");
			rd.forward(request, response);
		}
		
		finally
		{
			try
			{
				ps.close();
				rs.close();
			}
			catch(Exception  e)
			{
				
			}
		}

}
}


		
		
		
	



