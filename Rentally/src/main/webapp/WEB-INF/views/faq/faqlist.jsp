<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
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
    <title>FAQ - Rentally</title>
    <%@ include file="../common/headLinks.jsp" %>
</head>

<body>
<%@ include file="../common/header.jsp" %>
<main>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
                    <div class="pt-10 pe-lg-10">
                        <ul class="nav flex-column nav-pills nav-pills-dark">
                            <li class="nav-item">
                                <a class="nav-link active" href="${path}/faq/list">
                                    <i class="feather-icon icon-check-circle me-2"></i>
                                    FAQ
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${path}/faq/contact">
                                    <i class="feather-icon icon-user me-2"></i>
                                    카카오톡 문의하기
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-12">
                    <div class="py-6 p-md-6 p-lg-10">
                        <h2 class="mb-6">FAQ</h2>
                        <div class="accordion" id="accordionExample">
                            <c:forEach var="faq" items="${faqList}" varStatus="status">
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
                                </div>
                            </c:forEach>
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

<%@ include file="../common/footer.jsp" %>
</body>
</html>
