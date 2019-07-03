<%@page import="pboard.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 게시판</title>
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
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
int num =Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

int BackPageNum;
if(request.getParameter("pageNum") != null){
	BackPageNum = Integer.parseInt(request.getParameter("pageNum"));
}
%>
<jsp:useBean id="Bdto" class="pboard.BoardDTO" />
<jsp:setProperty property="*" name="Bdto"/>
<%
Bdto.setNum(num);

BoardDAO Bdao = new BoardDAO();

Bdao.updateReadCount(num);
Bdto = Bdao.getBoardContent(num);


// 조회수 증가 readcount 증가
// sql update readcount = readcount +1
// updateReadCount(num) 메서드 호출
%>
<article>
<h1>Page content</h1>
<table id="notice">
<tr>
	<td>글번호</td>
	<td><%=Bdto.getNum() %></td>
	<td>조회수</td>
	<td><%=Bdto.getReadcount() %></td>
</tr>
<tr>
	<td>작성자</td>
	<td><%=Bdto.getBid()%></td>
	<td>작성일</td>
	<td><%=Bdto.getDate() %></td>
</tr>
<tr>
	<td>글제목</td>
	<td colspan="4"><%=Bdto.getSubject() %></td>
</tr>
<tr>
	<td height="300">글내용</td>
	<td colspan="4"><%=Bdto.getContent() %>
	<img src="../fileUploadP/<%=Bdto.getFile() %>" width="300" height="300">
	</td>
</tr>


<%
if(Bdto.getBid().equals(id)){
%>
<tr>
	<td colspan="4">
		<input type="button" value="Modify" onclick="location.href='pupdateForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'" class="page">
		<input type="button" value="Delete" onclick="location.href='pdeleteForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'" class="page">
		<input type="button" value="PageBack" onclick="location.href='plist.jsp?=BackPageNum'" class="page">
	</td>
</tr>
<%
}
%>
</table>
</article>
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!--footer-->
<jsp:include page="../inc/bottom.jsp"/>
<!--footer-->
</div>
</body>
</html>
