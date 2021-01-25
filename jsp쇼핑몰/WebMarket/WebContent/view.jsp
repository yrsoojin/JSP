<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="dto.Bbs" %>
<%@ page import="dao.BbsDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>게시글</title>
</head>
<body class="pt-5">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null ) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID=0;
		if(request.getParameter("bbsID") != null) {
			bbsID= Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID==0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 게시글입니다..')");
			script.println("location.href='support.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDao().getBbs(bbsID);
	%>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Support</h1>
		</div>
	</div>
	<div class="container">
		<div class="form-group row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
				<tr>
					<th colspan="3" style="background-color: #eeeeee; text-aling: center;">게시글 보기</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><%=bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시 " + bbs.getBbsDate().substring(14,16)+"분 " %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td style="height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="support.jsp" class="btn btn-light">목록</a><span>&nbsp</span>
			<%
				if(userID != null && userID.equals(bbs.getUserID())) {
			%>
					<a href="update.jsp?bbsID=<%=bbsID %>" class="btn btn-secondary">수정</a><span>&nbsp</span>
					<a href="deleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-danger">삭제</a>
			<%
				}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>