
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="fboard.BoardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.websocket.SendResult"%>
<%@page import="fboard.BoardDAO"%>
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
String id = (String)session.getAttribute("id");
if(id == null){
	%>
	<script type="text/javascript">
		alert("로그인 후 이용해주세요");
		location.href="../member/login.jsp";
	</script>	
	<%
}
String filePath = request.getRealPath("/fileUploadF");
System.out.println(filePath);
int maxSize = 10*1024*1024;
MultipartRequest mpr = new MultipartRequest(request, filePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

BoardDTO Bdto = new BoardDTO();
Bdto.setContent(mpr.getParameter("content"));
Bdto.setBid(mpr.getParameter("bid"));
Bdto.setName(mpr.getParameter("name"));
Bdto.setSubject(mpr.getParameter("subject"));
Bdto.setPw(mpr.getParameter("pw"));
// upload 폴더에 업로드된 파일 이름 가져오기
Bdto.setFile(mpr.getFilesystemName("file"));

BoardDAO Bdao = new BoardDAO();
Bdao.insertBoard(Bdto);

response.sendRedirect("flist.jsp");

%>


</body>
</html>