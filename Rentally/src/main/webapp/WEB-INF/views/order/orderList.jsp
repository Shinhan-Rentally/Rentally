<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="../common/headMeta.jsp" %>
    <title>주문내역 - Rentally</title>
    <%@ include file="../common/headLinks.jsp" %>
    <!-- star style -->
    <c:set var="page" value="order" />
    <style>
        .product-name {
            white-space: pre-wrap; /* 줄바꿈 문자를 인식하도록 설정 */
        }
        .star-rating {
            font-size: 1.5rem;
            cursor: pointer;
        }
        /* 비어 있는 별 스타일 */
        .star-rating .bi-star {
            color: #ccc; /* 회색 */
        }
        /* 채워진 별 스타일 */
        .star-rating .bi-star-fill {
            color: #ffcc00; /* 완전한 노란색 */
        }
    </style>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<main>
    <!-- section -->
    <section>
        <div class="container">
            <!-- row -->
            <div class="row">
                <%@ include file="../common/myPageNavbar.jsp" %>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="py-6 p-md-6 p-lg-10">
                        <!-- heading -->
                        <h2 class="mb-6">주문내역</h2>

                        <div class="left">
                            <button type="button" id="btn_date_1" title="최근1개월" class="btn_date_term" onclick="WCK_COMMON_MYPAGE_RENEWAL_FN.myDateTabClick(31, 'Day');">최근1개월</button>
                            <button type="button" id="btn_date_2" title="최근1개월" class="btn_date_term" onclick="WCK_COMMON_MYPAGE_RENEWAL_FN.myDateTabClick(31, 'Day');">최근2개월</button>
                            <button type="button" id="btn_date_3" title="최근1개월" class="btn_date_term" onclick="WCK_COMMON_MYPAGE_RENEWAL_FN.myDateTabClick(31, 'Day');">최근3개월</button>
                        </div>
                        <div class="table-responsive-xxl border-0">
                            <!-- Table -->
                            <table class="table mb-0 text-nowrap table-centered">
                                <!-- Table Head -->
                                <thead class="bg-light">
                                <tr>
                                    <th></th>
                                    <th class="text-center">상품명</th>
                                    <th class="text-center">결제일</th>
                                    <th class="text-center">월 구독료</th>
                                    <th class="text-center">리뷰등록</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="order" items="${myOrders}">
                                    <tr>
                                        <td class="align-middle border-top-0 w-0">
                                            <a href="#"><img
                                                    src="https://rentally.s3.ap-northeast-2.amazonaws.com/${order.category_seq}/${order.product_img}"
                                                    class="icon-shape icon-xl"
                                            /></a>
                                        </td>
                                        <td class="align-middle border-top-0">
                                            <a href="#" class="fw-semibold text-inherit">
                                                <h6 class="mb-0 product-name">${order.product_name}</h6>
                                            </a>
                                            <span>
	                                       	<small class="text-muted">
	                                       	<c:if test="${order.sub_period >= 12}">
                                                <fmt:formatNumber value="${order.sub_period/12}" type="number"/>년
                                            </c:if>
	                                       	<c:if test="${order.sub_period < 12}">
                                                ${order.sub_period}개월
                                            </c:if>
	                                       	</small>
	                                       </span>
                                        </td>
                                        <td class="text-center border-top-0">${order.formatted_paydate}</td>
                                        <td class="text-center border-top-0">
                                            <fmt:formatNumber value="${order.sub_total}" type="number" pattern="#,###"/>원
                                        </td>
                                        <td class="text-center border-top-0">
                                            <c:if test="${order.review_written == false}">
                                                <!-- 리뷰 작성 버튼 활성화 -->
                                                <button type="button"
                                                        class="btn btn-info review-btn btn-sm"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#reviewModal"
                                                        data-product="${order.product_name}"
                                                        data-cust-seq="${order.cust_seq}"
                                                        data-product-name="${order.product_name}"
                                                        data-sub-seq="${order.sub_seq}">
                                                    리뷰 작성
                                                </button>
                                            </c:if>

                                            <c:if test="${order.review_written == true}">
                                                <!-- 리뷰 작성 버튼 비활성화 -->
                                                <button type="button"
                                                        class="btn btn-secondary review-btn btn-sm"
                                                        disabled
                                                        data-product="${order.product_name}"
                                                        data-cust-seq="${order.cust_seq}"
                                                        data-product-name="${order.product_name}"
                                                        data-sub-seq="${order.sub_seq}">
                                                    리뷰 완료
                                                </button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- 리뷰 등록 모달 -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reviewModalLabel">리뷰 작성</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="review/add" method="post">
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <input type="text"
                               class="form-control" id="productInfo"
                               readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-bold">별점을 매겨주세요</label>
                        <div class="star-rating">
                            <i class="bi bi-star" data-value="1"></i>
                            <i class="bi bi-star" data-value="2"></i>
                            <i class="bi bi-star" data-value="3"></i>
                            <i class="bi bi-star" data-value="4"></i>
                            <i class="bi bi-star" data-value="5"></i>
                        </div>
                    </div>
                    <!-- Textarea for Review -->
                    <div class="mb-3">
                        <label for="reviewText" class="form-label">어떤 점이 좋았나요?</label>
                        <textarea class="form-control"
                                  id="reviewText" rows="3"
                                  placeholder="상품과 관련된 리뷰를 작성해주세요."
                                  onkeyup="fn_checkByte(this)"></textarea>
                        <p><span id="nowByte">0</span>/500bytes</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="clearReviewForm()">취소</button>
                    <button id="addReview" type="button" class="btn btn-info">리뷰 등록</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 알림용 modal -->
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alertModalLabel">알림</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="alertModalMessage"></div>
            <div class="modal-footer">
                <button type="button" id="alertModalConfirm" class="btn btn-info" data-bs-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>

<!-- Javascript-->
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<%@ include file="../common/bottomKakao.jsp" %>
<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
</body>
<script>
    function showModalMessage(message) {
        $('#alertModalMessage').text(message);
        $('#alertModal').modal('show');
    }
    // 모달 확인 버튼 클릭 시 동작
    $('#alertModalConfirm').off("click").on("click", function () {
        if (isSuccess) {
            location.reload(); // 성공한 경우에만 새로고침
        }
    });
</script>
<script>
    // 별점 컨테이너 가져오기
    const stars = document.querySelectorAll('.star-rating .bi');

    stars.forEach((star) => {
        star.addEventListener('click', (event) => {
            const value = parseInt(event.target.getAttribute('data-value'));

            // 별점 초기화 및 업데이트
            stars.forEach((s, index) => {
                if (index < value) {
                    s.classList.remove('bi-star'); // 비어 있는 별 제거
                    s.classList.add('bi-star-fill'); // 채워진 별 추가
                } else {
                    s.classList.remove('bi-star-fill'); // 채워진 별 제거
                    s.classList.add('bi-star'); // 비어 있는 별 추가
                }
            });
        });
    });
</script>
<script>
    function clearReviewForm() {
        // 텍스트 영역 내용 초기화
        document.getElementById('reviewText').value = '';

        // 별점 초기화 (스타의 클래스를 변경하여 초기화)
        let stars = document.querySelectorAll('.star-rating i');
        stars.forEach(star => {
            star.classList.remove('bi-star-fill'); // 채워진 별 제거
            star.classList.add('bi-star'); // 비어 있는 별 추가
        });

        // 바이트 수 리셋
        document.getElementById('nowByte').innerText = '0';
    }

    function fn_checkByte(obj) {
        const maxByte = 500; // 최대 500바이트
        let text_val = obj.value; // 입력한 문자
        let totalByte = 0; // 총 바이트 수
        let newText = ""; // 수정된 텍스트 저장
        const encoder = new TextEncoder();

        // 각 문자의 바이트 길이를 계산하고 제한 초과 여부 확인
        for (let i = 0; i < text_val.length; i++) {
            const byteArr = encoder.encode(text_val.charAt(i)); // UTF-8로 인코딩된 바이트 배열
            totalByte += byteArr.length;

            if (totalByte <= maxByte) {
                newText += text_val.charAt(i); // 현재 문자를 추가
            } else {
                break; // 최대 바이트를 초과하면 중단
            }
        }

        // 입력된 글자 수정
        if (totalByte > maxByte) {
            obj.value = newText; // 초과된 글자를 잘라낸 새로운 텍스트를 설정
            totalByte = maxByte; // 최대 바이트로 설정
        }

        // 현재 바이트 수와 스타일 업데이트
        const nowByteElem = document.getElementById("nowByte");
        if (nowByteElem) {
            nowByteElem.innerText = totalByte;
            nowByteElem.style.color = totalByte >= maxByte ? "red" : "blue";
        }
    }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 리뷰 버튼 클릭 시 데이터 설정
        const reviewButtons = document.querySelectorAll(".review-btn");

        reviewButtons.forEach(button => {
            button.addEventListener("click", function () {
                // 버튼의 data-* 속성 값 가져오기
                const custSeq = this.getAttribute("data-cust-seq");
                const subSeq = this.getAttribute("data-sub-seq");
                const productName = this.getAttribute("data-product-name");

                // 모달에 데이터 설정
                const reviewModal = document.getElementById("reviewModal");
                reviewModal.setAttribute("data-cust-seq", custSeq);
                reviewModal.setAttribute("data-sub-seq", subSeq);
                document.getElementById('productInfo').value = productName;

            });
        });

        // 리뷰 등록 버튼 클릭 이벤트
        document.getElementById("addReview").addEventListener("click", function (event) {
            event.preventDefault();

            // 모달에서 설정된 데이터 가져오기
            reviewModal = document.getElementById("reviewModal");
            custSeq = reviewModal.getAttribute("data-cust-seq");
            subSeq = reviewModal.getAttribute("data-sub-seq");
            reviewContent = document.getElementById("reviewText").value;
            reviewRate = document.querySelectorAll(".bi-star-fill").length;

            $.ajax({
                url: `${path}/review/\${custSeq}/add`,
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    cust_seq: custSeq,
                    sub_seq: subSeq,
                    review_content: reviewContent,
                    review_rate: reviewRate
                }),
                success: function (response) {
                    isSuccess = true;
                    showModalMessage('리뷰가 성공적으로 등록되었습니다.');
                    bootstrapModal = bootstrap.Modal.getInstance(reviewModal);
                    bootstrapModal.hide(); // 모달 닫기
                },
                error: function (err) {
                    isSuccess = false;
                    showModalMessage('리뷰 등록에 실패했습니다. 다시 시도해주세요.');
                    console.error(err);
                }
            });
        });
    });
</script>
</html>

