package busbooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */
@SuppressWarnings("serial")
@WebServlet("/Register")
public class Register extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//@SuppressWarnings("serial")
		
		    String uname=request.getParameter("uname");
			String uemail=request.getParameter("uemail");
			String upass=request.getParameter("upass");
			String uphone=request.getParameter("uphone");
			
			System.out.println(uname+" "+uemail+" "+upass+" "+uphone);
			HttpSession session=request.getSession();
			session.setAttribute("uname", uname);
			session.setAttribute("uemail", uemail);
			session.setAttribute("upass", upass);
			session.setAttribute("uphone", uphone);
			//Connection connection=ConnectionProvider.getconn();
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
				System.out.println("ok");
			
				PreparedStatement ps=connection.prepareStatement("insert into login values(?,?,?,?)");
				System.out.println("ok3");
				ps.setString(1,uname);
				ps.setString(2,uemail);
				ps.setString(3,upass);
				ps.setString(4,uphone);
				System.out.println("ok2");
				int i=ps.executeUpdate(); 
				System.out.println(i);
				System.out.println("ok4");
	           
				if (i > 0) {
				    response.sendRedirect("Login.jsp?message=success");
				} else {
				    response.sendRedirect("RegForm.jsp?message=failure");
				}

			}
			    catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}

		
	}


