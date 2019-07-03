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
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String content = request.getParameter("content");
int re_ref = Integer.parseInt(request.getParameter("re_ref"));
int re_lev = Integer.parseInt(request.getParameter("re_lev"));
int re_seq = Integer.parseInt(request.getParameter("re_seq"));
int num = Integer.parseInt(request.getParameter("num"));

%>
<jsp:useBean id="Bdto" class="board_re.Board_reDTO" />
<jsp:setProperty property="*" name="Bdto" />
<%
Bdto.setRe_ref(re_ref);
Bdto.setRe_lev(re_lev);
Bdto.setRe_seq(re_seq);
Bdto.setBid(id);
Bdto.setNum(num);
Bdto.setContent(content);

Board_reDAO Bdao = new Board_reDAO();
Bdao.insertBoard(Bdto);
%>
<script type="text/javascript">
 	alert("댓글이 등록되었습니다");
 	location.href="content.jsp?num=<%=num %>&re_seq=0";
</script>

</body>
</html>