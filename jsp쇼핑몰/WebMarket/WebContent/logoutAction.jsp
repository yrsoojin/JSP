<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
<title>JSP 게시판 웹 사이트</title>
</head>
<body class="pt-5">
	<%	
		session.invalidate();
	%>
	<script>
		location.href = 'products.jsp';
	</script>
</body>
</html>