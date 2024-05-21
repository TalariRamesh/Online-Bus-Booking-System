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
 * Servlet implementation class AdminLogin
 */
@SuppressWarnings("serial")
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
        String upass=request.getParameter("upass");
		String uemail=request.getParameter("uemail");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
			
			PreparedStatement ps=con.prepareStatement("select * from adminlogin where email=? and pass=?");
			
			ps.setString(1, uemail);
			ps.setString(2, upass);
			ResultSet rs=ps.executeQuery();
			HttpSession session=request.getSession();
            session.setAttribute("uemail", uemail);
			if(rs.next()) {
				response.sendRedirect("UpdateBusList.jsp");
			}
			else {
				request.setAttribute("errorMessage", "Invalid email or password");
				RequestDispatcher rd=request.getRequestDispatcher("AdminLogin.jsp");
				rd.include(request,response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			

	}

}
