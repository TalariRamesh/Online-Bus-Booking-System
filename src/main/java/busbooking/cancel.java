package busbooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class cancel
 */
@WebServlet("/cancel")
public class cancel extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String id=request.getParameter("id");
		  
		  
		  try{
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 System.out.println("ok");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
				 System.out.println("ok1");
				 PreparedStatement ps=con.prepareStatement("delete from ticket where ticket_id=?");
				 System.out.println("ok2");
				 ps.setString(1,id);
				 System.out.println(id);
				 int i = ps.executeUpdate();
				 
				 System.out.println("ok4");
				 if(i>0)
					
						response.sendRedirect("ViewTicket.jsp");
		  }
    catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
				
	}

}
