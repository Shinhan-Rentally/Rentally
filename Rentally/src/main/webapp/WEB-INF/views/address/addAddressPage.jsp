<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:set var="path"  value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    /* 모달 스타일 */
    #editModal {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1000;
        background-color: white;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }
    #modalOverlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 999;
    }
</style>

</head>
<body>
	<form action="${path}/address/add" method="post">
		<input type="text" id="postcode" name="postcode" placeholder="우편번호">
		<input type="button" onclick="findPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="address" name="address" placeholder="주소"><br>
		<input type="text" id="detailAddress" name="detailAddress"	placeholder="상세주소"> 
		<input type="text" id="extraAddress"	name="extraAddress" placeholder="참고항목"> 
		<input type="text" id="recipName" name="recipName" placeholder="받는이"> 
		<input type="text" id="recipPhone" name="recipPhone" placeholder="연락처">
		<label> 
		<input	type="checkbox" id="addrDefault" name="addrDefault">기본 주소로 설정
		</label> 
		<br>
		<button id="saveAddress" type="submit">저장하기</button>
	</form>

	<!-- 모달 오버레이 -->
	<div id="modalOverlay" onclick="closeModal()"></div>

	<!-- 수정 모달 -->
	<div id="editModal">
	
    <h3>주소 수정</h3>
    <form id="editForm" method="post">
        <input type="hidden" id="editAddrSeq" name="addrSeq">
        <label>우편번호: <input type="text" id=editPostcode name="postcode" placeholder="우편번호"></label>
        <input type="button" onclick="findPostcode()" value="우편번호 찾기">
        <br>
        <label>주소: <input type="text" id="editAddress" name="address"></label><br>
        <label>상세주소: <input type="text" id="editDetailAddress" name="detailAddress" placeholder="상세주소"></label><br>
        <label>받는이: <input type="text" id="editRecipName" name="recipName" placeholder="받는이"></label><br>
        <label>연락처: <input type="text" id="editRecipPhone" name="recipPhone" placeholder="연락처"></label><br>
        <label>기본 주소로 설정: <input type="checkbox" id="editAddrDefault" name="addrDefault"></label><br>
        <button type="button" id = "updateAddress">수정 완료!!!</button>
        <button type="button" onclick="closeModal()">닫기</button>
    </form>
	</div>
	
	
	<h1>고객 ID: ${custSeq} - 주소 목록</h1>
	<form id="delete" action="delete" method="post">
		<table border="1">
			<thead>
				<tr>
					<th>선택</th>
					<th>주소 번호</th>
					<th>받는이</th>
					<th>연락처</th>
					<th>주소</th>
					<th>상세 주소</th>
					<th>기본 주소 여부</th>
			
				</tr>
			</thead>
			<tbody>
				<c:forEach var="address" items="${addressList}">
					<tr>
						<td><input type="radio" name="selectedAddress" value="${address.addr_seq}"></td>
						<td>${address.addr_seq}</td>
						<td>${address.addr_name}</td>
						<td>${address.addr_phone}</td>
						<td>${address.addr_title}</td>
						<td>${address.addr_detail}</td>
						<td>${address.addr_default}</td>
						<td>
							<a href="goUpdate" >수정</a>
						</td>
						<td>
							<button type="button" onclick="updateModal('${address.addr_seq}', '${address.addr_title}', '${address.addr_name}', '${address.addr_phone}', '${address.addr_detail}', '${address.addr_default}')">수정</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<button type="button" onclick="confirmDeletion()">선택한 주소 삭제</button>
		
	</form>
		

	<!-- 카카오 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- JS 함수 -->
	<script>
	
	// 주소 수정 숫자 유효성 검사
	$("#editRecipPhone").on("input", function(){
		let value = $("#editRecipPhone").val().replace(/\D/g, '');
	    if (value.length <= 3) {
	    	$("#editRecipPhone").val(value);
	    } else if (value.length <= 7) {
	    	$("#editRecipPhone").val(value.slice(0, 3) + '-' + value.slice(3));
	    } else {
	    	$("#editRecipPhone").val(value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11));
	    }
	});
	
	// 주소 등록 숫자 유효성 검사
	$("#recipPhone").on("input", function(){
		let value = $("#recipPhone").val().replace(/\D/g, '');
	    if (value.length <= 3) {
	    	$("#recipPhone").val(value);
	    } else if (value.length <= 7) {
	    	$("#recipPhone").val(value.slice(0, 3) + '-' + value.slice(3));
	    } else {
	    	$("#recipPhone").val(value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11));
	    }
	});
	
	// 모달 열기
	function updateModal(seq, title, name, phone, address, isDefault) {
		
		// addr_title에서 5자리 숫자 추출
		
		// 숫자 5자리 매칭
		const postcodeMatch = address.match(/\d{5}/); 
		// 매칭된 값이 없으면 빈 문자열
		const postcode = postcodeMatch ? postcodeMatch[0] : ''; 
		console.log(postcode);
		
	    document.getElementById('editAddrSeq').value = seq;
	 	// 추출된 postcode 값을 저장
	    document.getElementById('editPostcode').value = postcode;  
	    document.getElementById('editAddress').value = title;
	    document.getElementById('editDetailAddress').value = address;
	    document.getElementById('editRecipName').value = name;
	    document.getElementById('editRecipPhone').value = phone;
	    document.getElementById('editAddrDefault').checked = isDefault === 'true';
	
	    console.log(`Extracted postcode: ${postcode}`);
	    console.log(seq, title, name, phone, address, isDefault);
	    
	    document.getElementById('editModal').style.display = 'block';
	    document.getElementById('modalOverlay').style.display = 'block';
	}
	
	

	// 모달 닫기
	function closeModal() {
	    document.getElementById('editModal').style.display = 'none';
	    document.getElementById('modalOverlay').style.display = 'none';
	}
	
	// jQuery 코드
    $('#updateAddress').on("click", function (event) {
        event.preventDefault(); // 기본 폼 제출 동작 방지

        // 필요한 데이터 수집
        const addrSeq = $('#editAddrSeq').val();
        const postcode = $('#editPostcode').val();
        const address = $('#editAddress').val();
        const detailAddress = $('#editDetailAddress').val();
        const recipName = $('#editRecipName').val();
        const recipPhone = $('#editRecipPhone').val();
        const addrDefault = $('#editAddrDefault').is(':checked');


        var data = {
                "addr_title":address,
                "addr_detail": `\${detailAddress}( \${postcode})`,
                "addr_name":recipName,
                "addr_phone":recipPhone,
               "addr_default": addrDefault,              
                "addr_seq":addrSeq
            };
        console.log(data);
        // AJAX 요청
        $.ajax({
            url: "${path}/address/update", // 서버의 업데이트 엔드포인트
            type: "POST",
            data: data,
            success: function (response) {
                // 성공 응답 처리
                if (response.status === "success") {
                    alert(response.message);
                    location.reload(); // 페이지 새로고침
                } else {
                    alert(response.message);
                }
            },
            error: function (xhr, status, error) {
                // 실패 응답 처리
                console.error("Error:", error);
                alert("주소 수정 중 오류가 발생했습니다.");
            }
        });
    });
	
	// 주소 등록 Jquery
	$('saveAddress').on("submit", function (event) {
    event.preventDefault();

    const formData = $(this).serialize();

    $.ajax({
        url: "${path}/address/add",
        type: "POST",
        data: formData,
        success: function (response) {
            if (response.status === "error") {
                alert(response.message);
            } else if (response.status === "success") {
                alert(response.message);
                location.reload(); // 페이지 새로고침
            }
        },
        error: function (xhr, status, error) {
            console.error("Error:", error);
            alert("주소 저장 중 오류가 발생했습니다.");
        }
    });
});
	
	
		//선택한 주소 삭제
		function confirmDeletion() {
			const selected = document.querySelector('input[name="selectedAddress"]:checked');
			if (selected) {
				if (confirm("선택한 주소를 삭제하시겠습니까?")) {
					document.getElementById("delete").submit();
				}
			} else {
				alert("삭제할 주소를 선택해주세요.");
			}
		}
		
		
		// 우편 번호 및 주소값 조회
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
							document.getElementById('editPostcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							document.getElementById("editAddress").value = addr;
							document.getElementById("detailAddress").focus();
							
						}
					}).open();
		}
	</script>
</body>
</html>