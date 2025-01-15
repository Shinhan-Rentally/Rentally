// jsp에서의 데이터 받을 수 있는 연결 패스
const path = document.body.getAttribute('data-path');
if (!path) {
    console.error("Path is not defined. Please check your JSP configuration.");
}

	// 주소 수정 숫자 유효성 검사
	$("#editRecipPhone").on("input", function () {
    const value = $(this).val().replace(/\D/g, ''); // 숫자만 유지
    let formattedValue = "";

    if (value.startsWith("02")) {
        // 02로 시작하는 경우: 02-0000-0000
        if (value.length <= 2) {
            formattedValue = value;
        } else if (value.length <= 6) {
            formattedValue = value.slice(0, 2) + "-" + value.slice(2);
        } else {
            formattedValue = value.slice(0, 2) + "-" + value.slice(2, 6) + "-" + value.slice(6, 10);
        }
    } else if (value.startsWith("010")) {
        // 010으로 시작하는 경우: 010-0000-0000
        if (value.length <= 3) {
            formattedValue = value;
        } else if (value.length <= 7) {
            formattedValue = value.slice(0, 3) + "-" + value.slice(3);
        } else {
            formattedValue = value.slice(0, 3) + "-" + value.slice(3, 7) + "-" + value.slice(7, 11);
        }
    } else {
        // 그 외의 경우는 숫자만 유지
        formattedValue = value.slice(0, 11);
    }

    $(this).val(formattedValue); // 입력 필드에 반영
});
	
	// 주소 등록 숫자 유효성 검사
	$("#recipPhone").on("input", function () {
    let value = $(this).val().replace(/\D/g, ''); // 숫자만 남기기

    // 유효성 검사: 숫자만 입력되었는지 확인
    if (!/^\d*$/.test(value)) {
        alert("전화번호는 숫자만 입력 가능합니다."); // 경고 메시지
        $(this).val(""); // 필드 초기화
        return;
    }

    // 최소 자리수 확인
    if (value.length < 2) {
        $(this).val(value); // 최소 2자리 미만일 경우 그대로 유지
        return;
    }

    // 전화번호 형식 지정
    let formattedValue = "";

    if (value.startsWith("02")) {
        // 02로 시작하는 경우: 02-0000-0000
        if (value.length <= 2) {
            formattedValue = value; // 02까지만 입력
        } else if (value.length <= 6) {
            formattedValue = value.slice(0, 2) + "-" + value.slice(2); // 02-0000
        } else if (value.length <= 10) {
            formattedValue =
                value.slice(0, 2) +
                "-" +
                value.slice(2, 6) +
                "-" +
                value.slice(6); // 02-0000-0000
        } else {
            formattedValue =
                value.slice(0, 2) +
                "-" +
                value.slice(2, 6) +
                "-" +
                value.slice(6, 10); // 최대 10자리까지 허용
        }
    } else if (value.startsWith("010")) {
        // 010으로 시작하는 경우: 010-0000-0000
        if (value.length <= 3) {
            formattedValue = value; // 010까지만 입력
        } else if (value.length <= 7) {
            formattedValue = value.slice(0, 3) + "-" + value.slice(3); // 010-0000
        } else if (value.length <= 11) {
            formattedValue =
                value.slice(0, 3) +
                "-" +
                value.slice(3, 7) +
                "-" +
                value.slice(7); // 010-0000-0000
        } else {
            formattedValue =
                value.slice(0, 3) +
                "-" +
                value.slice(3, 7) +
                "-" +
                value.slice(7, 11); // 최대 11자리까지 허용
        }
    } else {
        // 다른 경우: 숫자만 출력 (최소 자리수 제한 적용)
        formattedValue = value.slice(0, 11); // 최대 11자리 제한
    }

    $(this).val(formattedValue); // 입력 필드에 결과 반영
     
});
	
	
	
	// 수정 모달 열기
	function updateModal(seq, title, name, phone, address, isDefault) {
        const postcodeMatch = address.match(/\d{5}/);
        const postcode = postcodeMatch ? postcodeMatch[0] : ' ';
        
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
	
	// 모달 초기화 코드 추가
	$('#addAddressModal').on('hidden.bs.modal', function () {
    	// 모든 입력 필드 초기화
    	$(this).find('input[type="text"], input[type="tel"], textarea').val('');
    	$(this).find('input[type="checkbox"]').prop('checked', false);
	});
	
	// 모달창 위치 조정
	$(document).ready(function () {
   
    // 모달이 열리기 전에 위치 지정
    $('#alertModal').on('show.bs.modal', function () {
        $(this).find('.modal-dialog').css({
            'transform': 'translate(0, 250px)', // Y축 150px 아래로 이동
            'transition': 'none' // 애니메이션 제거
        });
    });

    // 모달이 완전히 열린 후 다시 애니메이션 설정
    $('#alertModal').on('shown.bs.modal', function () {
        	$(this).find('.modal-dialog').css({
            	'transition': '' // 기본 애니메이션 복원
        	});
    	});
	});

	
	
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
		
		const cleanedDetailAddress = detailAddress.replace(/\(\d{5}\)/, '').trim();

        var data = {
                "addr_title":address,
                "addr_detail": `${cleanedDetailAddress}(${postcode})`,
                "addr_name":recipName,
                "addr_phone":recipPhone,
               "addr_default": addrDefault,              
                "addr_seq":addrSeq,
                "postcode": postcode
            };
 
        // AJAX 요청
        $.ajax({
            url: `${path}/address/update`, // 서버의 업데이트 엔드포인트
            type: "POST",
            data: data,
            success: function (response) {
            
                // 성공 응답 처리
                if (response.status === "success") {
                
                // HTML에서 editAddressModal가져오고  bootstrap 모달 안에 넣기
                const modalElement = document.getElementById('editAddressModal');
                let editAddressModal = bootstrap.Modal.getInstance(modalElement);

                if (!editAddressModal) {
                    editAddressModal = new bootstrap.Modal(modalElement);
                }

                // 주소 수정 모달 닫기
                if (editAddressModal) {
                    editAddressModal.hide();

                    // 수정 완료 모달은 주소 수정 모달이 완전히 닫힌 후에 띄움
                    modalElement.addEventListener('hidden.bs.modal', function () {
                        showModalMessage(response.message);
                    }, { once: true });
                }
               	
               	// alertModal 닫힐 때 페이지 새로고침
                $('#alertModal').on('hidden.bs.modal', function () {
                    location.reload(); // 페이지 새로고침
                });
                    
                } else {
                
                	// 모달창으로 오류 메시지 표시
                    showModalMessage(response.message); 
                }
            },
            error: function (xhr, status, error) {
                
                // 오류 메시지 표시
                showModalMessage("주소 수정 중 오류가 발생했습니다."); 
            }
        });
    });
    
    // 수정 완료 모달 표시
    function showModalMessage(message) {
    	const modalElement = document.getElementById('alertModal');
    	const modalInstance = new bootstrap.Modal(modalElement);

    	// 메시지 설정
    	document.getElementById('alertModalMessage').innerHTML = message;

    	// 수정 완료 모달 표시
    	modalInstance.show();
	}
	
	// 기본 주소 설정
	function setDefault(addrSeq) {
	 
	    $.ajax({
	        url: `${path}/address/setDefault`,
	        type: 'POST',
	        data: { addrSeq: addrSeq },
	        success: function(data) {
	            if (data.status === 'success') {
	                // 성공 메시지를 알림 모달로 표시
                	showModalMessage(data.message);
                
	                // 모달 닫힌 후 페이지 새로고침
                	$('#alertModal').on('hidden.bs.modal', function () {
                    location.reload(); // 페이지 새로고침
                });
	            } else {
	               	// 실패 메시지를 알림 모달로 표시
               		showModalMessage(data.message);
	            }
	        },
	        error: function(xhr, status, error) {
	         	// 오류 메시지를 알림 모달로 표시
            	showModalMessage("기본 주소 설정 중 오류가 발생했습니다.");
	        }
	    });
	}
	
	// 주소 등록 Jquery
	$('#saveAddress').on("click", function (event) {
    	event.preventDefault();
 		
 		// 필수값 확인
    	const postcode = $('#postcode').val().trim();
    	const address = $('#address').val().trim();
    	const recipName = $('#recipName').val().trim();
    	const recipPhone = $('#recipPhone').val().trim();

    	// 누락된 값 확인
    	if (!postcode || !address || !recipName || !recipPhone) {
        	let missingFields = [];
        	if (!postcode) missingFields.push("우편번호");
        	if (!address) missingFields.push("주소");
        	if (!recipName) missingFields.push("수령인 이름");
        	if (!recipPhone) missingFields.push("전화번호");


        const errorMessage = `다음 필수 정보를 입력하세요: <br>${missingFields.join(",<br>")}`;
          
        
        // 주소 등록 창 닫기
        const modalElement = document.getElementById('addAddressModal');
        const saveAddressModal = bootstrap.Modal.getInstance(modalElement);

        if (saveAddressModal) {
            saveAddressModal.hide(); // 등록 창 닫기
        }

        // 등록 창이 닫힌 후 오류 모달 표시
        modalElement.addEventListener('hidden.bs.modal', function () {
            showModalMessage(errorMessage); // 오류 메시지 모달 표시
        }, { once: true });
        
        return;
    }

 		
 		// 데이터 직력화 후, AJAX 요청
    	const formData = $('#addAddressModal').find('input, select').serialize();
		
    	$.ajax({
        	url: `${path}/address/add`,
        	type: "POST",
        	data: formData,
        	success: function (response) {
            // 부트 스트랩 모달 객체 생성 후 넣기
            const modalElement = document.getElementById('addAddressModal');
            let saveAddressModal = bootstrap.Modal.getInstance(modalElement);

            if (!saveAddressModal) {
                saveAddressModal = new bootstrap.Modal(modalElement);
            }
			
			saveAddressModal.hide();

            // 등록 완료 메시지를 알림 모달에 표시
            modalElement.addEventListener('hidden.bs.modal', function () {
                showModalMessage(response.message); // 성공 메시지 표시
            }, { once: true });

            // 알림 모달 닫힌 후 페이지 새로고침
            $('#alertModal').on('hidden.bs.modal', function () {
                location.reload(); // 페이지 새로고침
            });
        },
        error: function () {
            // 주소 등록 모달 닫기
            const modalElement = document.getElementById('addAddressModal');
            let saveAddressModal = bootstrap.Modal.getInstance(modalElement);

            if (!saveAddressModal) {
                saveAddressModal = new bootstrap.Modal(modalElement);
            }
			
			// 등록 완료 메시지를 알림 모달에 표시
            modalElement.addEventListener('hidden.bs.modal', function () {
                showModalMessage(response.message); // 성공 메시지 표시
            }, { once: true });

            // 알림 모달 닫힌 후 페이지 새로고침
            $('#alertModal').on('hidden.bs.modal', function () {
                location.reload(); // 페이지 새로고침
            });
			

            // 오류 메시지를 알림 모달에 표시
            modalElement.addEventListener('hidden.bs.modal', function () {
                showModalMessage("주소 저장 중 오류가 발생했습니다."); // 오류 메시지 표시
            }, { once: true });
        }
    	});
	});
	
	// 주소 삭제
	$(document).on("click", ".delete-address-btn", function (event) {
    event.preventDefault(); // 기본 동작 방지
	
	 
    const addrSeq = $(this).data("addr-seq"); // data-addr-seq 속성에서 addr_seq 값 가져오기

    if (!addrSeq) {
        // 모달창으로 오류 메시지 표시
       	showModalMessage(response.message);
        return;
    }
    
    // 삭제 확인 모달 표시
    const confirmDeleteModal = new bootstrap.Modal(document.getElementById('confirmDeleteModal'));
    confirmDeleteModal.show();

    // "삭제" 버튼 클릭 이벤트 처리
    $('#confirmDeleteButton').off('click').on('click', function () {
        confirmDeleteModal.hide(); // 삭제 확인 모달 닫기

        // AJAX 요청으로 주소 삭제
        $.ajax({
            url: `${path}/address/delete`, // 서버의 삭제 엔드포인트
            type: "POST",
            data: { addrSeq: addrSeq },
            success: function (response) {
                if (response && response.status === "success") {
                    // 성공 메시지를 알림 모달에 표시
                    showModalMessage(response.message);

                    // 알림 모달 닫힌 후 페이지 새로고침
                    $('#alertModal').on('hidden.bs.modal', function () {
                        location.reload(); // 페이지 새로고침
                    });
                } else {
                    // 실패 메시지를 알림 모달에 표시
                    showModalMessage(response.message || "삭제 중 오류가 발생했습니다.");
                }
            },
            error: function () {
                // 오류 메시지를 알림 모달에 표시
                showModalMessage("주소 삭제 중 오류가 발생했습니다.");
            }
        });
    });
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