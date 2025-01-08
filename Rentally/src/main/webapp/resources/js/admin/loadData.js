function loadDataGeneric(path, page, additionalParams, processContent) {
    $.ajax({
        url: path,
        method: "GET",
        data: { page, ...additionalParams },
        success: function (data) {
            $("#board_dataTable tbody").empty();
            $('#pagingUl').empty();
            $('#pagingCount').empty();

            if (data.content.length > 0) {
                data.content.forEach(item => processContent(item));
                pageBar(data.pageable, data.totalPages, data.totalElements);
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
                    <td><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${order.category_seq}/${order.product_img}" width="48" height="48"></td>
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
        { searchKeyWord: encodeURIComponent(searchKeyWord) },
        product => {
            $('#board_dataTable tbody').append(`
                <tr>
                    <td><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${product.category_seq}/${product.product_img}" width="48" height="48"></td>
                    <td class="product-name">${product.product_name}</td>
                    <td>${product.category_name}</td>
                    <td>${product.product_pay}원</td>
                    <td>${product.product_date}</td>
                    <td class="text-center">
                        <button onclick="deleteProduct(${product.product_seq})" class="btn btn-link p-0">
                        <i class="bi bi-trash me-3"></i>
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
        { rating },
        ({ product_seq, cust_id, review_content, review_rate, review_date }) => {
            const stars = Array.from({ length: 5 }, (_, i) =>
                `<span class="${i < review_rate ? 'text-warning' : 'text-light'}"><i class="bi bi-star-fill"></i></span>`
            ).join('');
            $('#board_dataTable tbody').append(`
                <tr>
                    <td>${product_seq}</td>
                    <td>${cust_id}</td>
                    <td class="review-content">${review_content}</td>
                    <td><div class="star-rating">${stars}</div></td>
                    <td>${review_date}</td>
                </tr>`);
        }
    );
}
