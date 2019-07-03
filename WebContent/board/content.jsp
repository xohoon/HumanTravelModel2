<%@page import="board_re.Board_reDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="board_re.Board_reDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!--header-->
<jsp:include page="../inc/top.jsp"/>
<!--header-->
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div class="clear"></div>
<div id="sub_img_center"><img src="../images/p01.png" width="970.5" height="220"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="list.jsp">Korea Travel</a></li>
<li><a href="list.jsp">Foreigen Travel</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
int num =Integer.parseInt(request.getParameter("num"));
int pageNum;
int BackPageNum;
if(request.getParameter("pageNum") != null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}else{
	pageNum = 1;
}
int currentPage = pageNum;
int pageSize = 10;
int startRow = ((currentPage -1)*pageSize)+1;
int endRow = currentPage*pageSize;
%>
<jsp:useBean id="Bdto" class="board.BoardDTO" />
<jsp:setProperty property="*" name="Bdto"/>
<%
Bdto.setNum(num);

BoardDAO Bdao = new BoardDAO();
int count = Bdao.getBoardCount();

Bdao.updateReadCount(num);
Bdto = Bdao.getBoardContent(num);

%>
<article>
<h1>Page content</h1>
<table id="notice">
<tr>
	<td width="150">글번호</td>
	<td><%=Bdto.getNum() %></td>
	<td>조회수</td>
	<td><%=Bdto.getReadcount() %></td>
</tr>
<tr>
	<td>작성자</td>
	<td><%=Bdto.getBid() %></td>
	<td width="150">작성일</td>
	<td width="150"><%=Bdto.getDate() %></td>
</tr>
<tr>
	<td height="50">글제목</td>
	<td colspan="4"><%=Bdto.getSubject() %></td>

</tr>
<tr>
	<td>글내용</td>
	<td colspan="4" width="100" height="300"><%=Bdto.getContent() %></td>
</tr>
<tr>
	<td colspan="4">
	<input type="button" value="ReWrite" onclick="location.href='RewriteForm.jsp?re_ref=<%=Bdto.getRe_ref() %>&re_lev=<%=Bdto.getRe_lev() %>&re_seq=<%=Bdto.getRe_seq() %>&num=<%=Bdto.getNum()%>'" class="page">
	</td>
</tr>

<%
if(Bdto.getBid().equals(id)){
%>

<tr>
	<td colspan="4">
		<input type="button" value="Modify" onclick="location.href='updateForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'" class="page">
		<input type="button" value="Delete" onclick="location.href='deleteForm.jsp?num=<%=num %>&pageNum=<%=pageNum%>'" class="page">
	</td>
</tr>

<%
}

%>
</table>
<form action="rePro.jsp" method="post">

<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="re_ref" value="<%=Bdto.getRe_ref() %>">
<input type="hidden" name="re_lev" value="<%=Bdto.getRe_lev() %>">
<input type="hidden" name="re_seq" value="<%=Bdto.getRe_seq() %>">
<input type="hidden" name="num" value="<%=Bdto.getNum() %>">

	<table id="notice">
		<tr>
			<td>작성자</td>
			<td colspan="2">댓글내용</td>
		</tr>
		<tr>
			<td>
			<%=Bdto.getBid() %></td>
			<td><textarea name="content" rows="5" cols="60" class="textbox1"></textarea></td>
			<td colspan="2">
				<input type="submit" value="write" class="page">
			</td>
		</tr>

	</table>
</form>
<jsp:useBean id="Bdto_re" class="board_re.Board_reDTO" />
<jsp:setProperty property="*" name="Bdto_re" />
<table id="notice">
<tr>
	<td width="120">작성자</td>
	<td colspan="2">글내용</td>
</tr>
<%
Board_reDAO Bdao_re = new Board_reDAO();
ArrayList<Board_reDTO> Blist = null;

if(Bdto_re.getRe_seq() == 0 && Bdto_re.getRe_lev() == 0){
	Blist = Bdao_re.getBoardList(startRow, pageSize, Bdto.getNum());
			for(int i = 0; i < Blist.size(); i++){
				Bdto_re = Blist.get(i);
				if(Bdto_re.getNum() == Bdto.getNum()){
				%>
				<tr>
					<td><%=Bdto_re.getBid() %></td>
					<td><%=Bdto_re.getContent() %></td>
					<%
					if(Bdto_re.getBid().equals(id)){
						%>
						<td width="120">
						<input type="button" value="Delete" onclick="location.href='redeletePro.jsp?num=<%=num %>&pageNum=<%=pageNum%>&re_seq=<%=Bdto_re.getRe_seq() %>'" class="page">
						</td>
						<%
					}
					%>
				</tr>
				<%
			}
			}
		
}
%>
</table>


</article>
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!--footer-->
<jsp:include page="../inc/bottom.jsp"/>
<!--footer-->
</div>
</body>
</html>
