<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<% 
 byte[] imgData = null;
%>
<jsp:scriptlet>
String photo = request.getParameter("photo");
</jsp:scriptlet>
<%
try {
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/YouPrize",
        "root", "");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT PhotoBlob FROM photo WHERE PhotoID = '"+photo+"';");

while (rs.next()) {
Blob image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
}  
// display the image
response.setContentType("image/png");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();

rs.close();
stmt.close();
con.close();
} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} 
%>