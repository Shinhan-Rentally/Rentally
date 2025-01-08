function search(path, page) {
    searchKeyWord = $("#searchKeyWord").val();

    $.ajax({
        url: `${path}/admin/product/search`,
        method: "GET",
        data: {"page": page, "searchKeyWord": encodeURIComponent(searchKeyWord)},
        success: function (data) {
            $("#board_dataTable tbody").empty();
            $('#pagingUl').empty();
            $('#pagingCount').empty();

            if (data.content.length > 0) {
                data.content.forEach(product => {
                    $('#board_dataTable tbody').append(`
                    <tr>
                        <td><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${product.category_seq}/${product.product_img}" width="48" height="48"></td>
                        <td class="product-name">${product.product_name}</td>
                        <td>${product.category_name}</td>
                        <td>${product.product_pay.toLocaleString()}원</td>
                        <td>${product.product_date}</td>
                        <td class="text-center">
                        <button onclick="deleteProduct(${product.product_seq})"
                            title="Delete"
                            class="btn text-muted"
                            data-bs-toggle="tooltip"
                            data-bs-placement="top">
                            <i class="feather-icon icon-trash-2"></i>
                            </button>
                            </td>
                    </tr>`);
                });
                pageBar(data);
            } else {
                $("#board_dataTable tbody").append('<tr><td colspan="6">데이터가 없습니다.</td></tr>');
            }
            $('[data-bs-toggle="tooltip"]').tooltip();
        }
    });
}