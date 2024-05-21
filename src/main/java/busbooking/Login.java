package busbooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@SuppressWarnings("serial")
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		System.out.println("ok");
	            String upass=request.getParameter("upass");
				String uemail=request.getParameter("uemail");
				
			    System.out.println(upass+" - "+uemail);
			    
				System.out.println("ok 1");
				try {
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					System.out.println("ok 2");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
					System.out.println("ok 3");
					PreparedStatement ps=con.prepareStatement("select * from login where uemail=? and upass=? ");
					System.out.println("ok 4");
					ps.setString(1, uemail);
					ps.setString(2, upass);
					ResultSet rs=ps.executeQuery();
					
					System.out.println("ok 5"+ps);
					
				
					if(rs.next()) {
						HttpSession session=request.getSession();
			            session.setAttribute("uemail", uemail);
						session.setAttribute("upass", upass);
						
						System.out.println("ok 6 in");
						response.sendRedirect("StationList.jsp");
						System.out.println("ok 7 out");
					}	
					else {
						 request.setAttribute("errorMessage", "Invalid email or password");
				            
						RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
					
						rd.include(request,response);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
	}

}
