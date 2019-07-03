<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 - 수정</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!--header-->
<jsp:include page="../inc/top.jsp"/>
<!--header-->
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div class="clear"></div>
<div id="sub_img_center"><img src="../images/p01.png" width="970.5" height="220"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="list.jsp">Korea Travel</a></li>
<li><a href="list.jsp">Foreigen Travel</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
int num =Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="Bdto" class="board.BoardDTO" />
<jsp:setProperty property="*" name="Bdto"/>
<%
BoardDAO Bdao = new BoardDAO();
Bdto = Bdao.getBoardContent(num);
%>
<article>
<h2>게시판 글 수정</h2>
<form action="updatePro.jsp?pageNum=<%=pageNum %>" method="post">
<input type="hidden" name="num" value="<%=num%>">
	<table id="notice">
		<tr>
		<td>글쓴이</td><td><%=Bdto.getBid() %></td>
		</tr>
		<tr>
		<td>비밀번호</td><td><input type="password" name="pw" class="textbox"></td>
		</tr>
		<tr>
		<td>제목</td><td><input type="text" name="subject" value="" class="textbox"></td>
		</tr>
		<tr>
		<td>내용</td><td><textarea name="content" rows="10" cols="20" class="textbox1"></textarea></td>
		</tr>
		<tr><td colspan="2">
		<input type="submit" value="글수정" class="page">
		<input type="reset" value="다시쓰기" class="page">
		<input type="button" value="뒤로가기" onclick="location.href='list.jsp'" class="page">
		</td>
		</tr>
	</table>
</form>
</article>

<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!--footer-->
<jsp:include page="../inc/bottom.jsp"/>
<!--footer-->
</div>
</body>
</html>











