<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Favicon icon-->
    <link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon/favicon.ico">
    <!-- Theme CSS -->
    <!-- build:css @@webRoot/assets/css/theme.min.css -->
    <link rel="stylesheet" href="resources/css/theme.css">
    <link href="resources/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
    <link href="resources/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
    <link href="resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* 기본 아코디언 버튼 스타일 */
        .accordion-button {
            background-color: transparent; /* 접혔을 때 배경색 투명 */
            color: black; /* 텍스트 색상 */
            border: none; /* 테두리 제거 */
        }

        /* 아코디언이 열린 상태에서 버튼의 배경색 */
        .accordion-button:not(.collapsed) {
            background-color: #F0F3F2; /* 열렸을 때 배경색 */
            color: black; /* 열린 버튼 텍스트 색상 */
        }

        /* 아코디언 아이템의 테두리 스타일 */
        .accordion-item {
            border: 1px solid #F0F3F2; /* 아코디언 아이템 테두리 */
        }

        /* 아코디언 버튼의 호버 효과 */
        .accordion-button:hover {
            background-color: #E1E5E3; /* 호버 상태 배경색 */
            color: black; /* 호버 상태 텍스트 색상 */
        }
    </style>
    <meta charset="UTF-8">
    <%@ include file="../common/headMeta.jsp" %>
    <title>Rentally</title>
    <%@ include file="../common/headLinks.jsp" %>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<main>
    <!-- section -->
    <section>
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- col -->
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center d-md-none py-4">
                        <!-- heading -->
                        <h3 class="fs-5 mb-0">FAQ</h3>
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
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="py-6 p-md-6 p-lg-10">
                        <!-- heading -->
                        <h2 class="mb-6">FAQ</h2>
                        <div class="accordion" id="accordionExample">
                            <c:forEach var="faq" items="${faqlist}" varStatus="status">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button <c:if test="${!status.first}">collapsed</c:if>"
                                                type="button"
                                                data-bs-toggle="collapse"
                                                data-bs-target="#collapse${status.index}"
                                                aria-expanded="<c:if test='${status.first}'>true</c:if><c:if test='${!status.first}'>false</c:if>"
                                                aria-controls="collapse${status.index}">
                                            Q. ${faq.faq_question}
                                        </button>
                                    </h2>
                                    <div id="collapse${status.index}"
                                         class="accordion-collapse collapse <c:if test='${status.first}'>show</c:if>">
                                        <div class="accordion-body">
                                            <c:out value="${faq.faq_answer}"/>
                                        </div>
                                    </div>
                                        <%--                                    <div id="collapse${status.index}"--%>
                                        <%--                                         class="accordion-collapse collapse <c:if test='${status.first}'>show</c:if>">--%>
                                        <%--                                        <div class="accordion-body">--%>
                                        <%--                                                A. ${faq.faq_answer}--%>
                                        <%--                                        </div>--%>
                                        <%--                                    </div>--%>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>


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
@@include("../partials/scripts.html")
</body>
</html>
