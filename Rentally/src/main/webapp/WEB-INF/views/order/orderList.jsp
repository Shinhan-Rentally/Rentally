<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="../common/headMeta.jsp" %>
    <title>주문내역 - Rentally</title>
    <%@ include file="../common/headLinks.jsp" %>
    <!-- star style -->
    <c:set var="page" value="order"/>

    <style>
        .row_title.TITLE {
            width: 90px; /* 원하는 너비 설정 */
            display: inline-block;
            vertical-align: top; /* 세로 정렬 */
        }
        .row_content.CONTENT {
            display: inline-block;
            vertical-align: top; /* 세로 정렬 */
            width: calc(100% - 100px); /* row_title의 너비 + margin-right를 제외한 나머지 너비 */
            text-align: left; /* 내용 왼쪽 정렬 */
        }
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
    <section>
        <div class="container">
            <div class="row">
                <%@ include file="../common/myPageNavbar.jsp" %>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="py-6 p-md-6 p-lg-10">
                        <h2 class="mb-6">주문내역</h2>
                        <!--filter button-->
                        <div class="btn-group mb-3" role="group">
                            <button type="button" class="btn btn-secondary btn-sm filter-btn" data-period="all">전체 기간
                            </button>
                            <button type="button" class="btn btn-outline-secondary btn-sm filter-btn" data-period="1">최근
                                1개월
                            </button>
                            <button type="button" class="btn btn-outline-secondary btn-sm filter-btn" data-period="2">최근
                                2개월
                            </button>
                            <button type="button" class="btn btn-outline-secondary btn-sm filter-btn" data-period="3">최근
                                3개월
                            </button>
                        </div>
                        <div class="table-responsive-xxl border-0">
                            <table id="order_table" class="table mb-0 text-nowrap table-centered">
                                <thead class="bg-light">
                                <tr>
                                    <th></th>
                                    <th class="text-center">상품명</th>
                                    <th class="text-center">결제일</th>
                                    <th class="text-center">월 구독료</th>
                                    <th class="text-center">리뷰등록</th>
                                    <th class="text-center">주문상세</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- 주문 상세 모달 -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div id="orderDetails" class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="orderDetailModalLabel">주문 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- 모달 본문 -->
            <div class="modal-body">
                <!-- 상품 정보 -->
                <section class="css-4kt7fn">
                    <div style="position: relative; padding-top: 4px; padding-bottom: 16px;">
                        <header>
                            <h6 class="fw-bold mb-3">상품 정보</h6>
                        </header>
                        <div class="css-1sx2i6a">
                            <div class="row_title TITLE">상품번호</div>
                            <div class="row_content CONTENT" id="productSerial"></div>
                        </div>
                        <div class="css-1sx2i6a">
                            <div class="row_title TITLE">주문날짜</div>
                            <div class="row_content CONTENT" id="subDate"></div>
                        </div>
                    </div>
                </section>
                <div></div>
                <!-- 배송 정보 -->
                <section class="css-4kt7fn">
                    <div style="position: relative; padding-top: 4px; padding-bottom: 16px;">
                        <header>
                            <h6 class="fw-bold mb-3">배송 정보</h6>
                        </header>
                        <div class="css-1sx2i6a">
                            <div class="row_title TITLE">수령인</div>
                            <div class="row_content CONTENT" id="receiver"></div>
                        </div>
                        <div class="css-1sx2i6a">
                            <div class="row_title TITLE">휴대폰</div>
                            <div class="row_content CONTENT" id="phone"></div>
                        </div>
                        <div class="css-1sx2i6a">
                            <div class="row_title TITLE">주소</div>
                            <div class="row_content CONTENT" id="address"></div>
                        </div>
                        <div class="css-1sx2i6a">
                            <div class="row_title TITLE"></div>
                            <div class="row_content CONTENT" id="addressDetail"></div>
                        </div>
                    </div>
                </section>
                <div></div>
                <section class="css-4kt7fn">
                    <header>
                        <h6 class="fw-bold mb-3">결제 내역</h6>
                    </header>
                    <div class="css-1sx2i6a">
                        <div class="row_title TITLE">구독기간</div>
                        <div id="subPeriod" class="row_content CONTENT" style="text-align: right !important;"></div>
                    </div>
                    <div class="css-1sx2i6a">
                        <div class="row_title TITLE">총 결제 금액</div>
                        <div id="totalPrice" class="row_content CONTENT" style="text-align: right !important;"></div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
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
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="clearReviewForm()">
                        취소
                    </button>
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
</script>
<script>
    function f_filter() {
        loadOrders = (period) => {
            $.ajax({
                url: `${path}/order/list/selected`,
                type: "get",
                data: {
                    "period": period
                },
                success: function (orders) {
                    $('#order_table tbody').empty();

                    if (orders.length > 0) {
                        orders.forEach(order => {
                            let reviewButton = '';
                            if (order.review_written) {
                                // 리뷰 작성 완료 버튼
                                reviewButton = `
                                <button type="button"
                                    class="btn btn-secondary review-btn btn-sm"
                                    disabled>
                                    리뷰 완료
                                </button>
                            `;
                            } else {
                                // 리뷰 작성 버튼 활성화
                                reviewButton = `
                                <button type="button"
                                    class="btn btn-info review-btn btn-sm"
                                    data-bs-toggle="modal"
                                    data-bs-target="#reviewModal"
                                    data-cust-seq="\${order.cust_seq}"
                                    data-product-name="\${order.product_name}"
                                    data-sub-seq="\${order.sub_seq}">
                                    리뷰 작성
                                </button>
                            `;
                            }
                            $('#order_table tbody').append(`
                            <tr>
                                <td class="align-middle">
                                    <a href="${path}/product/detail?product_seq=\${order.product_seq}">
                                        <img
                                        src="https://rentally.s3.ap-northeast-2.amazonaws.com/\${order.category_seq}/\${order.product_img}" alt="\${order.product_name}"
                                        class="icon-shape icon-xxl" alt="\${order.product_name}" />
                                    </a>
                                </td>
                                <td class="align-middle">
                                    <div>
                                        <h6 class="fs-6 mb-0">
                                            <a href="${path}/product/detail?product_seq=\${order.product_seq}" class="text-inherit product-name" id="productName">\${order.product_name}</a>
                                        </h6>
                                        <span>
                                            <small>
                                                \${order.sub_period}개월
                                            </small>
                                        </span>
                                    </div>
                                </td>
                                <td class="text-center border-top-0">\${order.formatted_paydate}</td>
                                <td class="text-center border-top-0">\${order.sub_total.toLocaleString()}원</td>
                                <td class="text-center border-top-0">
                                    \${reviewButton}
                                </td>
                                <td>
                                    <button type="button"
                                        class="btn btn-outline-info orderDetail-btn btn-sm"
                                        data-bs-toggle="modal"
                                        data-bs-target="#orderDetailModal"
                                        data-product-serial="\${order.product_serial}"
                                        data-sub-date="\${order.formatted_paydate}"
                                        data-sub-name="\${order.sub_name}"
                                        data-cust-phone="\${order.cust_phone}"
                                        data-sub-addrT="\${order.sub_addrT}"
                                        data-sub-addrD="\${order.sub_addrD}"
                                        data-product-pay="\${order.sub_total.toLocaleString()}"
                                        data-sub-period="\${order.sub_period}"
                                        data-sub-card="\${order.sub_card}">
                                        주문상세
                                    </button>
                                </td>
                            </tr>`
                            );
                        });
                    } else {
                        $("#order_table tbody").append('<tr><td colspan="6" style="text-align: center">주문하신 상품이 없습니다.</td></tr>');
                    }
                }
            });
        };
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const filterButtons = document.querySelectorAll('.filter-btn');
        const defaultPeriod = "all"; // 초기 period 값 설정

        // period 데이터를 가져오는 함수
        f_filter();

        // 초기 period="all" 데이터 로드
        loadOrders(defaultPeriod);

        // 필터 버튼 클릭 이벤트
        filterButtons.forEach(button => {
            button.addEventListener('click', () => {
                // 모든 버튼의 클래스 초기화
                filterButtons.forEach(btn => {
                    btn.classList.remove('btn-secondary');
                    btn.classList.add('btn-outline-secondary');
                });

                // 클릭된 버튼에 활성화 클래스 추가
                button.classList.remove('btn-outline-secondary');
                button.classList.add('btn-secondary');

                period = button.getAttribute('data-period');
                loadOrders(period); // 클릭된 period로 데이터 로드
            });
        });

        // 주문 상세 버튼 클릭 이벤트
        document.addEventListener("click", function (event) {
            if (event.target.classList.contains("orderDetail-btn")) {
                // 버튼에서 데이터 추출
                const button = event.target;
                const productSerial = button.getAttribute("data-product-serial");
                const subDate = button.getAttribute("data-sub-date");
                const subName = button.getAttribute("data-sub-name");
                const custPhone = button.getAttribute("data-cust-phone");
                const subAddrT = button.getAttribute("data-sub-addrT");
                const subAddrD = button.getAttribute("data-sub-addrD");
                const productPay = button.getAttribute("data-product-pay");
                const subPeriod = button.getAttribute("data-sub-period");
                const subCard = button.getAttribute("data-sub-card");

                // 모달 내부에 데이터 삽입
                const modal = document.getElementById("orderDetailModal");

                // 상품 정보
                modal.querySelector("#productSerial").textContent = productSerial;
                modal.querySelector("#subDate").textContent = subDate;

                // 배송 정보
                modal.querySelector("#receiver").textContent = subName;
                modal.querySelector("#phone").textContent = custPhone;
                modal.querySelector("#address").textContent = subAddrT;
                modal.querySelector("#addressDetail").textContent = subAddrD;

                // 결제 정보
                modal.querySelector("#totalPrice").textContent = productPay+"원"+"("+subCard+")";
                modal.querySelector("#subPeriod").textContent = subPeriod+"개월";
            }
        });
        document.addEventListener("click", function (event) {
            if (event.target.classList.contains("review-btn")) {
                // 버튼의 data-* 속성 값 가져오기
                const button = event.target;
                const custSeq = button.getAttribute("data-cust-seq");
                const subSeq = button.getAttribute("data-sub-seq");
                const productName = button.getAttribute("data-product-name");

                // 모달에 데이터 설정
                const reviewModal = document.getElementById("reviewModal");
                reviewModal.setAttribute("data-cust-seq", custSeq);
                reviewModal.setAttribute("data-sub-seq", subSeq);

                // product_name을 모달에 삽입 (input 또는 텍스트 설정)
                const productInfoElement = document.getElementById("productInfo");
                if (productInfoElement) {
                    productInfoElement.value = productName; // input일 경우
                    // productInfoElement.textContent = productName; // 텍스트일 경우
                } else {
                    console.error("Element with id 'productInfo' not found");
                }
                clearReviewForm();

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
            }
        });

        // 텍스트 입력 시 바이트 체크
        document.getElementById('reviewText').addEventListener('input', function() {
            fn_checkByte(this);  // fn_checkByte 함수 호출
        });

        // 리뷰 등록 버튼 클릭 이벤트
        document.addEventListener("click", function (event) {
            if (event.target.id === "addReview") {
                event.preventDefault();

                // 모달에서 설정된 데이터 가져오기
                const reviewModal = document.getElementById("reviewModal");
                const custSeq = reviewModal.getAttribute("data-cust-seq");
                const subSeq = reviewModal.getAttribute("data-sub-seq");
                const reviewContent = document.getElementById("reviewText").value;
                const reviewRate = document.querySelectorAll(".bi-star-fill").length;

                // AJAX 요청
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
                        showModalMessage('리뷰가 성공적으로 등록되었습니다.');
                        const bootstrapModal = bootstrap.Modal.getInstance(reviewModal);
                        bootstrapModal.hide(); // 모달 닫기
                        loadOrders(period);
                        f_filter();
                    },
                    error: function (err) {
                        showModalMessage('리뷰 등록에 실패했습니다. 다시 시도해주세요.');
                        console.error(err);
                    }
                });
            }
        });
        $('#reviewModal').on('hidden.bs.modal', function () {
            clearReviewForm();  // 모달이 닫힐 때 폼 초기화
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
</html>