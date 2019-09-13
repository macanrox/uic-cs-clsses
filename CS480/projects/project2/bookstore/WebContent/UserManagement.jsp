<%@page import ="java.sql.*"%>
<%@page import ="javax.sql.*"%>
<%@ include file="index.jsp" %>

<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Bookstore Books</title> 
	</head> 
	<body>
		<h1 align="center">User Management</h1> 
		<div align="right" id="navigation">
			<% String username=(String)session.getAttribute("user");
			int userType = (Integer)session.getAttribute("type");
			
			if(userType != 1){
				response.sendRedirect("http://localhost:8080/bookstore/401.jsp");
			}
			else if(username==null){
				response.sendRedirect("http://localhost:8080/bookstore/Login.jsp");
			}
			%>
			
			<a href="#"><%=username %></a>
			</br>
			<form action="Logout.jsp" method="post">
				<input type="submit" value="logout">
			</form>
		</div>		
		<center> 
		<a href="http://localhost:8080/bookstore/Registration.jsp">Add user</a>
			<table border="1">
				<thead>
					<tr>
						<th>Type</th>
						<th>Username</th>
						<th>Password</th>
						<th>Name</th>
						<th>Address</th>
						<th>Credit Card</th>
						<th>Actions</th>
					</tr>
				</thead>
	  			<tbody>
	  				<%
						java.sql.Connection conn = null;
						java.sql.Statement st = null;

						try {
							Class.forName(DBDriver);
							conn = DriverManager.getConnection(strConn, DBusername, DBpassword);
							st = conn.createStatement();
							PreparedStatement pst = conn.prepareStatement("SELECT * FROM users");
							ResultSet rs = pst.executeQuery(); 

							while(rs.next()){
					%>
	  				<tr>
	  					<% 
	  					int type = rs.getInt("type"); 
	  					String user_type = null;
	  					if(type == 0) {
	  						 user_type = "Normal";
	  					}
	  					else {
	  						 user_type = "Administrator";
	  					}
	  					%>
	  					<% String user = rs.getString("username"); %>
	  					<form>
	  						<td align="center"><%= user_type %></td>
	  						<td align="center"><%=user %></td>
	  						<td align="center"><%=rs.getString("password") %></td>
	  						<td align="center"><%=rs.getString("name") %></td>
	  						<td align="center"><%=rs.getString("address") %></td>
	  						<td align="center"><%=rs.getLong("credit_card") %></td>
	  						<td>
	  							<input type="hidden" name="username" value=<%=user%>> 
	  							<button type="submit" formaction="http://localhost:8080/bookstore/DeleteUser.jsp">Delete</button>
	  							<button type="submit" formaction="http://localhost:8080/bookstore/ModifyUser.jsp">Modify</button>
	  						</td>
	  					</form>
	  				<% 
	  						}//end while
	  					}//end try
	  					catch(Exception e){
	  						out.println(e.toString());
	  					}	
	  				%>
	  				</tr>
	  			</tbody>
			</table>
		</center> 
	</body> 
</html>