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
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.*;
/**
 * Servlet implementation class Booking
 */
@WebServlet("/Booking")
public class Booking extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String busNo=request.getParameter("busNo");
		  String number=request.getParameter("y");
		  String total=request.getParameter("x");
		  String fare=request.getParameter("fare");
		  String firstname=request.getParameter("firstname");
		  String email=request.getParameter("email");
		  String phone=request.getParameter("phone");
		  System.out.println("ok");
		  
		  Random rand = new Random();
		  int n = rand.nextInt(9000) + 1000;
		  System.out.println(n);
		  
		  try{
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
				 PreparedStatement ps=con.prepareStatement("select * from buslist where busNo=?");
				 ps.setString(1,busNo);
				 System.out.println("ok6");
				 ResultSet res=ps.executeQuery();
				 while(res.next()){
					 System.out.println("ok7");
					 String busName=res.getString(2);
					 System.out.println(busName);
					 String cityFrom=request.getParameter("cityFrom");
					 String cityTo=request.getParameter("cityTo");
					 String timeFrom=request.getParameter("timeFrom");
					 System.out.println("ok8");
					 HttpSession session=request.getSession();
					 String dateofjourney=(String)session.getAttribute("dateofjourney");    //Getting Session Attribute
					 System.out.println("ok9");
					 HttpSession session2=request.getSession();
					 System.out.println("ok1");
					 String uemail=(String)session2.getAttribute("uemail");
					 String upass=(String)session2.getAttribute("upass");
					 int num1 = Integer.parseInt(request.getParameter("y"));
					 int num2 = Integer.parseInt(request.getParameter("fare"));
					 System.out.println("ok2");
					 int add=num1*num2;
				
				 
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","root");
					System.out.println("ok");
				
					PreparedStatement pss=connection.prepareStatement("insert into ticket (busNo, busName, cityFrom, cityTo, firstname, email, phone, timeFrom, dateofjourney, number, add_amount, n_value) values(?,?,?,?,?,?,?,?,?,?,?,?)");
					System.out.println("ok3");
					pss.setString(1,busNo);
					pss.setString(2,busName);
					pss.setString(3,cityFrom);
					pss.setString(4,cityTo);
					pss.setString(5,firstname);
					System.out.println("ojk66");

					pss.setString(6,uemail);
					pss.setString(7,phone);
					System.out.println("ok996");

					pss.setString(8,timeFrom);
					pss.setString(9,dateofjourney);
					pss.setString(10,number);
					pss.setLong(11,add);
					System.out.println("ok3336");

					pss.setInt(12,n);
					System.out.println("ok5fdf55");

					System.out.println(pss);
					
					int i=pss.executeUpdate();
					System.out.println("ok66");
				    if(i>0) {
						System.out.println("ok999");
					
						response.sendRedirect("ViewTicket.jsp");
						}
					else {
				
					response.sendRedirect("RegForm.jsp");
					}  }
		  
		  
		  
		  System.out.println("okkk");
		  
		  }
				 catch(Exception e){
				 	e.printStackTrace();
				 

				 }

	}

}
