<%@page import="java.text.DecimalFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();
	
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
			if(n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			if(n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>주문 정보</title>
</head>
<body class="pt-5">
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-secondary">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justift-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br>성명 : <%out.println(shipping_name); %><br>우편번호 : <%out.println(shipping_zipCode); %>
				<br>주소 : <%out.println(shipping_addressName); %>( <%out.println(shipping_country); %>)<br>
			</div>
			<div class="col-4" align="right">
				<p> <em>배송일 : <%out.println(shipping_shippingDate); %></em>
			</div>
		</div>
		<div>
			<table class="table table-hover table-striped">
			<thead>
			<tr>
				<th scope="col" class="text-center">제품</th>
				<th scope="col" class="text-center">수량</th>
				<th scope="col" class="text-center">가격</th>
				<th scope="col" class="text-center">소계</th>
			</tr>
			</thead>
			<%
				int sum=0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if(cartList == null) {
					cartList = new ArrayList<Product>();
				}
				for(int i=0; i<cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum += total;
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname() %></em></td>
				<td class="text-center"><%=product.getQuantity() %></td>
				<td class="text-center"><%DecimalFormat df = new DecimalFormat("##,###,###");%>
					<%=df.format(product.getUnitPrice())%>원</td>
				<td class="text-center"><%=df.format(total)%>원</td>
			</tr>
			<%
				}
			%>
			<tr class="table-secondary">
				<td> </td>
				<td> </td>
				<td class="text-right"><strong>총액 : </strong></td>
				<td class="text-center text-danger"><strong><%DecimalFormat df = new DecimalFormat("##,###,###");%>
					<%=df.format(sum)%>원</strong></td>
			</tr>
			</table>
			
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-light" role="button"> 이전 </a>
			<a href="./thankCustomer.jsp" class="btn btn-dark" role="button"> 주문 완료 </a>
			<a href="./checkOutCancelled.jsp" class="btn btn-danger" role="button"> 취소 </a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	
</body>
</html>