<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
         <%@ page import="com.Planon.UserDetails" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<script>

function emailValidation(){
	
	var email =   document.getElementsByName("email")[0].value;	
	alert(email);
	var phoneNo =   document.getElementsByName("phoneNo")[0];	
	function setCookie(name, value)
	  {
	    document.cookie="name=uwrthie";
	  }
	document.cookie = "emailid="+email;
	<%
//	session.invalidate();
//	HttpSession session687=request.getSession();
//	session687.setAttribute("sdbufg", "sdfhyustr");
	String emailid= request.getParameter("email"),phoneNo="";
	System.out.println("line 24: "+emailid);
		Cookie cookie = null;
	   Cookie[] cookies = null;
	   cookies = request.getCookies();
	    if( cookies != null)
	      {
//	      for (int i = 0; i < cookies.length; i++){
//	         cookie = cookies[i];
//	         String b = cookie.getValue();
//	     request.setAttribute("xyz", b);
	//System.out.println("cookie ; "+b+" "+cookie.getName());
//	     }
//		 emailid = cookies[1].getValue();
//		 phoneNo = cookies[2].getValue();
	     }	
	
	String msg = "hi";
	Connection con;
	Statement stmt,stmt1;
	String emailCount="",phoneNoCount = "";
	UserDetails userDetailsObj = new UserDetails();
	//String email = userDetailsObj.emailCount();
// 	String email =(String) session.getAttribute("email");
// session.removeAttribute("email");
//	Cookie ck[]=request.getCookies();  
//   System.out.print("cookie value :"+ck[0].getValue()+" "+ck[0].getName());  

	
    

	//System.out.println(email);
	String dburl = "jdbc:sqlserver://localhost:1433;databaseName=SchoolApplication;user=sa;password=1234";
	
//	System.out.println("email:"+email);
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con = DriverManager.getConnection(dburl);
	stmt = con.createStatement();
	String existEmailCount="";
	ResultSet emailCountResult = null;
	String emailCountQuery = ("SELECT COUNT(email) FROM UserDetails where email = '"+emailid+"'  ");
	try {
		  emailCountResult = stmt.executeQuery(emailCountQuery);
		  if(emailCountResult.next()){
			   existEmailCount = emailCountResult.getString(1);
		  }
			
		  System.out.println("email count : "+existEmailCount);
		}
		   catch(Exception e){
			   
		   }
//	String str="true"; 
//	Cookie cookie = null;
//   Cookie[] cookies = null;
//   cookies = request.getCookies();
//    if( cookies != null)
 //     {
//      for (int i = 0; i < cookies.length; i++){
//         cookie = cookies[i];
//         String b = cookie.getValue();
//     request.setAttribute("xyz", b);
//System.out.println("cookie ; "+b+" "+cookie.getName());
//     }
//	 emailCount = cookies[1].getValue();
//	 phoneNoCount = cookies[2].getValue();
//     }	

	%>    
	   var s="<%=existEmailCount%>"; 
		var emailid = "<%=emailid%>"; 
	   alert(emailid);
	   
	   if(existEmailCount.equals("1")){
		   alert("already registered"); 
	   }
	   
	
	
}
</script>
</body>
</html>