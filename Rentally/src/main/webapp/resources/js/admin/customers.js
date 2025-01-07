function customers(path, page) {
    $.ajax({
        url: `${path}/admin/customer/pageable`,
        method: "GET",
        data: {"page": page},
        success: function (data) {
            console.log("data",data)
            console.log("data.content", data.content)
            $('#board_dataTable tbody').empty();
            $('#pagingUl').empty();
            $('#pagingCount').empty();

            if (data.content.length > 0) {
                data.content.forEach(customer => {
                    console.log(customer.product_seq);
                    $('#board_dataTable tbody').append(`
                    <tr>
                        <td>${customer.cust_id}</td>
                        <td>${customer.cust_name}</td>
                        <td>${customer.cust_email}</td>
                         <td>${customer.cust_phone}</td>
                    </tr>`);
                });
                pageBar(data);
            } else {
                $("#board_dataTable tbody").append('<tr><td colspan="6">데이터가 없습니다.</td></tr>');
            }
        }
    });
}