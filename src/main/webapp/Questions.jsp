<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="windows-1256">
<title>Questions</title>
</head>
<body>
	<form method="get" action="userpageservlet">
		<center>
			<h1>
				<%=session.getAttribute("coursename") %>
			</h1>
			<br>
			<%
		//	if(session.getAttribute("rs")==null){
            	Connection con=null ;
        		ResultSet rs = null; //the object that hold the record,records data
        		String sql=null;
        		try {
        			
        			Class.forName("com.mysql.cj.jdbc.Driver"); // routine intialization for mysql
        			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        			// keep in mind the 3306 can differ between us so check first in XAMPP	
        			
        				String difficulty = ""+session.getAttribute("difficulty");
        				Statement s = con.createStatement(); 
        				if(request.getParameter("easy")!=null || difficulty.equals("easy")){
        					System.out.println("brdo sah8al");
        					//System.out.println(session.getAttribute("courseID"));	
        					sql ="SELECT * FROM question WHERE course_id ='"+session.getAttribute("courseID")+"' AND difficulty = '0' ORDER BY RAND()";
        					session.setAttribute("difficulty", "easy");
        					//System.out.println("passed");
        				}else if(request.getParameter("medium")!=null || difficulty.equals("medium")){
        					sql ="SELECT * FROM question WHERE course_id ='"+session.getAttribute("courseID")+"' AND difficulty = '1' ORDER BY RAND()";
        					session.setAttribute("difficulty", "medium");			
        				}else if(request.getParameter("hard")!=null || difficulty.equals("hard")){
        					sql ="SELECT * FROM question WHERE course_id ='"+session.getAttribute("courseID")+"' AND difficulty = '2' ORDER BY RAND()";
        					session.setAttribute("difficulty", "hard");
        				}else if(request.getParameter("random")!=null || difficulty.equals("random")){
        					sql ="SELECT * FROM question WHERE course_id ='"+session.getAttribute("courseID")+"' ORDER BY RAND()";
        					session.setAttribute("difficulty", "random");
        				}
        				
        				rs = s.executeQuery(sql); // stores records that follow the mysql code condition
        				session.setAttribute("rs", rs);
        				if(session.getAttribute("count")==null)
        				{
        				int count=0;
        				session.setAttribute("count", count);
        				}
        				request.getRequestDispatcher("TheQuestions.jsp").forward(request, response);
        				

        		}
        		catch (ClassNotFoundException e) {
        			System.out.println("class not found");
        		}
        		
        		catch (SQLException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        			System.out.println("al code atmn3");
        		}
        		con.close();
//			}
			//else{
				//request.getRequestDispatcher("TheQuestions.jsp").forward(request, response);
				
		//	}
			
        		%>
</body>
</html>