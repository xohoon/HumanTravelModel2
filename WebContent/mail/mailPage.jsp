<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.internet.AddressException"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%-- <%@page import="com.sun.xml.internal.fastinfoset.sax.Properties"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일보내기</title>
<link href="../css/default.css?ver3" rel="stylesheet" type="text/css">
<link href="../css/subpage.css?ver3" rel="stylesheet" type="text/css">
<!-- jspmailtest09 -->
<!-- asdf1234@ -->
</head>
<body>
<div id="wrap">
<!--header-->
<jsp:include page="../inc/top.jsp"/>
<!--header-->
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div class="clear"></div>
<div id="sub_img_center"><img src="../images/p05.png" width="970.5" height="220"></div>

<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Send E-mail</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->


<article>
<h1>Send Mail</h1>
<form action="../mailSend" method="post" id="join">
	<fieldset>
	<legend>E-mail</legend>
		<label>보내는 사람 메일</label><input type="text" name="sender" class="textbox"><br />
		<label>받는 사람 메일</label><input type="text" name="receiver" class="textbox"><br />
		<label>제목</label><input type="text" name="subject" class="textbox"><br />
		<label>내용</label><textarea rows="20" cols="40" name="content" class="textbox1"></textarea><br />
	</fieldset>
	<div class="clear"></div>
	<div id="buttons">
		<input type="submit" value="Send Mail" class="submit">
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



