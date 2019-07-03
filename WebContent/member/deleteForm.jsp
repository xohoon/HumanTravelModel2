<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div class="clear"></div>
<div id="sub_img_center"><img src="../images/p07.png" width="970.5" height="220"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../member/memberinfo.jsp">회원정보</a></li>
<li><a href="../member/modifyForm.jsp">정보수정</a></li>
<li><a href="../member/deleteForm.jsp">회원탈퇴</a></li>
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("login.jsp");
}else if(id.equals("admin")){
	%>
	<li><a href="../member/list.jsp">회원목록</a></li>
	<%
}
%>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>

<form action="deletePro.jsp" method="post" id="join">
	<fieldset>
		<legend><h1>Delete Info</h1></legend>
			<label>User ID</label>
				<input type="text" name="id" value="<%=id %>" readonly="readonly"><br>
			<label>Password</label>
		<input type="password" name="pw" placeholder="비밀번호"><br>
	</fieldset>
		<div class="clear"></div>
		<div id="buttons">
				<input type="submit" value="탈퇴" class="submit">
				<input type="reset" value="취소" class="cancel">
	</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>