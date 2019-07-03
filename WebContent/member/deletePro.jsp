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
String id = (String)session.getAttribute("id");
String pw = request.getParameter("pw");
%>
<jsp:useBean id="mdto" class="member.MemberDTO" />
<jsp:setProperty property="*" name="mdto" />
<%
MemberDAO mdao = new MemberDAO();
mdto.setId(id);
mdto.setPw(pw);

int check = mdao.userCheck(id, pw);

if(check == 1){
	mdao.deleteMember(id);
	session.invalidate();
	%>
	<script type="text/javascript">
			alert("정상적으로 탈퇴되었습니다.");
			location.href="../main/main.jsp";
	</script>
	<%
}else if(check == 0){
	%>
		<script type="text/javascript">
				alert("비밀번호가 틀렸습니다.");
				history.back();
		</script>
		<%
}else if(check == -1){
	%>
	<script type="text/javascript">
			alert("아이디가 존재하지 않습니다.");
			history.back();
	</script>
	<%
}

%>

</body>
</html>