package com.Planon;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class StudentDetails
 */
@WebServlet("/UserDetails")
public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 	Connection con;
	    Statement stmt,stmt1;
		String firstName,middleName,lastName,gender,dob,email,address,phoneNo,subject,role;
		String dburl = "jdbc:sqlserver://localhost:1433;databaseName=SchoolApplication;user=sa;password=1234";
		String emailCount = "";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("servlet called");
		PrintWriter out = response.getWriter();
//	       out.print("welcome to StudentDetails servlet from signup.jsp");
	       try{
	    	   role = request.getParameter("role");
	    	   firstName = request.getParameter("firstName");
	    	   middleName = request.getParameter("middleName");
	    	   lastName = request.getParameter("lastName");
	    	   gender = request.getParameter("gender");
	    	   dob = request.getParameter("dob");
	    	   email = request.getParameter("email");
	    	   address = request.getParameter("address");
	    	   phoneNo = request.getParameter("phoneNo");
	    	   subject = request.getParameter("subject");
	    	   
	    	   Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	    	   con = DriverManager.getConnection(dburl);
	    	   stmt = con.createStatement();
	    	   stmt1 = con.createStatement();
	    	   String existEmailCount = "0",existPhoneNoCount = "0";
	    	   ResultSet emailCountResult = null;
	    	   ResultSet phoneNoCountResult = null;
//	    	   HttpSession session = request.getSession();
	    	   
	    	   String emailCountQuery = ("SELECT COUNT(email) FROM UserDetails where email = '"+email+"'  ");
	    	   String phoneNoCountQuery = ("SELECT COUNT(phoneNumber) FROM UserDetails where PhoneNumber = '"+phoneNo+"'  ");
	    	   String query = "insert into UserDetails(Role,FirstName,MiddleName,LastName,Gender,DateOfBirth,Email,Address,PhoneNumber,Subject) values('"+role+"','"+firstName+"','"+middleName+"','"+lastName+"','"+gender+"','"+dob+"','"+email+"','"+address+"','"+phoneNo+"','"+subject+"')";
	    	   try {
	    		  emailCountResult = stmt.executeQuery(emailCountQuery);
	    		  phoneNoCountResult = stmt1.executeQuery(phoneNoCountQuery);
	    		  if(emailCountResult.next()) {
	    			  existEmailCount = emailCountResult.getString(1);
	    			  
	    		  }
//	    		  emailCount = existEmailCount;
	    		  if(phoneNoCountResult.next())
	    			  existPhoneNoCount = phoneNoCountResult.getString(1);
	    		  
//	    		  Cookie emailCount = new Cookie("emailCount",existEmailCount);
//		   	       response.addCookie(emailCount);
//		   	       emailCount.setDomain("localhost");
//		   	    Cookie phoneCount = new Cookie("phoneCount",existPhoneNoCount);
//		   	       response.addCookie(phoneCount);
//		   	       phoneCount.setDomain("localhost");
		   	  
//	    		  session.setAttribute("email", existEmailCount);
//		    	  session.setAttribute("phoneNo", existPhoneNoCount);
	    		  System.out.println("email count : "+existEmailCount);
	    		  System.out.println("phone count : "+existPhoneNoCount);
	    		   if(existEmailCount.equals("0") && existPhoneNoCount.equals("0")) {
	    			   stmt.execute(query);
			    	   out.print("interested successfully");
			    	   RequestDispatcher RequestDipatcherObj = request.getRequestDispatcher("ViewDetails.jsp");
	    			   RequestDipatcherObj.forward(request, response);
//	    			   session.removeAttribute("error");
//	    			   session.setAttribute("error"," ");
	    		   }
//	    		   else {
////	    			   request.setAttribute("existEmailCount", existEmailCount);
////	    			   request.setAttribute("existPhoneNoCount", existPhoneNoCount);
////	    			   System.out.println("email : "+ request.getAttribute("existEmailCount"));
////	    			   System.out.println("counts ");
////	    			   System.out.println("count : "  +existEmailCount+" "+existPhoneNoCount);
//	    			   
////	    			   session.setAttribute("error","already exist");
//	    			   session.setAttribute("phoneNoCount",existPhoneNoCount);
//	    			   System.out.println("calling signup jsp from servlet");
//	    			   RequestDispatcher RequestDipatcherObj = request.getRequestDispatcher("SignUp.jsp");
//	    			   RequestDipatcherObj.forward(request, response);
//	    			   request.getRequestDispatcher("SignUp.jsp").forward(request, response);
	    			   
//	    		   }
	    	   }
	    	   catch(Exception e){
	    		   e.printStackTrace();
	    	   }
	    	   
	       }
	       catch(Exception e) {
	    	   e.printStackTrace();
	       }
		
	}

	public String emailCount() {
		
		System.out.println("email count in emailcount() :"+emailCount);
		return emailCount;
		
	}

}