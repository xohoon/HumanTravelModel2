<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div class="clear"></div>
<div id="sub_img_center"><img src="../images/p07.png" width="970.5" height="220"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../member/memberinfo.jsp">회원정보</a></li>
<li><a href="../member/modifyForm.jsp">정보수정</a></li>
<li><a href="../member/deleteForm.jsp">회원탈퇴</a></li>
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("login.jsp");
}else if(id.equals("admin")){
	%>
	<li><a href="../member/list.jsp">회원목록</a></li>
	<%
}
%>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->

<jsp:useBean id="mdto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<%
MemberDAO mdao = new MemberDAO();
mdto = mdao.getMember(id);
%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<article>

<form action="modifyPro.jsp" method="post" id="join">
	<fieldset>
	<legend><h1>Modify Info</h1></legend>
		<label>User ID</label>
			<input type="text" name="id" value="<%=id %>" class="id" readonly="readonly"><br />
		<label>Name</label>
			<input type="text" value="<%=mdto.getName() %>" name="name" readonly="readonly"><br />
		<label>PW</label>
			<input type="password" name="pw" placeholder="비밀번호"><br />
		<label>Birth</label>
			<input type="text" name="birth" placeholder="생년월일"><br />
		<label>Phone Number</label>
			<input type="text" name="phone" placeholder="전화"><br />
		<label>E-Mail</label>
			<input type="email" name="mail" placeholder="이메일"><br />
		<label>Address</label>
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="dup"><br/>
		<label></label>
			<input type="text" id="sample6_address" placeholder="주소" name="address">
			<input type="text" id="sample6_address2" placeholder="상세주소"><br />
		<label>Want Travel</label>
			<input type="text" name="likeM" placeholder="원하는 여행"><br />
		<label>Best Travel</label>
			<input type="text" name="likeS" placeholder="최고의 여행"><br />
		<label>Hobby</label>
			<input type="text" name="hobby" placeholder="취미"><br />
		<label>Job</label>
			<input type="text" name="job" placeholder="직업"><br />
		<label>Gender</label>
			Man <input type="radio" name="gender" value="man">
			Woman <input type="radio" name="gender" value="woman"><br />
	</fieldset>
	<div class="clear"></div>
	<div id="buttons">
	<input type="submit" value="수정완료" class="submit">
	<input type="reset" value="다시쓰기" class="cancel">
	</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>