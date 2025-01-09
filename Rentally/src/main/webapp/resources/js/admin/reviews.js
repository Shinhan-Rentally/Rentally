function reviews(path, page) {
    rating = $("#rating").val();
    $.ajax({
        url: `${path}/admin/review/pageable`,
        method: "GET",
        data: {"page": page, "rating": rating},
        success: function (data) {
            console.log("data",data)
            $('#board_dataTable tbody').empty();
            $('#pagingUl').empty();
            $('#pagingCount').empty();

            if (data.content.length > 0) {
                data.content.forEach(({ product_seq, product_name, cust_id, review_content, review_rate, review_date }) => {
                    const stars = Array.from({ length: 5 }, (_, i) =>
                        `<span class="${i < review_rate ? 'text-warning' : 'text-light'}"><i class="bi bi-star-fill"></i></span>`
                    ).join('');
                    $('#board_dataTable tbody').append(`
                        <tr>
                            <td>${product_name}</td>
                            <td>${cust_id}</td>
                            <td>${review_content}</td>
                            <td><div class="star-rating">${stars}</div></td>
                            <td>${review_date}</td>
                        </tr>
                    `);
                });
                pageBar(data);
            } else {
                $("#board_dataTable tbody").append('<tr><td colspan="6">데이터가 없습니다.</td></tr>');
            }
        }
    });
}