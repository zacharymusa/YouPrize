<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/YouPrize",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from user where UserEmail='" + userid + "' and Password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        String redirectURL = "../YouPrize/dashboard.jsp"; 
        response.sendRedirect(redirectURL);
    } else {
        out.println("Invalid password <a href='home.jsp'>try again</a>");
    }
%>