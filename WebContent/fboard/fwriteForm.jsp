<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 - 글쓰기</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!--header-->
<jsp:include page="../inc/top.jsp"/>
<%
String id = (String)session.getAttribute("id");
if(id ==  null){
	%>
	<script type="text/javascript">
		alert("로그인을 먼저 해주세요");
		location.href="../member/login.jsp";
	</script>
	<%
	
}
%>
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

<!-- 게시판 -->
<article>
<h1>Notice</h1>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="bid" value="<%=id %>">
<table id="notice">
		<tr><td>Writer</td><td><%=id %></td></tr>
		<tr><td>Pw</td><td><input type="password" name="pw" class="textbox"></td></tr>
		<tr><td>Title</td><td><input type="text" name="subject" class="textbox"></td></tr>
		<tr><td>내용</td><td><textarea name="content" rows="10" cols="20" class="textbox1"></textarea></td></tr>
		<tr><td>첨부파일</td><td><input type="file" name="file"></td></tr>
		<tr><td colspan="2"><input type="submit" value="Write" class="page">
		<input type="reset" value="Reset" class="page">
		<input type="button" value="PageBack" onclick="location.href='flist.jsp?=BackPageNum'" class="page">

		</td></tr>

</table>

</form>
<div class="clear"></div>
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





