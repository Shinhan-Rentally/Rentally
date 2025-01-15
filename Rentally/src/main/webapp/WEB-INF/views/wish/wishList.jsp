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
                        <p class="wishlist-count">0개의 상품이 위시리스트에 담겨있습니다.</p>

                        <div class="table-responsive-xxl border-0">
                            <table class="table mb-0 text-nowrap table-centered" id="wishlist_table">
                                <thead class="bg-light">
                                <tr>
                                    <th></th>
                                    <th class="text-center">상품명</th>
                                    <th class="text-center">월 구독료</th>
                                    <th class="text-center">삭제</th>
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
    function wish_filter() {
        $.ajax({
            url: `${path}/wishlist/list/selected`, // 위시리스트를 가져오는 URL
            type: "get",
            success: function (wishList) {
                $('#wishlist_table tbody').empty();

                const wishlistCount = wishList.length; // 위시리스트 개수 계산
                $('p.wishlist-count').text(`\${wishlistCount}개의 상품이 위시리스트에 담겨있습니다.`); // 개수 업데이트

                if (wishList.length > 0) {
                    wishList.forEach(wish => {
                        $('#wishlist_table tbody').append(`
                            <tr>
                                <td class="align-middle border-top-0 w-0">
                                    <a href="${path}/product/detail?product_seq=\${wish.product_seq}">
                                        <img src="https://d14b80fsv1tvpk.cloudfront.net/\${wish.category_seq}/\${wish.product_img}?&f=webp&q=80" width="56" height="56"
                                             alt="\${wish.product_name}" class="icon-shape icon-xl"/>
                                    </a>
                                </td>
                                <td class="align-middle">
                                    <div>
                                        <h6 class="fs-6 mb-0">
                                            <a href="${path}/product/detail?product_seq=\${wish.product_seq}" class="text-inherit product-name" id="productName">\${wish.product_name}</a>
                                        </h6>
                                        <span>
                                            <small>
                                                \${wish.product_features}
                                            </small>
                                        </span>
                                    </div>
                                </td>
                                <td class="text-center border-top-0">
                                    \${wish.product_pay.toLocaleString()}원
                                </td>
                                <td class="text-center">
                                    <a class="text-muted deleteWish" href="#"
                                       data-wish-seq="\${wish.wish_seq}"
                                       data-cust-seq="\${wish.cust_seq}"
                                       data-product-seq="\${wish.product_seq}"
                                       data-bs-toggle="tooltip" data-bs-placement="top" title="Delete">
                                        <i class="feather-icon icon-trash-2"></i>
                                    </a>
                                </td>
                            </tr>`
                        );
                    });
                } else {
                    $('#wishlist_table tbody').append('<tr><td colspan="4" style="text-align: center"></td></tr>');
                }
            },
            error: function () {
                console.error("위시리스트를 불러오는 중 오류가 발생했습니다.");
            }
        });

    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        wish_filter();

        $(document).on("click", ".deleteWish", function (event) {
            event.preventDefault();

            productSeq = $(this).data("product-seq");
            custSeq = $(this).data("cust-seq");

            if (!productSeq || !custSeq) {
                showModalMessage('필요한 데이터가 누락되었습니다.');
                return;
            }

            $.ajax({
                url: `${path}/wishlist/\${productSeq}/delete`,
                type: 'delete',
                success: function (response) {
                    showModalMessage('위시리스트에서 삭제되었습니다.');
                    wish_filter();
                  	//헤더 개수 업데이트
                    updateCounts();
                },
                error: function (err) {
                    showModalMessage('삭제에 실패하였습니다. 다시 시도해주세요.');
                }
            });
        });
    });
</script>
</html>
