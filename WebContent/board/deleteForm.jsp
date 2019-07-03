<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 - 삭제</title>
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

<!-- 게시판 -->
<article>
<h1>Delete</h1>
<%
int num =Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>

<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post" id="join">
<input type="hidden" name="num" value="<%=num%>">
	<fieldset>
		<legend>Info Delete</legend>
			<label>PassWord Check</label>
			<input type="password" name="pw" placeholder="비밀번호 확인">
	</fieldset>
	<div class="clear"></div>
	<div id="buttons">
<input type="submit" value="삭제" class="submit">
<input type="button" value="뒤로가기" onclick="location.href='list.jsp'" class="cancel">
</div>
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







