<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join | 회원가입</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function idcheck(){
		var fid = document.fr.id.value;
		if(fid == ""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return false;
		}
		window.open("join_idcheck.jsp?userid="+fid, "", "width=400", "height=600");
	}
</script>
</head>
<body>


<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_center"><img src="../images/p06.png" width="970.5" height="220"></div>

<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->


<nav id="sub_menu">
<ul>
<li><a href="login.jsp">Login</a></li>
<li><a href="join.jsp">Join Us</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<script type="text/javascript">
function check(){
	if(document.fr.id.value==""){
		alert("아이디를 입력하세요 :)");
		document.fr.id.focus();
		return false;
	}
	if(document.fr.pw.value.length==0){
		alert("비밀번호를 입력하세요 :)");
		document.fr.pw.focus();
		return false;
		}
	if(document.fr.pw.value != document.fr.repw.value){
		alert("비밀번호가 일치하지 않습니다");
		document.fr.pw.focus();
		return false;
		}		
	if(document.fr.name.value==""){
		alert("이름을 입력하세요");
		document.fr.name.focus();
		return false;
	}
}
</script>

<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" method="post" name="fr" onsubmit="return check()">
	<fieldset>
	<legend>Basic Info</legend>
		<label>User ID</label>
			<input type="text" name="id" class="id" placeholder="아이디" name="fr">
			<input type="button" value="중복확인" class="dup" onclick="idcheck()"><br />
		<label>PW</label>
			<input type="password" name="pw" placeholder="비밀번호"><br />
		<label>Retype PW</label>
			<input type="password" name="repw" placeholder="비밀번호 확인"><br />
		<label>Name</label>
			<input type="text" name="name" placeholder="이름"><br />
		<label>Birth</label>
			<input type="text" name="birth" placeholder="생년월일"><br />
		<label>Phone Number</label>
			<input type="text" name="phone" placeholder="전화"><br />
		<label>E-Mail</label>
			<input type="email" name="mail" placeholder="이메일"><br />
		<label>Address</label>
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="dup"><br>
		<label></label>
			<input type="text" id="sample6_address" placeholder="주소" name="address">
			<input type="text" id="sample6_address2" placeholder="상세주소">
			<!-- 다음 우편번호 검색해서 사용 -->
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
	</fieldset>
	
	<fieldset>
		<legend>Optional</legend>
		<label>Want Travel</label>
			<input type="text" name="likeM" placeholder="원하는 여행"><br />
		<label>Best Travel</label>
			<input type="text" name="likeS" placeholder="인생 여행"><br />
		<label>Hobby</label>
			<input type="text" name="hobby" placeholder="취미"><br />
		<label>Gender</label>
			Man <input type="radio" name="gender" value="man">
			Woman <input type="radio" name="gender" value="woman"><br />
	</fieldset>
	<div class="clear"></div>
	<div id="buttons">
	<input type="submit" value="회원가입" class="submit">
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