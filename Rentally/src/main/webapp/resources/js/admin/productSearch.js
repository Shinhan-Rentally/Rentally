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
                    console.log(product.product_seq);
                    $('#board_dataTable tbody').append(`
                    <tr>
                        <td><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${product.category_seq}/${product.product_img}" width="48" height="48"></td>
                        <td class="product-name">${product.product_name}</td>
                        <td>${product.category_name}</td>
                        <td>${product.product_pay}원</td>
                        <td>${product.product_date}</td>
                        <td class="text-center">
                            <form action="${path}/admin/${product.product_seq}/delete" method="post">
                                <input type="hidden" name="productSeq" value="${product.product_seq}">
                                <button class="btn btn-link p-0">
                                    <i class="bi bi-trash me-3"></i>
                                </button>
                            </form>
                        </td>
                    </tr>`);
                });
                pageBar(data);
            } else {
                $("#board_dataTable tbody").append('<tr><td colspan="6">데이터가 없습니다.</td></tr>');
            }
        }
    });
}