<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon/favicon.ico">
  <!-- Theme CSS -->
  <!-- build:css @@webRoot/assets/css/theme.min.css -->
  <link rel="stylesheet" href="resources/css/theme.css">
  <link href="resources/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
  <link href="resources/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
  <link href="resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet" />

  <meta charset="UTF-8">
  <%@ include file="../common/headMeta.jsp" %>
  <title>설정</title>
  <%@ include file="../common/headLinks.jsp" %>
  <!-- @@include("../partials/head/head-links.html") @@include("../partials/head/analytics-code.html") @@include("../partials/head/clarity.html") -->
</head>
<body>
<%@ include file="../common/header.jsp" %>
<main>
  <!-- section -->
  <section>
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- col -->
        <div class="col-12">
          <div class="d-flex justify-content-between align-items-center d-md-none py-4">
            <!-- heading -->
            <h3 class="fs-5 mb-0">Account Setting</h3>
            <!-- button -->
            <button
                    class="btn btn-outline-gray-400 text-muted d-md-none btn-icon btn-sm ms-3"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasAccount"
                    aria-controls="offcanvasAccount">
              <i class="bi bi-text-indent-left fs-3"></i>
            </button>
          </div>
        </div>
        <!-- col -->
        <div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
          <div class="pt-10 pe-lg-10">
            <!-- nav item -->
            <ul class="nav flex-column nav-pills nav-pills-dark">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="account-orders.html">
                  <i class="feather-icon icon-shopping-bag me-2"></i>
                  주문내역
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="account-orders.html">
                  <i class="feather-icon icon-shopping-bag me-2"></i>
                  구독현황
                </a>
              </li>
              <!-- nav item -->
              <li class="nav-item">
                <a class="nav-link active" href="account-settings.html">
                  <i class="feather-icon icon-settings me-2"></i>
                  설정
                </a>
              </li>
              <!-- nav item -->
              <li class="nav-item">
                <a class="nav-link" href="account-address.html">
                  <i class="feather-icon icon-map-pin me-2"></i>
                  주소
                </a>
              </li>
              <!-- nav item -->
              <li class="nav-item">
                <hr />
              </li>
              <!-- nav item -->
              <li class="nav-item">
                <a class="nav-link" href="../index.html">
                  <i class="feather-icon icon-log-out me-2"></i>
                  Log out
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-9 col-md-8 col-12">
          <div class="py-6 p-md-6 p-lg-10">
            <div class="mb-6">
              <!-- heading -->
              <h2 class="mb-0">Account Setting</h2>
            </div>
            <div>
              <!-- heading -->
              <h5 class="mb-4">Account details</h5>
              <div class="row">
                <div class="col-lg-5">
                  <!-- form -->
                  <form>
                    <!-- input -->
                    <div class="mb-3">
                      <label class="form-label">Name</label>
                      <input type="text" id="cust_name" class="form-control" value="${custInfo.cust_name}" />
                    </div>
                    <!-- input -->
                    <div class="mb-3">
                      <label class="form-label">Email</label>
                      <input type="email" id="cust_email" class="form-control" value="${custInfo.cust_email}" />
                    </div>
                    <!-- input -->
                    <div class="mb-5">
                      <label class="form-label">Phone</label>
                      <input type="text" id="cust_phone" class="form-control" value="${custInfo.cust_phone}" />
                    </div>
                    <!-- button -->
                    <div class="mb-3">
                      <button id="saveDetails" class="btn btn-primary">회원정보 수정</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <hr class="my-10" />
            <div class="pe-lg-14">
              <!-- heading -->
              <h5 class="mb-4">Password</h5>
              <form class="row row-cols-1 row-cols-lg-2">
                <!-- input -->
                <div class="mb-3 col">
                  <label class="form-label">New Password</label>
                  <input id="newPW" type="password" class="form-control" placeholder="**********" />
                </div>
                <!-- input -->
                <div class="mb-3 col">
                  <label class="form-label">Current Password</label>
                  <input id="currentPW" type="password" class="form-control" placeholder="**********" />
                </div>
                <!-- input -->
                <div class="col-12">
                  <p class="mb-4">
                    Can’t remember your current password?
                    <a href="#">Reset your password.</a>
                  </p>
                  <button id="updatePW" class="btn btn-primary">비밀번호 수정</button>
                </div>
              </form>
            </div>
            <hr class="my-10" />
            <div>
              <!-- heading -->
              <h5 class="mb-4">Delete Account</h5>
              <p class="mb-2">Would you like to delete your account?</p>
              <p class="mb-5">This account contain 12 orders, Deleting your account will remove all the order details associated with it.</p>
              <!-- btn -->
              <div class="mb-3">
                <button id="deleteAccount" class="btn btn-outline-danger">회원 탈퇴</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>

<!-- modal -->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasAccount" aria-labelledby="offcanvasAccountLabel">
  <!-- offcanvas header -->
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasAccountLabel">Offcanvas</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <!-- offcanvas body -->
  <div class="offcanvas-body">
    <ul class="nav flex-column nav-pills nav-pills-dark">
      <!-- nav item -->
      <li class="nav-item">
        <a class="nav-link" aria-current="page" href="account-orders.html">
          <i class="feather-icon icon-shopping-bag me-2"></i>
          Your Orders
        </a>
      </li>
      <!-- nav item -->

      <li class="nav-item">
        <a class="nav-link active" href="account-settings.html">
          <i class="feather-icon icon-settings me-2"></i>
          Settings
        </a>
      </li>
      <!-- nav item -->

      <li class="nav-item">
        <a class="nav-link" href="account-address.html">
          <i class="feather-icon icon-map-pin me-2"></i>
          Address
        </a>
      </li>
      <!-- nav item -->

      <li class="nav-item">
        <a class="nav-link" href="account-payment-method.html">
          <i class="feather-icon icon-credit-card me-2"></i>
          Payment Method
        </a>
      </li>
      <!-- nav item -->

      <li class="nav-item">
        <a class="nav-link" href="account-notification.html">
          <i class="feather-icon icon-bell me-2"></i>
          Notification
        </a>
      </li>
    </ul>
    <hr class="my-6" />
    <div>
      <!-- navs -->
      <ul class="nav flex-column nav-pills nav-pills-dark">
        <!-- nav item -->
        <li class="nav-item">
          <a class="nav-link" href="../index.html">
            <i class="feather-icon icon-log-out me-2"></i>
            Log out
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>

<!-- Javascript-->
<!-- @@include("../partials/scripts.html") -->
<script src="resources/js/vendors/jquery.min.js"></script>
<script src="resources/js/vendors/countdown.js"></script>
<script src="resources/libs/slick-carousel/slick/slick.min.js"></script>
<script src="resources/js/vendors/slick-slider.js"></script>
<script src="resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="resources/js/vendors/tns-slider.js"></script>
<script src="resources/js/vendors/zoom.js"></script>
<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
<!-- Javascript-->
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
  $('#saveDetails').on("click", function (event){
    event.preventDefault();
    cust_seq = ${custInfo.cust_seq};
    $.ajax({
      url: "update",
      type: 'post',
      data: {
        cust_seq:cust_seq,
        cust_name : $('#cust_name').val(),
        cust_email : $('#cust_email').val(),
        cust_phone : $('#cust_phone').val()
      },
      success: function (response){
        alert("updateInfo success"+ response);
      }
    })

  })


  $("#deleteAccount").on("click", function (event) {
    event.preventDefault();
    cust_seq = ${custInfo.cust_seq};

    $.ajax({
      url: `delete`,
      type: 'post',
      data: {cust_seq:cust_seq},
      success: function(response) {
        alert('탈퇴 성공');
      },
      error: function (err) {
        alert('탈퇴 실패');
      }
    })
  })

</script>
<script>
  $('#saveDetails').on("click", function (event){
    event.preventDefault();
    cust_seq = ${custInfo.cust_seq};
    $.ajax({
      url: "update",
      type: 'post',
      data: {
        cust_seq:cust_seq,
        cust_name : $('#cust_name').val(),
        cust_email : $('#cust_email').val(),
        cust_phone : $('#cust_phone').val()
      },
      success: function (response){
        alert("updateInfo success"+ response);
      }
    })

  })
  $("#deleteAccount").on("click", function (event) {
    event.preventDefault();
    cust_seq = ${custInfo.cust_seq};

    $.ajax({
      url: `\${cust_seq}/delete`,
      type: 'POST',
      success: function(response) {
        alert('탈퇴 성공');
      },
      error: function (err) {
        alert('탈퇴 실패');
      }
    })
  })
</script>
<script>
  $("#updatePW").on("click", function (event) {
    event.preventDefault(); // 기본 동작 방지

    cust_seq = ${custInfo.cust_seq}; // 고객 고유 번호
    currentPW = $("#currentPW").val(); // 사용자가 입력한 현재 비밀번호
    newPW = $("#newPW").val(); // 사용자가 입력한 새로운 비밀번호

    // 필드 검증
    if (!currentPW || !newPW) {
      alert("모든 필드를 입력해주세요.");
      return;
    }

    // 비밀번호 확인과 변경 요청을 한 번에 처리
    $.ajax({
      url: "updatepw", // 단일 요청 처리 API
      type: "post",
      data: {
        cust_seq:cust_seq,
        currentPW: currentPW,
        newPW: newPW,
      },
      success: function (response) {
        if (response.success) {
          alert("비밀번호가 성공적으로 변경되었습니다.");
        } else if (response.error === "incorrect_password") {
          alert("현재 비밀번호가 일치하지 않습니다.");
        } else {
          alert("비밀번호 변경 실패");
        }
      },
      error: function (err) {
        alert("서버 오류로 비밀번호 변경에 실패했습니다.");
        console.log(err);
      },
    });
  });
</script>
</html>
