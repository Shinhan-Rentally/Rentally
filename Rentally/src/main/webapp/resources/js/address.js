const path = document.body.getAttribute('data-path');
if (!path) {
    console.error("Path is not defined. Please check your JSP configuration.");
}

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
	
	// 수정 모달 열기
	function updateModal(seq, title, name, phone, address, isDefault) {
        const postcodeMatch = address.match(/\d{5}/);
        const postcode = postcodeMatch ? postcodeMatch[0] : ' ';
        console.log(postcode);
        
        const modalElement = document.getElementById('editAddressModal');
        
        document.getElementById('editAddrSeq').value = seq;
        document.getElementById('editPostcode').value = postcode;
        document.getElementById('editAddress').value = title;
        document.getElementById('editDetailAddress').value = address;
        document.getElementById('editRecipName').value = name;
        document.getElementById('editRecipPhone').value = phone;
        document.getElementById('editAddrDefault').checked = isDefault === 'true';
		
    	 // Bootstrap 모달 열기
        const modalInstance = new bootstrap.Modal(modalElement);
        modalInstance.show();
        
    }
	
	// 모달 닫기
	function closeModal() {
		// 모달 요소 가져오기
	    const modalElement = document.getElementById('editAddressModal');
	    const modalInstance = bootstrap.Modal.getInstance(modalElement);
	    
	    // Bootstrap 모달 인스턴스가 있으면 닫기
	    if (modalInstance) {
	        modalInstance.hide();
	    }

	    // 강제로 백드롭 제거
	    document.querySelectorAll('.modal-backdrop').forEach((backdrop) => backdrop.remove());

	    // 모달 스타일 강제 초기화
	    modalElement.style.display = 'none';
	    modalElement.classList.remove('show');

	    // 페이지 스크롤 복원
	    document.body.classList.remove('modal-open');
	    document.body.style.overflow = 'auto';
	    document.body.style.paddingRight = '0';
	}
	
	// 주소 수정 코드
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
                "addr_detail": `${detailAddress}( ${postcode})`,
                "addr_name":recipName,
                "addr_phone":recipPhone,
               "addr_default": addrDefault,              
                "addr_seq":addrSeq
            };
        console.log(data);
        // AJAX 요청
        $.ajax({
            url: `${path}/address/update`, // 서버의 업데이트 엔드포인트
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
	
	// 기본 주소 설정
	function setDefault(addrSeq) {
	 
	    $.ajax({
	        url: `${path}/address/setDefault`,
	        type: 'POST',
	        data: { addrSeq: addrSeq },
	        success: function(data) {
	            if (data.status === 'success') {
	                alert(data.message);
	                location.reload(); // 페이지 새로고침
	            } else {
	                alert(data.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	            alert('기본 주소 설정 중 오류가 발생했습니다.');
	        }
	    });
	}
	
	// 주소 등록 Jquery
	$('#saveAddress').on("click", function (event) {
    event.preventDefault();
 
    const formData = $('#addAddressModal').find('input, select').serialize();

    $.ajax({
        url: `${path}/address/add`,
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
	
	// 주소 삭제
	$(document).on("click", ".delete-address-btn", function (event) {
    event.preventDefault(); // 기본 동작 방지
	
	 
    const addrSeq = $(this).data("addr-seq"); // data-addr-seq 속성에서 addr_seq 값 가져오기

    if (!addrSeq) {
        alert("주소 식별자가 유효하지 않습니다.");
        return;
    }
    
    if (confirm("정말로 이 주소를 삭제하시겠습니까?")) {
        $.ajax({
            url: `${path}/address/delete`, // 서버의 삭제 엔드포인트
            type: "POST",
            data: { addrSeq: addrSeq },
            success: function (response) {
                if (response && response.status === "success") {
                    alert(response.message);
                    location.reload(); // 페이지 새로고침
                } else {
                    alert(response?.message || "삭제 중 오류가 발생했습니다.");
                }
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("주소 삭제 중 오류가 발생했습니다.");
            }
        });
    }
});
	
	
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

							 const postcodeElem = document.getElementById("postcode");
					            if (postcodeElem) {
					                postcodeElem.value = data.zonecode;
					            }

					            const editPostcodeElem = document.getElementById("editPostcode");
					            if (editPostcodeElem) {
					                editPostcodeElem.value = data.zonecode;
					            }

					            const addressElem = document.getElementById("address");
					            if (addressElem) {
					                addressElem.value = addr;
					            }

					            const editAddressElem = document.getElementById("editAddress");
					            if (editAddressElem) {
					                editAddressElem.value = addr;
					            }

					            const detailAddressElem = document.getElementById("detailAddress");
					            if (detailAddressElem) {
					                detailAddressElem.focus();
					            }
							
						}
					}).open();
		}