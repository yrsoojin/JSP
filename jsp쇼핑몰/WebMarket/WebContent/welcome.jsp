<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body class="pt-5">
	<%@ include file="menu.jsp" %>
	
	<div class = "jumbotron">
		<div class = "container">
			<h1 class ="display-3">웹 쇼핑몰에 오신 것을 환영합니다</h1>			
		</div>
	</div>
	
	<div class = "container">
		<div class = "text-center">
			<h3>JSP를 새로 시작해봅시다아아아아아~~</h3>
		</div>
		<hr>
	</div>
	
	<%@ include file="footer.jsp" %>


<%-- <%! int count = 3;
	String makeItLower(String data) {
		return data.toLowerCase();
	}
%>

<% for(int i=0; i<count; i++) {
	out.println("Java " + i + "\n");
}
%>

<%=makeItLower("Hello World") %> --%>

</body>
</html>