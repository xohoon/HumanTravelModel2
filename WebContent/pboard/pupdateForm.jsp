<%@page import="pboard.BoardDAO"%>
<%@page import="pboard.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 게시판 - 수정</title>
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
<div id="sub_img_center"><img src="../images/p02.png" width="970.5" height="220"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="plist.jsp">Korea Travel</a></li>
<li><a href="plist.jsp">Foreigen Travel</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
int num =Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="Bdto" class="pboard.BoardDTO" />
<jsp:setProperty property="*" name="Bdto"/>
<%
BoardDAO Bdao = new BoardDAO();
Bdto = Bdao.getBoardContent(num);
%>
<article>
<h2>게시판 글 수정</h2>
<form action="pupdatePro.jsp?pageNum=<%=pageNum %>" method="post">
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
		<tr>
		<td>첨부파일</td><td><input type="file" name="file"></td>
		</tr>
		<tr><td colspan="2">
		<input type="submit" value="Update" class="page">
		<input type="reset" value="Reset" class="page">
		<input type="button" value="PageBack" onclick="location.href='plist.jsp'" class="page">
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











