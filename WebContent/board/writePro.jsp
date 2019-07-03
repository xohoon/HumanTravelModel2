
<%@page import="javax.websocket.SendResult"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
if(session.getAttribute("id") == null){
	%>
	<script type="text/javascript">
		alert("로그인 후 이용해주세요");
		location.href="../member/login.jsp";
	</script>	
	<%
}
%>
<jsp:useBean id="Bdto" class="board.BoardDTO" />
<jsp:setProperty property="*" name="Bdto"/>
<%
request.setCharacterEncoding("utf-8");

// BoardDTO Bdto = new BoardDTO();

BoardDAO Bdao = new BoardDAO();
Bdao.insertBoard(Bdto);

response.sendRedirect("list.jsp");

%>

</body>
</html>