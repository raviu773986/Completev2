<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>


<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!

   	Connection conn;
    PreparedStatement statement;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","Pass@1234");
        	statement = conn.prepareStatement("update employee set sal=? where id=?;");
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
    int sal = Integer.parseInt(request.getParameter("sal"));
	
    statement.setInt(1,sal);
    statement.setInt(2,id);
    statement.executeUpdate();

    %>
    
    <h1> Record Updated Successfully!!</h1>
    <a href="http://localhost:8082/Completev2/Home.html">Back to Home</a></br>

 