<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	
	
	</head>	
	
	<body>
		
		
		
		<c:forEach items="${message}" var="list">
			
		<h1>${list.sname}</h1>
		<h1>${list.attendance}</h1>
		
		</c:forEach>
		
		
		</body>

</html>

