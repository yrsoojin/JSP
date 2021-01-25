<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="dao.BbsDao"%>
<%@ page import="dto.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>게시판</title>
</head>
<body class="pt-5">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null ) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Support</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDao bbsDao = new BbsDao();
						ArrayList<Bbs> list = bbsDao.getList(pageNumber);
						for(int i=0; i<list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>	
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시 " + list.get(i).getBbsDate().substring(14,16)+"분 " %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber!=1) {
			%>
				<a href="support.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-light btn-arraw-left">이전</a>
				<span>&nbsp&nbsp</span>
			<%
				} 
				if(bbsDao.nextPage(pageNumber+1)) {
			%>
				<a href="support.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-light btn-arraw-left">다음</a>
				<span>&nbsp&nbsp</span>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-dark pull-right">글쓰기</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	
</body>
</html>