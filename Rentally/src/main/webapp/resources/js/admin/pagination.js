function pageBar(pageNumber, totalPages, totalElements) {

    $('#pagingCount').text(`total ${totalElements}`);
    $('#pagingUl').empty();

    let startPage = Math.floor(pageNumber / 5) * 5;
    let endPage = Math.min(startPage + 5, totalPages);

    if (pageNumber > 0) addPaginationButton('이전', pageNumber - 1);
    for (let i = startPage; i < endPage; i++) {
        addPaginationButton(i + 1, i, i === pageNumber ? 'active' : '');
    }
    if (endPage < totalPages) addPaginationButton('다음', endPage);
}

function addPaginationButton(label, page, extraClass = '') {
    $('#pagingUl').append(`
    <li class="page-item ${extraClass}">
        <a href="#" class="page-link" data-page="${page}">${label}</a>
    </li>
`);
}
