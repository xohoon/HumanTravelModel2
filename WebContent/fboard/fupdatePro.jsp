
<%@page import="fboard.BoardDAO"%>
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
int result = 0;
int num =Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="Bdto" class="fboard.BoardDTO"/>
<jsp:setProperty property="*" name="Bdto" />
<%
BoardDAO Bdao = new BoardDAO();
Bdao.updateInfo(Bdto.getContent(), Bdto.getSubject(), num);
result = Bdao.userCheck(Bdto.getPw(), num);

if(result == 1){
	%>
	<script type="text/javascript">
		alert("수정이 완료되었습니다");
		location.href="fcontent.jsp?num=<%=Bdto.getNum() %>&pageNum=<%=pageNum %>";
	</script>
	 <%
}else if(result == 0){
%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다");
	history.back();
</script>
<%
}
%>



</body>
</html>