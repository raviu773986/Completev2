<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   
    <title>User management</title>
</head>
<body>

</body>
</html>

   <!-- header part-->
   <div class="dark container-fluid">
    <h1 class="text-center " style="color:rgba(255, 0, 0, 0.753);  font-style: oblique;
    font-family: serif;
    font-weight: bold; text-shadow: 2px 2px 4px #000000;">USER Management System </h1>
</div>
<!-- header close -->
<!-- navbar -->


<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav  ml-auto">
          <li class="nav-item">
              <a class=" nav-link  " href="http://localhost:8082/Completev2/Home.html">HOME</a>
          </li>
          <li class="nav-item">
             <a class=" nav-link  "  href="http://localhost:8082/Completev2/CreateEmployee.html">ADD USER</a>
          </li>
          <li  class="nav-item">
              <a class=" nav-link  "  href="http://localhost:8082/Completev2/UpdateEmployee.html" >UPDATE SALARY</a>
          </li>
          <li class="nav-item">
             <a class=" nav-link  "   href="http://localhost:8082/Completev2/Display.jsp"">DISPLAY USERS</a>
          </li>
                   
      </ul>
  </div>
</nav>

<!-- navbar end -->

<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "mydb";
String userId = "root";
String password = "Pass@1234";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Employee details</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="3px" width="700px" >
<tr>

</tr>
<tr bgcolor="Pink">
<td><b>id</b></td>
<td><b>First Name</b></td>
<td><b>Last Name</b></td>
<td><b>Salary</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM employee";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="lightgreen">

 			<td><%=resultSet.getInt(1) %></td> 
 			<td><%=resultSet.getString(2) %></td> 
 			<td><%=resultSet.getString(3) %></td> 
 			<td><%=resultSet.getInt(4) %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<a href="http://localhost:8082/Completev2/Home.html">Back to Home</a></br>
</table>