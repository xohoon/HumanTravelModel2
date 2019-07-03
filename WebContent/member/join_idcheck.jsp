<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function result(){
		opener.document.fr.id.value = document.frw.userid.value;
		window.close();
	}
</script>
</head>
<body>
<%
String id = request.getParameter("userid");
MemberDAO mdao = new MemberDAO();
out.print(id);
int checkid = mdao.idCheck(id);
// idCheck method
// check = 1 아이디 있음 / 0 사용 가능

if(checkid == 1){
	%>
	<script type="text/javascript">
		alert("아이디가 이미 존재합니다");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("사용가능한 아이디 입니다");
	</script>
		<input type="button" value="선택" onclick="result()">
	<%
	
}
%>
<form action="join_idcheck.jsp" method="post" name="frw">
	<table border="1">
		<tr><td><input type="text" name="userid" value="<%=id %>"></td></tr>
		<tr><td><input type="submit" value="중복확인"></td></tr>
		
	</table>

</form>
</body>
</html>