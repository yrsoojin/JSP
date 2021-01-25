<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>회원 가입</title>
</head>
<body class="pt-5">
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./loginAction.jsp" class="form-horizontal" method="post">
			<div class="form-group row">
				<div class="col-sm-4">
				<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-4">
				<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10" >
					<input type="submit" class="btn btn-dark" value="로그인">
					<a href="./joinUser.jsp" class="btn btn-outline-secondary my-2 my-sm-0">회원가입</a>
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>