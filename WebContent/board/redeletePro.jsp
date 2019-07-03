<%@page import="board_re.Board_reDAO"%>
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
int re_seq = Integer.parseInt(request.getParameter("re_seq"));
int num =Integer.parseInt(request.getParameter("num"));
request.setCharacterEncoding("utf-8");
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="Bdto_re" class="board_re.Board_reDTO"/>
<jsp:setProperty property="*" name="Bdto_re"/>
<%
Board_reDAO Bdao = new Board_reDAO();
Bdao.deleteInfo(re_seq);
%>
	<script type="text/javascript">
		alert("글이 삭제되었습니다");
		location.href="content.jsp?num=<%=num %>&re_seq=0";
	</script>

</body>
</html>