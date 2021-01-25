<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>게시판 글쓰기</title>
</head>
<body class="pt-5">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null ) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Support</h1>
		</div>
	</div>
	<div class="container">
	<form action="./writeAction.jsp" method="post">
		<div class="form-group row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
				<tr>
					<th style="background-color: #eeeeee; text-aling: center;">게시판 글 양식</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-dark" value="글쓰기">
		</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>