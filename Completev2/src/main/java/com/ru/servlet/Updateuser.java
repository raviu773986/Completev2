package com.ru.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
@WebServlet("/updateuser")
public class Updateuser extends HttpServlet {
	private Connection connection;
	private static final long serialVersionUID = 1L;
	
	public void init()
	{
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	 connection = DriverManager.getConnection("jdbc:mysql://localhost/HelloWorld","root","Pass@1234"); 
        	 
    	}catch(SQLException e){
    		System.out.print("SQL exception");
    	}catch(ClassNotFoundException ec){
    		System.out.print("Class not found");
    	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		int salary=Integer.parseInt(request.getParameter("salary"));
		
		try {
			Statement statement=connection.createStatement();
			int result=statement.executeUpdate("update employee set salary='"+salary+"' where id='"+id+"'");
			PrintWriter out=response.getWriter();
			if(result > 0) {
				out.println("<h1> Salary updated</h1>");
			}
			else {
				out.print("<h2>Salary not updated</h2>");
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	public void destroy()
	{
		try {
				connection.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

}
