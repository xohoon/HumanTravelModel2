<%@page import="fboard.BoardDAO"%>
<%@page import="fboard.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
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
<div id="sub_img_center"><img src="../images/p03.png" width="970.5" height="220"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="flist.jsp">Korea Travel</a></li>
<li><a href="flist.jsp">Foreigen Travel</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
String id = (String)session.getAttribute("id");
request.setCharacterEncoding("utf-8");
int num =Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

int BackPageNum;
if(request.getParameter("pageNum") != null){
	BackPageNum = Integer.parseInt(request.getParameter("pageNum"));
}
%>
<jsp:useBean id="Bdto" class="fboard.BoardDTO" />
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
	<td width="150">글번호</td>
	<td><%=Bdto.getNum() %></td>
	<td>조회수</td>
	<td><%=Bdto.getReadcount() %></td>
</tr>
<tr>
	<td>작성자</td>
	<td><%=Bdto.getName() %></td>
	<td width="150">작성일</td>
	<td width="150"><%=Bdto.getDate() %></td>
</tr>
<tr>
	<td height="50">글제목</td>
	<td colspan="4"><%=Bdto.getSubject() %></td>
</tr>
<tr>
	<td>글내용</td>
	<td colspan="4" width="100" height="300"><%=Bdto.getContent() %></td>
</tr>
<tr>
	<td>파일다운로드</td>
	<td colspan="4"><a href="file_down2.jsp?file_name=<%=Bdto.getFile() %>">File Download</a></td>
</tr>

<%
if(Bdto.getBid().equals(id)){
%>
<tr>
	<td colspan="4">
		<input type="button" value="Modify" onclick="location.href='fupdateForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'" class="page">
		<input type="button" value="Delete" onclick="location.href='fdeleteForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'" class="page">
		<input type="button" value="PageBack" onclick="location.href='flist.jsp?=BackPageNum'" class="page">
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
