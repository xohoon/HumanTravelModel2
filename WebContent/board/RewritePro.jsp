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

int re_ref = Integer.parseInt(request.getParameter("re_ref"));
int re_lev = Integer.parseInt(request.getParameter("re_lev"));
int re_seq = Integer.parseInt(request.getParameter("re_seq"));
int num = Integer.parseInt(request.getParameter("num"));

%>
<jsp:useBean id="Bdto" class="board.BoardDTO" />
<jsp:setProperty property="*" name="Bdto" />
<%
Bdto.setRe_lev(re_lev);
Bdto.setRe_ref(re_ref);
Bdto.setRe_seq(re_seq);
Bdto.setNum(num);
BoardDAO Bdao = new BoardDAO();
Bdao.ReinsertBoard(Bdto);
response.sendRedirect("list.jsp");
%>
<script type="text/javascript">
 	alert("sdf");
 	location.href="content.jsp?num=<%=num %>&re_seq=0";
</script>


</body>
</html>