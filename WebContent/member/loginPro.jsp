<%@page import="member.MemberDAO"%>
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
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
if(id==null){
	response.sendRedirect("../main/main.jsp");
}
%>
<jsp:useBean id="bdto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="bdto"/>
<%
MemberDAO mdao = new MemberDAO();


int check = mdao.userCheck(id, pw);

if(check == 1){
	session.setAttribute("id", id);
	%>
	<script type="text/javascript">
			alert(" 로그인 되었습니다 :) ");
			location.href="../main/main.jsp";
	</script>
	<%
// 			response.sendRedirect("../main/membermain.jsp");
}else if(check == 0){
	%>
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("아이디가  존재하지 않습니다.");
		history.back();
	</script>
	<%	
}
%>

</body>
</html>