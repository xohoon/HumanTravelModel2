<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href="../member/login.jsp";
	</script>
	<%
}else if(id != null){
	%>
	<script type="text/javascript">
		location.href="pwriteForm.jsp";
	</script>
	<%
}
%>

</body>
</html>