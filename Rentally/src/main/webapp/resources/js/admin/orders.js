function orders(path, page) {
    $.ajax({
        url: `${path}/admin/order/pageable`,
        method: "GET",
        data: {"page": page},
        success: function (data) {
            $("#board_dataTable tbody").empty();
            $('#pagingUl').empty();
            $('#pagingCount').empty();

            if (data.content.length > 0) {
                data.content.forEach(order => {
                    console.log(orders.product_seq);
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
                });
                pageBar(data);
            } else {
                $("#board_dataTable tbody").append('<tr><td colspan="6">데이터가 없습니다.</td></tr>');
            }
        }
    });
}