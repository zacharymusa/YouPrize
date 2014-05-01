		
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/youPrizeDB">
	select firstname, lastname from user;
</sql:query>

<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

  <h2>Results</h2>
  
	<c:forEach var="row" items="${rs.rows}">
	    FirstName ${row.firstname}<br/>
	    LastName ${row.lastname}<br/>
	</c:forEach>

  </body>
</html>
