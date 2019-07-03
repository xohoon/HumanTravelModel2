<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 - 목록</title>
<link href="../css/default.css?ver3" rel="stylesheet" type="text/css">
<link href="../css/subpage.css?ver3" rel="stylesheet" type="text/css">

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
String id = (String)session.getAttribute("id");
int pageNum;
BoardDAO Bdao = new BoardDAO();
int count = Bdao.getBoardCount();

if(request.getParameter("pageNum") != null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}else{
	pageNum = 1;
}
// 페이지 시작하는 행 번호 구하기 currentPage pageSize 조합계산식
int currentPage = pageNum;
int pageSize = 10;

int startRow = ((currentPage-1)*pageSize)+1;
//10으로 페이지를 나누어 1페이지 행번호 10
//				   2페이지 행번호 20
//				   3페이지 행번호 30
int endRow = currentPage*pageSize;
// 게시판 전체  글 중 최근글이 시작 정렬 re_ref 내림차순, re_seq 오름차순
// startRow 부터 pagesize만큼 가져오기 limit 시작행-1, 글개수
%>
<jsp:useBean id="Bdto" class="board.BoardDTO"/>
<jsp:setProperty property="*" name="Bdto"/>

<!-- 게시판 -->
<article>

<h1>Free Talk</h1>
<div id="table_search">
<input type="button" value="write" class="btn" onclick="location.href='write.jsp'">
</div>

<table id="notice">
	<tr>
  		<td width="50px">Num</td>
  		<td width="300px">Subject</td>
  		<td width="80px">Write ID</td>
  		<td width="80px">Date</td>
  		<td width="50px">Hit !</td>
  	</tr>
  		<%
ArrayList<BoardDTO> Blist = null;
if(count != 0 && Bdto.getRe_seq() == 0 && Bdto.getRe_lev() == 0){
Blist = Bdao.getBoardList(startRow, pageSize);
  		for(int i = 0; i < Blist.size(); i++){
  			Bdto = Blist.get(i);
  			 %>
  <tr>
  		<td><%=Bdto.getNum() %></td>
  		<td>
  		<%
  		//답글이면
  		int wid = 0;
  		if(Bdto.getRe_lev() != wid){
  			wid = Bdto.getRe_lev()*10;
  			// 이미지 너비 레벨 1 10px 에벨 20px 계산식
  		%>
  		<img src="level.gif" width="<%=wid %>">
  		<img src="re03.png">
  		<%
  		}
  		
  		%>
  		<a href="content.jsp?num=<%=Bdto.getNum() %>&pageNum=<%=pageNum %>"><%=Bdto.getSubject() %></a></td>
  		<td><%=Bdto.getBid() %></td>
  		<td><%=Bdto.getDate() %></td>
  		<td><%=Bdto.getReadcount() %></td>
  </tr>
<%
		}
	}
  
%>

</table>

<%
// 전체 페이지 수 구하기 (글 50/ 한 페이지에 10개씩 출력 -> 5) 5+0
//					(글 56/ 한 페이지에 10개씩 출력 -> 6) 5+1
int pageCount = (count%pageSize == 0)? count/pageSize : count/pageSize+1;
// 한화면에 보여줄 페이지 개수 설정\
int pageBlock = 3;
// 시작 페이지 번호 1-10 ->1 
// 				11-20 ->2
int startNum = (currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
int endNum = startNum+pageBlock-1;
// 이전
%>
<div id="page_control">
<%
if(startNum != 1){
%>
<input type="button" value="Prev" onclick="location.href='list.jsp?pageNum=<%=startNum-1%>'" class="page">
<%
}
// 1-10
if(endNum > pageCount){
	endNum = pageCount;
}
for(int i = startNum; i <= endNum; i++){
	%>
	<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
	<%
}
// 다음
if(endNum < pageCount){
%>
<input type="button" value="Next" onclick="location.href='list.jsp?pageNum=<%=endNum+1%>'" class="page">
<%
}
%>
<form action="search.jsp" method="post">
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</div>
</form>
</div>

</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!--footer-->
<jsp:include page="../inc/bottom.jsp"/>
<!--footer-->
</div>
</body>
</html>

