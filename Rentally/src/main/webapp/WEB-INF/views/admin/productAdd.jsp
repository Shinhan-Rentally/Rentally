<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <link href="${path}/resources/libs/dropzone/dist/min/dropzone.min.css" rel="stylesheet"/>
    <title>상품 등록 - Rentally</title>
</head>
<body>
<%@ include file="../common/adminTopNavbar.jsp" %>
<div class="main-wrapper">
    <%@ include file="../common/adminNavbar.jsp" %>
    <main class="main-content-wrapper">
        <div class="container">
            <div class="row mb-8">
                <div class="col-md-12">
                    <div class="d-md-flex justify-content-between align-items-center">
                        <div>
                            <h2>상품 등록</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="${path}/main" class="text-inherit">Home</a>
                                    </li>
                                    <li class="breadcrumb-item"><a href="${path}/admin/product/list">관리자</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">상품 등록</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="${path}/admin/product/list" class="btn btn-light-info">Back to Product</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card mb-6 card-lg">
                    <div class="card-body p-6">
                        <h4 class="mb-4 h5">Product Information</h4>
                        <div class="row">
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">상품 번호</label>
                                <input id="productSerial" type="text" class="form-control" placeholder="상품 번호"
                                       required/>
                            </div>
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">상품명</label>
                                <input id="productName" type="text" class="form-control" placeholder="상품명"
                                       required/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">월 요금</label>
                                <input id="pay" type="text" class="form-control" placeholder="월 요금" required/>
                            </div>
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">상품 출시일</label>
                                <input id="date" type="date" class="form-control" placeholder="출시일" required/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">상품 크기</label>
                                <div class="row">
                                    <div class="mb-3 col-lg-4">
                                        <input id="wide" type="text" class="form-control" placeholder="Wide"
                                               required/>
                                    </div>
                                    <div class="mb-3 col-lg-4">
                                        <input id="height" type="text" class="form-control" placeholder="Height"
                                               required/>
                                    </div>
                                    <div class="mb-3 col-lg-4">
                                        <input id="dept" type="text" class="form-control" placeholder="Depth"
                                               required/>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">상품 무게</label>
                                <input id="weight" type="text" class="form-control" placeholder="상품 무게" required/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">소비 전력</label>
                                <input id="wh" type="text" class="form-control" placeholder="소비 전력" required/>
                            </div>
                            <div class="mb-3 col-lg-6">
                                <label class="form-label">상품 색상</label>
                                <input id="color" type="text" class="form-control" placeholder="상품 색상" required/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-3 col-lg-4">
                                <label class="form-label">카테고리</label>
                                <select class="form-select" id="category">
                                    <option selected>카테고리</option>
                                    <option value="1">TV</option>
                                    <option value="2">냉장고</option>
                                    <option value="3">건조기</option>
                                    <option value="4">세탁기</option>
                                    <option value="5">전자레인지</option>
                                    <option value="6">에어컨</option>
                                    <option value="7">공기청정기</option>
                                    <option value="8">청소기</option>
                                    <option value="9">스타일러</option>
                                </select>
                            </div>
                            <div class="mb-3 col-lg-4">
                                <label class="form-label">등급</label>
                                <select class="form-select" id="grade">
                                    <option selected>등급</option>
                                    <option value="A">A</option>
                                    <option value="B">B</option>
                                    <option value="C">C</option>
                                </select>
                            </div>
                            <div class="mb-3 col-lg-4">
                                <label class="form-label">브랜드</label>
                                <select class="form-select" id="brand">
                                    <option selected>브랜드</option>
                                    <option value="LG">LG</option>
                                    <option value="삼성">삼성</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 col-lg-12 mt-5">
                            <h4 class="mb-3 h5">상세 설명</h4>
                            <textarea id="features" class="form-control" rows="3"
                                      placeholder="Product Description"></textarea>
                        </div>
                        <div>
                            <div class="mb-3 col-lg-12 mt-5">
                                <h4 class="mb-3 h5">상품 이미지</h4>
                                <div id="img-dropzone" class="dropzone mt-4 border-dashed rounded-2 min-h-0"></div>
                            </div>
                        </div>
                        <div>
                            <div class="mb-3 col-lg-12 mt-5">
                                <h4 class="mb-3 h5">상품 상세 이미지</h4>
                                <div id="detail-dropzone"
                                     class="dropzone mt-4 border-dashed rounded-2 min-h-0"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-grid">
                    <button id="insert" type="button" class="btn btn-info">상품 등록</button>
                </div>
            </div>
        </div>
    </main>
</div>
<%@ include file="../common/modal.jsp" %>
<script> var contextPath = "${path}" </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/libs/quill/dist/quill.min.js"></script>
<script src="${path}/resources/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/resources/js/vendors/dropzone.js"></script>
<script src="${path}/resources/js/modalUtils.js"></script>
<script>
    $('#features').on('input', function () {
        let lines = $(this).val().split("\n").slice(0, 3);
        $(this).val(lines.join("\n"));
    });

    $("#insert").on("click", function () {
        var wide = $('#wide').val();
        var height = $('#height').val();
        var depth = $('#depth').val();
        var weight = $('#weight').val();
        var wh = $('#wh').val();
        var features = $('#features').val()
            .split("\n")
            .map(line => `#\${line.trim()}`)
            .join(" ");

        var productData = {
            "category_seq": $('#category').val(),
            "product_serial": $('#productSerial').val(),
            "product_name": $('#productName').val(),
            "product_pay": $('#pay').val(),
            "product_brand": $('#brand').val(),
            "product_grade": $('#grade').val(),
            "product_date": $('#date').val(),
            "product_height": wide + " x " + height + " x " + depth + " mm",
            "product_weight": weight + " kg ",
            "product_wh": wh + " wh ",
            "product_color": $('#color').val(),
            "product_features": features
        };

        var formData = new FormData();
        formData.append("product", new Blob([JSON.stringify(productData)], {type: "application/json"}));
        formData.append("imgUrl", imgDropzone.files[0]);
        formData.append("imgUrl", detailDropzone.files[0]);

        $.ajax({
            url: "${path}/admin/product/add",
            method: "POST",
            data: formData,
            contentType: false,
            processData: false,
            enctype: "multipart/form-data",
            success: function () {
                showModalMessage("상품 등록이 완료되었습니다.", function () {
                    location.reload();
                });
            },
            error: function () {
                showModalMessage("상품 등록에 실패하였습니다.")
            }
        });
    });
</script>
</body>
</html>
