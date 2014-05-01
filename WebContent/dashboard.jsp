<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>My Dashboard</title>
</head>
<body>
<%
String user = (String)session.getAttribute("userid");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/YouPrize",
        "root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select FirstName from user where UserEmail='" + user + "'");
rs.next();
String fName = rs.getString("FirstName"); 


%>
	<div style="height: 51px; background-color: rgb(52, 52, 51);">
		<img src="34.png" />
		<a href="home.jsp"  style="float: right; margin-right: 10px; color: white;">logout</a>
		<h3 style="float: right; margin-right: 10px; color: white;">
			Welcome,
			<%
			out.println(fName);
		%>
		</h3>
	
	</div>
<div>
		<div
			style="width: 150px; background-color: rgb(196, 198, 200); height: 100vh; margin-top: 5px;float:left;">
			<a href="Content.jsp"
				style="margin-top: 10px; margin-left: 5px; color: rgb(52, 52, 51); text-decoration: none;">My
				Contests</a><br /> <a href="#"
				style="margin-top: 5px; margin-left: 5px; color: rgb(52, 52, 51); text-decoration: none;">My
				Content</a><br /> <a href="#"
				style="margin-top: 5px; margin-left: 5px; color: rgb(52, 52, 51); text-decoration: none;">My
				Favorites</a><br />

		</div>
		<div><br/>
		<h3>
		Dashboard
		</h3>
		</div>
</div>

</body>
</html>