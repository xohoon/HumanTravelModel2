<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 - 답글쓰기</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!--header-->
<jsp:include page="../inc/top.jsp"/>
<%
request.setCharacterEncoding("utf-8");

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
<div id="sub_img_center"></div>
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
<%
int re_ref = Integer.parseInt(request.getParameter("re_ref"));
int re_lev = Integer.parseInt(request.getParameter("re_lev"));
int re_seq = Integer.parseInt(request.getParameter("re_seq"));
int num = Integer.parseInt(request.getParameter("num"));
%>
<article>
<h1>Notice</h1>
<form action="RewritePro.jsp?num=<%=num %>" method="post">
<input type="hidden" name="re_ref" value="<%=re_ref %>">
<input type="hidden" name="re_lev" value="<%=re_lev %>">
<input type="hidden" name="re_seq" value="<%=re_seq %>">

<table id="notice">
		<tr><td>Writer</td><td><input type="text" value="<%=id %>" name="bid" class="textbox"></td></tr>
		<tr><td>Subject</td><td><input type="text" name="subject" class="textbox"></td></tr>
		<tr><td>Content</td><td><textarea name="content" rows="10" cols="20" class="textbox1"></textarea></td></tr>
		<tr>
		<td colspan="2">
		<input type="submit" value="Write" name="content" class="page">
		<input type="reset" value="Reset" class="page">
		<input type="button" value="PageBack" onclick="location.href='list.jsp?=BackPageNum'" class="page">
		</td>
		</tr>

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





