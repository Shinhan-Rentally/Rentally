<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
</head>
<body>
	<form action="saveAddress" method="post">
		<input type="text" id="postcode" name="postcode" placeholder="우편번호">
		<input type="button" onclick="findPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" name="address" placeholder="주소"><br>
		<input type="text" id="detailAddress" name="detailAddress"
			placeholder="상세주소"> <input type="text" id="extraAddress"
			name="extraAddress" placeholder="참고항목"> <input type="text"
			id="recipName" name="recipName" placeholder="받는이"> <input
			type="text" id="recipPhone" name="recipPhone" placeholder="연락처">
		<br> <input type="text" id="addressTitle" name="addressTitle"
			placeholder="배송지명"> <br> <label> <input
			type="checkbox" id="addrDefault" name="addrDefault">기본 주소로 설정
		</label> <br>
		<button type="submit">저장하기</button>
	</form>


	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function findPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}

							// 참고항목 조합
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							if (data.userSelectedType === 'R') {
								if (data.bname !== ' '
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ' '
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== ' ' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== ' ') {
									extraAddr = ' (' + extraAddr + ')';
								}
								document.getElementById("extraAddress").value = extraAddr;
							} else {
								document.getElementById("extraAddress").value = '';
							}

							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							document.getElementById("detailAddress").focus();
						}
					}).open();
		}
	</script>
</body>
</html>