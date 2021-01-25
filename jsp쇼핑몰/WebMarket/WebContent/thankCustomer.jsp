<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body class="pt-5">
<% 
	request.setCharacterEncoding("UTF-8");

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
		}
	}
%>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-primary">주문해주셔서 감사합니다.</h2>
		<p> 주문은 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다.
		<p> 주문번호 : <%out.println(shipping_cartId); %>
	</div>
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>
		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>

<%

	for(int i=0; i<cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cardId")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_name")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_shippingDate")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_country")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_zipCode")) {
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_addressName")) {
			thisCookie.setMaxAge(0);
		}
		
		response.addCookie(thisCookie);
	}
%>