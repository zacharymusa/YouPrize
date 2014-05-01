<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>My Content</title>
<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/lightbox.min.js"></script>
<link href="css/lightbox.css" rel="stylesheet" />
</head>
<body>
	<%
String user = (String)session.getAttribute("userid");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/YouPrize",
        "root", "");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select FirstName, UserID from user where UserEmail='" + user + "'");
rs.next();
String fName = rs.getString("FirstName"); 
String userID = rs.getString("UserID");

%>

	<div style="height: 51px; background-color: rgb(52, 52, 51);">
		<a href="dashboard.jsp">
			<img src="34.png"/>
		</a>
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


		<div id="subSlideshow">
			<table>
				<tr>
					<td id="subpageSlideshow">
						<table>
							<tr>
								<td>
									<h1 id="subpageTitle">Images</h1>
									<form action="display.jsp">
										<%try{
                                          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/YouPrize",
                                                  "root", "");
                                           st = conn.createStatement();
                                          String sql = "SELECT PhotoID, Thumbnail FROM photo where UserID = "+userID;
                                           rs = st.executeQuery(sql);

                                          while(rs.next()){   
                                          String photoName = rs.getString(1);
                                          %>
										<input class="wineDiv" type="submit" name="photo"
											value="<%=photoName %>" />
										<%   }
                                          rs.close();
                                          st.close();

                                        } catch(Exception e){                                               
                                        }%>
									</form>
								</td>
							</tr>
							<tr>
							<td>
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
							</td>
							</tr>
						</table>


					</td>
					<!--   <td id="subpageInfo">
                            <h1 id="subpageTitle">Click on an image to see a larger view</h1>
                            <div id="slider">
                             <script src ="js/slides.js" type="text/javascript"></script>
                                <img id="1" src="pictures/winery_image1.jpg"  />
                                <img id="2" src="pictures/winery_image2.jpg" />
                                <img id="3" src="pictures/winery_image3.jpg" />
                                <img id="4" src="pictures/winery_image4.jpg" />
                                <img id="5" src="pictures/winery_image5.jpg" />
                            </div>   

                            <input class="previous" onclick="prev(); return false;" value="Previous Image" />
                            <input class="next" onclick="next(); return false;" value="Next Image" />                                               
                        </td> -->
				</tr>
			</table>
		</div>
	</div>
</body>
</html>