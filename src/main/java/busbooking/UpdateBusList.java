package busbooking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateBusList
 */
@SuppressWarnings("serial")
@WebServlet("/UpdateBusList")
public class UpdateBusList extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		        String busNo=request.getParameter("busNo");
		        String busName=request.getParameter("busName");
				String cityFrom=request.getParameter("cityFrom");
				String cityTo=request.getParameter("cityTo");
				String timeFrom=request.getParameter("timeFrom");
				String timeTo=request.getParameter("timeTo");
				String fare=request.getParameter("fare");
				String type=request.getParameter("type");
		
				
				//Connection connection=ConnectionProvider.getconn();
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
					System.out.println("ok");
				
					PreparedStatement ps=connection.prepareStatement("insert into buslist values(?,?,?,?,?,?,?,?)");
					System.out.println("ok3");
					ps.setString(1,busNo);
					ps.setString(2,busName);
					ps.setString(3,cityFrom);
					ps.setString(4,cityTo);
					ps.setString(5,timeFrom);
					ps.setString(6,timeTo);
					ps.setString(7,fare);
					ps.setString(8,type);
					
					int i=ps.executeUpdate(); 
				
		            if(i>0) {
		            	request.setAttribute("successMessage", "Bus Added successfully.");
		            	RequestDispatcher rd=request.getRequestDispatcher("UpdateBusList.jsp");
						rd.forward(request,response);
						}
					else {
				
					response.sendRedirect("RegForm.jsp");
					}}
				    catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				}

			
		}
