
function loadDataGeneric(path, page, additionalParams, processContent) {
    $.ajax({
        url: path,
        method: "GET",
        data: {page, ...additionalParams},
        success: function (data) {
            $("#board_dataTable tbody").empty();
            $('#pagingUl').empty();
            $('#pagingCount').empty();

            if (data.content.length > 0) {
                data.content.forEach(item => processContent(item));
                pageBar(data.pageable.pageNumber, data.totalPages, data.totalElements);
            } else {
                $("#board_dataTable tbody").append('<tr><td colspan="6">데이터가 없습니다.</td></tr>');
            }
        }
    });
}

function loadCustomerData(path, page) {
    loadDataGeneric(
        `${path}/admin/customer/pageable`,
        page,
        {},
        customer => {
            $('#board_dataTable tbody').append(`
                <tr>
                    <td>${customer.cust_id}</td>
                    <td>${customer.cust_name}</td>
                    <td>${customer.cust_email}</td>
                    <td>${customer.cust_phone}</td>
                </tr>`);
        }
    );
}

function loadOrderData(path, page) {
    loadDataGeneric(
        `${path}/admin/order/pageable`,
        page,
        {},
        order => {
            $('#board_dataTable tbody').append(`
                <tr>
                    <td><img src="https://d14b80fsv1tvpk.cloudfront.net/${order.category_seq}/${order.product_img}?f=webp" width="48" height="48" alt="${order.product_name}"></td>
                    <td>${order.product_serial}</td>
                    <td>${order.cust_name}</td>
                    <td>${order.formattedSubDate}</td>
                    <td>${order.sub_card}</td>
                    <td>${order.sub_total.toLocaleString()}원</td>
                    <td>${order.end_date}</td>
                </tr>`);
        }
    );
}

function loadProductData(path, page, searchKeyWord) {
    loadDataGeneric(
        `${path}/admin/product/search`,
        page,
        {searchKeyWord: encodeURIComponent(searchKeyWord)},
        product => {
            $('#board_dataTable tbody').append(`
                <tr>
                    <td><img src="https://d14b80fsv1tvpk.cloudfront.net/${product.category_seq}/${product.product_img}?w=48&h=48&f=webp&q=80" width="48" height="48" alt="${product.product_name}"></td>
                        <td>${product.product_name}</td>
                        <td>${product.category_name}</td>
                        <td>${product.product_pay.toLocaleString()}원</td>
                        <td>${product.product_date}</td>
                        <td>
                        <button onclick="deleteProduct(${product.product_seq})"
                            title="Delete"
                            class="btn text-muted"
                            data-bs-toggle="tooltip"
                            data-bs-placement="top">
                            <i class="feather-icon icon-trash-2"></i>
                            </button>
                        </td>
                </tr>`);
        }
    );
}

function loadReviewData(path, page, rating) {
    loadDataGeneric(
        `${path}/admin/review/pageable`,
        page,
        {rating},
        ({review_seq, product_serial, cust_id, review_content, review_rate, review_date}) => {
            const stars = Array.from({length: 5}, (_, i) =>
                `<span class="${i < review_rate ? 'text-warning' : 'text-light'}"><i class="bi bi-star-fill"></i></span>`
            ).join('');
            $('#board_dataTable tbody').append(`
                <tr>
                    <td>${product_serial}</td>
                    <td>${cust_id}</td>
                    <td>
                    <div class="text-content" data-id="${review_seq}">
                        ${review_content}
                    </div>  
                    <div>
                        <a href="#" class="showMore" data-id="${review_seq}">더보기</a>
                    </div>
                    </td>
                    <td><div class="star-rating">${stars}</div></td>
                    <td>${review_date}</td>
                </tr>`);
        }
    );
}

