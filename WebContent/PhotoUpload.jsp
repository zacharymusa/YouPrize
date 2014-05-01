<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <%
String user = (String)session.getAttribute("userid");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/YouPrize",
        "root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select UserID from user where UserEmail='" + user + "'");
rs.next();
int userID = rs.getInt("UserID");
session.setAttribute("userID", userID);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Content. Photo Upload Demo</title>
</head>
<body>
    <center>
        <h1>My Content. Photo Upload Demo</h1>
        <form method="post" action="uploadServlet" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Photo: </td>
                    <td><input  onchange="getImg(this,1000,'jpeg|png')"  type="file" name="photo" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save">
                    </td>
                </tr>
            </table>
        </form>
        
        <script type="text/javascript">
        
        function getImg(input,max,accepted){
        	var upImg=new Image(),test,size,msg=input.form;
        	msg=msg.elements[0].children[0];
            return input.files?validate():
        	(upImg.src=input.value,upImg.onerror=upImg.onload=validate);
               
        	function validate(){
        		test=(input.files?input.files[0]:upImg);
        		size=(test.size||test.fileSize)/1024;
        		mime=(test.type||test.mimeType);

        	mime.match(RegExp(accepted,'i'))?
        	size>max?(input.form.reset(),msg.innerHTML=max+"KB Exceeded!"):
        	msg.innerHTML="Upload ready...":	
        	(input.form.reset(),msg.innerHTML=accepted+" file type(s) only!");
        	}
        }
        </script>
    </center>
</body>
</html>