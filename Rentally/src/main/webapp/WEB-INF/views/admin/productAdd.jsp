<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <link href="${path}/resources/libs/dropzone/dist/min/dropzone.min.css" rel="stylesheet"/>
    <title>Add Product Dashboard eCommerce HTML Template - FreshCart</title>
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
                                    <li class="breadcrumb-item"><a href="#" class="text-inherit">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="#" class="text-inherit">Products</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Add New Product</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="../product/list" class="btn btn-light">Back to Product</a>
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
                    <button id="btn_ajax" type="button" class="btn btn-primary">상품 등록</button>
                </div>
            </div>
        </div>
    </main>
</div>
<script> var contextPath = "${path}" </script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/libs/quill/dist/quill.min.js"></script>
<script src="${path}/resources/js/vendors/editor.js"></script>
<script src="${path}/resources/libs/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/resources/js/vendors/dropzone.js"></script>
<script>
    $('#features').on('input', function() {
        let lines = $(this).val().split("\n").slice(0, 3);
        $(this).val(lines.join("\n"));
    });
</script>
<script>
    $("#btn_ajax").on("click", f_jsonInsert);

    function f_jsonInsert() {
        var category = $('#category').val();
        var productSerial = $('#productSerial').val();
        var productName = $('#productName').val();
        var pay = $('#pay').val();
        var brand = $('#brand').val();
        var grade = $('#grade').val();
        var releaseDate = $('#date').val();
        var wide = $('#wide').val();
        var height = $('#height').val();
        var depth = $('#depth').val();
        var weight = $('#weight').val();
        var wh = $('#wh').val();
        var color = $('#color').val();
        var features = $('#features').val()
            .split("\n")
            .map(line => `#\${line.trim()}`)
            .join(" ");

        var productData = {
            "category_seq": category,
            "product_serial": productSerial,
            "product_name": productName,
            "product_pay": pay,
            "product_brand": brand,
            "product_grade": grade,
            "product_date": releaseDate,
            "product_height": wide + " x " + height + " x " + depth + " mm",
            "product_weight": weight + " kg ",
            "product_wh": wh + " wh ",
            "product_color": color,
            "product_features": features
        };
        
        var formData = new FormData();
        formData.append("product", new Blob([JSON.stringify(productData)], {type: "application/json"}));

        if (imgDropzone.files.length > 0) {
            formData.append("imgUrl", imgDropzone.files[0]);
        }
        if (detailDropzone.files.length > 0) {
            formData.append("imgUrl", detailDropzone.files[0]);
        }

        $.ajax({
            url: "${path}/admin/product/add",
            method: "POST",
            data: formData,
            contentType: false,
            processData: false,
            enctype: "multipart/form-data",
            success: function (response) {
                alert("등록 성공");
                location.reload();
            },
            error: function (xhr) {
                console.log(xhr);
            }
        });
    }
</script>
</body>
</html>
