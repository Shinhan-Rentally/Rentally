<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../common/headMeta.jsp" %>
    <title>카카오톡 문의하기 - Rentally</title>
    <%@ include file="../common/headLinks.jsp" %>
    <style>
        .contact-section {
            text-align: center;
            margin-top: 50px;
        }
        .contact-section .icon {
            font-size: 50px;
            color: black;
            margin-bottom: 15px;
        }
        .contact-section .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .contact-section .description {
            font-size: 16px;
            color: gray;
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
                <div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
                    <div class="pt-10 pe-lg-10">
                        <!-- nav item -->
                        <ul class="nav flex-column nav-pills nav-pills-dark">
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/faq/list">
                                    <i class="feather-icon icon-check-circle me-2"></i>
                                    FAQ
                                </a>
                            </li>
                            <!-- nav item -->
                            <li class="nav-item">
                                <a class="nav-link active" href="${path}/faq/contact">
                                    <i class="feather-icon icon-user me-2"></i>
                                    카카오톡 문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="py-6 p-md-6 p-lg-10">
                        <!-- heading -->
                        <h2 class="mb-6">카카오톡 문의하기</h2>
                        <div class="container contact-section">
                            <div class="icon">
                                <a href="javascript:void(0);" onclick="popupWindow('http://pf.kakao.com/_wYcdn/chat', 'My Popup', 800, 750);">
                                <img src="../resources/images/png/kakao.png" alt="Chat Icon" width="100" height="100">
                                </a>
                            </div>
                            <div class="title">1:1 문의</div>
                            <div class="description">궁금한 사항이 있다면 카카오톡 문의하기를 통해 문의해주세요.</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/js/main.js"></script>

<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
</body>

<script>

    function popupWindow(url, title, width, height) {

        var popupWidth = width;
        var popupHeight = height;

        var popupX = Math.round(window.screenX + (window.outerWidth/2) - (popupWidth/2));
        var popupY = Math.round(window.screenY + (window.outerHeight/2) - (popupHeight/2));

        var featureWindow = "width=" + popupWidth + ", height="+popupHeight
            + ", left=" + popupX + ", top=" + popupY;

        return window.open(url, name, featureWindow);
    }

</script>
</html>
