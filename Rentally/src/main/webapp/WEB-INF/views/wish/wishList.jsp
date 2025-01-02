<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <%@ include file="../common/headMeta.jsp" %>
  <title>위시리스트 - Rentally</title>
  <%@ include file="../common/headLinks.jsp" %>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<main>
  <!-- section-->
  <div class="mt-4">
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- col -->
        <div class="col-12">
          <!-- breadcrumb -->
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0">
              <li class="breadcrumb-item"><a href="${path}/main">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">위시리스트</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </div>
  <!-- section -->
  <section class="mt-8 mb-14">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-lg-12">
          <div class="mb-8">
            <!-- heading -->
            <h1 class="mb-1">위시리스트</h1>
            <p>${totalCount}개 상품</p>
          </div>
          <div>
            <!-- table -->
            <div class="table-responsive">
              <table class="table text-nowrap table-with-checkbox">
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
                      <a href="#"><img
                              src="https://rentally.s3.ap-northeast-2.amazonaws.com/${wish.category_seq}/${wish.product_img}"
                              width="64"
                              height="64"
                              style="object-fit: cover;"
                      /></a>
                    </td>
                    <td class="align-middle border-top-0">
                      <a href="#" class="fw-semibold text-inherit">
                        <h6 class="mb-0">${wish.product_name}</h6>
                      </a>
                      <span><small class="text-muted">${wish.product_features}</small></span>
                    </td>
                    <td class="align-middle border-top-0">
                      <fmt:formatNumber value="${wish.product_pay}" type="number" pattern="#,###"/>원
                    </td>
                    <td class="align-middle">
                      <a class="text-muted deleteWish" href="#"
                         data-wish-seq="${wish.wish_seq}"
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
  $(document).on("click", ".deleteWish", function (event) {
    event.preventDefault();

    // 버튼에서 wish_seq가져오기
    wish_seq = $(this).data("wish-seq");

    if (!wish_seq) {
      alert("필요한 데이터가 누락되었습니다.");
      return;
    }

    // AJAX 요청
    $.ajax({
      url: `${path}/wishlist/\${wish_seq}/delete`,
      type: 'delete',
      success: function (response) {
        alert('삭제 성공');
        location.reload(); // 페이지 새로 고침
      },
      error: function (err) {
        alert('삭제 실패');
      }
    });
  });
</script>
</html>
