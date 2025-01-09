function initializePagination({
                                  path,
                                  onPageLoad,
                                  onParamChange,
                                  paramSelector,
                              }) {
    let page = 0;
    let additionalParam = paramSelector ? $(paramSelector).val() : null;

    $("#pagingBar").on("click", "a", function () {
        page = $(this).data("page");
        onPageLoad(path, page, additionalParam);
    });

    if (paramSelector && onParamChange) {
        $(paramSelector).on("change input", function () {
            page = 0;
            additionalParam = $(this).val();
            onParamChange(path, page, additionalParam);
        });
    }

    $(document).ready(function () {
        onPageLoad(path, page, additionalParam);
    });
}

function initializeDefaultPagination(path, callback) {
    initializePagination({
        path: path,
        onPageLoad: (path, page) => callback(path, page),
    });
}

function initializeRatingPagination(path) {
    initializePagination({
        path: path,
        onPageLoad: (path, page, rating) => loadReviewData(path, page, rating),
        onParamChange: (path, page, rating) => loadReviewData(path, page, rating),
        paramSelector: "#rating",
    });
}

function initializeSearchPagination(path) {
    initializePagination({
        path: path,
        onPageLoad: (path, page, keyword) => loadProductData(path, page, keyword),
        onParamChange: (path, page, keyword) => loadProductData(path, page, keyword),
        paramSelector: "#searchKeyWord",
    });
}
