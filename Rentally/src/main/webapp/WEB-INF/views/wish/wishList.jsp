<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%@ include file="../common/headMeta.jsp" %>
    <title>위시리스트 - Rentally</title>
    <%@ include file="../common/headLinks.jsp" %>
    <style>
        .product-name {
            white-space: pre-wrap !important; /* 줄바꿈 문자를 인식하도록 설정 */
        }
    </style>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<c:set var="page" value="wishlist"/>
<main>
    <!-- section -->
    <section>
        <div class="container">
            <!-- row -->
            <div class="row">
                <%@ include file="../common/myPageNavbar.jsp" %>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="py-6 p-md-6 p-lg-10">
                        <h2 class="mb-6">위시리스트</h2>
                        <p>${totalCount}개의 상품이 위시리스트에 담겨있습니다.</p>

                        <div class="table-responsive-xxl border-0">
                            <!-- table -->
                            <table class="table mb-0 text-nowrap table-centered">
                                <thead class="table-light">
                                <tr>
                                    <th></th>
                                    <th>상품명</th>
                                    <th>구독료</th>
                                    <th>삭제</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="wish" items="${wishList}">
                                    <tr>
                                        <td class="align-middle border-top-0 w-0">
                                            <a href="${path}/product/detail?product_seq=${wish.product_seq}">
                                                <img
                                                        src="https://rentally.s3.ap-northeast-2.amazonaws.com/${wish.category_seq}/${wish.product_img}"
                                                        class="icon-shape icon-xl"
                                                /></a>
                                        </td>
                                        <td class="align-middle border-top-0">

                                            <a href="${path}/product/detail?product_seq=${wish.product_seq}"
                                               class="fw-semibold text-inherit">
                                                <h6 class="mb-0 product-name">${wish.product_name}</h6>
                                            </a>

                                            <span><small
                                                    class="text-muted product-name">${wish.product_features}</small></span>
                                        </td>
                                        <td class="align-middle border-top-0">
                                            <fmt:formatNumber value="${wish.product_pay}" type="number"
                                                              pattern="#,###"/>원
                                        </td>
                                        <td class="align-middle">
                                            <a class="text-muted deleteWish" href="#"
                                               data-wish-seq="${wish.wish_seq}"
                                               data-cust-seq="${wish.cust_seq}"
                                               data-product-seq="${wish.product_seq}"
                                               data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
                                                <i class="feather-icon icon-trash-2"></i>
                                            </a>
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
<!-- Javascript-->
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
    $(document).on("click", ".deleteWish", function (event) {
        event.preventDefault();

        // 버튼에서 product_seq와 cust_seq 가져오기
        product_seq = $(this).data("product-seq");
        cust_seq = $(this).data("cust-seq");

        if (!product_seq || !cust_seq) {
            isSuccess = false;
            showModalMessage('필요한 데이터가 누락되었습니다.');
            return;
        }

        // AJAX 요청
        $.ajax({
            url: `${path}/wishlist/\${product_seq}/delete`,
            type: 'delete',
            success: function (response) {
                isSuccess = true;
                showModalMessage('위시리스트에서 삭제되었습니다.');
            },
            error: function (err) {
                isSuccess = false;
                alert('삭제 실패');
                showModalMessage('삭제에 실패하였습니다. 다시 시도해주세요.');
            }
        });
    });
</script>
</html>
