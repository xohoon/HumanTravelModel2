<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Human Travel</title>
<link href="../css/default.css?ver2" rel="stylesheet" type="text/css">
<link href="../css/front.css?ver2" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!--header-->
<jsp:include page="../inc/top.jsp"/>
<!--header-->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/mainP01.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->

<%
String id = (String)session.getAttribute("id");
int pageNum;

if(request.getParameter("pageNum") != null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}else{
	pageNum = 1;
}
int pageSize = 5;
int startRow = 1;
%>

<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>여행 후기 올립니다 ~</h3>
<p>블라블라블라 여기 이렇고 이래서 좋고 저래서 좋고 그래서 좋았고 난 여기고 저기고 이래저래ㅁㄴㅇ</p>
</div>
<div id="security">
<h3>여행 후기 올립니다 ~22222</h3>
<p>블라블라블라 여기 이렇고 이래서 좋고 저래서 좋고 그래서 좋았고 난 여기고 저기고 이래저래ㅁㄴㅇ</p>
</div>
<div id="payment">
<h3>여행 후기 올립니다 ~33333</h3>
<p>블라블라블라 여기 이렇고 이래서 좋고 저래서 좋고 그래서 좋았고 난 여기고 저기고 이래저래ㅁㄴㅇ</p>
</div>
</div>

<div class="clear"></div>

<jsp:useBean id="fBdto" class="fboard.BoardDTO" />
<jsp:setProperty property="*" name="fBdto"/>
<%
BoardDAO fBdao = new BoardDAO();
%>
<div id="sec_news">
<h3><span class="orange">Gallery</span> Review</h3>

</div>


<jsp:useBean id="Bdto" class="board.BoardDTO"/>
<jsp:setProperty property="*" name="Bdto"/>
<%
BoardDAO Bdao = new BoardDAO();
%>
<div id="news_notice">
<h3 class="brown">Travel Board</h3>
<table>
<%
ArrayList<BoardDTO> Blist = null;
if(Bdto.getRe_seq() == 0 && Bdto.getRe_lev() == 0){
Blist = Bdao.getBoardList(startRow, pageSize);
  		for(int i = 0; i < Blist.size(); i++){
  			Bdto = Blist.get(i);
%>
<tr><td class="contxt"><a href="../board/list.jsp"><%=Bdto.getSubject() %></a></td>
    <td><%=Bdto.getDate() %></td></tr>
<%
  		}
}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!--footer-->
<jsp:include page="../inc/bottom.jsp"/>
<!--footer-->
</div>
</body>
</html>