<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <%!
    
   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","Pass@1234");
        	statement = conn.prepareStatement("insert into employee values (?,?,?,?);");
    	}catch(SQLException e){
    		System.out.print("SQL exception");
    	}catch(ClassNotFoundException ec){
    		System.out.print("Class not found");
    	}
    }
    
    public void jsDestroy() throws SQLException{
    	statement.close();
		conn.close();
    	
    }
    
    %>
    
    
    <%
    
    int id = Integer.parseInt(request.getParameter("id"));
    String last_name = request.getParameter("lastname");
    String first_name = request.getParameter("firstname");
    int sal = Integer.parseInt(request.getParameter("sal"));
	out.print(id);
	out.print(last_name);
	out.print(first_name);

    statement.setInt(1,id);
    statement.setString(2,last_name);
    statement.setString(3,first_name);
    statement.setInt(4,sal);
    
    
    statement.executeUpdate();

    %>
   
  <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
    <h1>Added Successfully!!!</h1>
    		<a href="http://localhost:8082/Completev2/Home.html">Back to Home</a></br>
  

</body>
</html>