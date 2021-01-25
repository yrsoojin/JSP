<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String userID = null;
if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
if(userID == null) {
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('로그인을 하세요.')");
script.println("location.href='login.jsp'");
script.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>배송 정보</title>
</head>
<body class="pt-5">
	<jsp:include page="menu.jsp"></jsp:include>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">배송 정보</h1>
			</div>
		</div>
		<div class="container">
			<form action="./processShippingInfo.jsp" class="form-horizontal" method="post">
				<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>"/>
				<div class="form-group row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control"/>
					</div> 
				</div>
				<div class="form-group row">
					<label class="col-sm-2">배송일</label>
					<div class="col-sm-3">
						<input name="shippingDate" type="text" class="form-control"/>(yyyy/mm/dd)
					</div> 
				</div>
				<div class="form-group row">
					<label class="col-sm-2">국가</label>
					<div class="col-sm-3">
						<input name="country" type="text" class="form-control"/>
					</div> 
				</div>
				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-3">
						<input name="zipCode" type="text" class="form-control"/>
					</div> 
				</div>
				<div class="form-group row">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input name="addressName" type="text" class="form-control"/>
					</div> 
				</div>
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-light" role="button"> 이전 </a>
						<input type="submit" class="btn btn-dark" value="등록"/>
						<a href="./checkOutCancelled.jsp" class="btn btn-danger" role="button"> 취소 </a>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	
</body>
</html>