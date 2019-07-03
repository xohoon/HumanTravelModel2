<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	%>
	<div id="login"><a href="../member/login.jsp">Login</a> | <a href="../member/join.jsp">Join</a></div>
	<%
}else if(id != null){
	%>
	<div id="login"><a href="../member/memberinfo.jsp">회원정보</a> | <a href="../inc/logout.jsp">로그아웃</a></div>
	<%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/mainL.png" width="300" height="100" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../board/list.jsp">TRAVEL</a></li>
	<li><a href="../pboard/plist.jsp">REVIEW PHOTO</a></li>
	<li><a href="../fboard/flist.jsp">TRAVEL Ad</a></li>
	<li><a href="../mail/mailPage.jsp">Q&A</a></li>
</ul>
</nav>
</header>