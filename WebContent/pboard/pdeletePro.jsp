
<%@page import="pboard.BoardDAO"%>
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
int result;
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="Bdto" class="pboard.BoardDTO"/>
<jsp:setProperty property="*" name="Bdto"/>
<%
BoardDAO Bdao = new BoardDAO();
result = Bdao.userCheck(Bdto.getPw(), num);
if(result == 1){
Bdao.deleteInfo(num);
%>
	<script type="text/javascript">
		alert("글이 삭제되었습니다");
		location.href="plist.jsp";
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







