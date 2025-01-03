<div class="card-footer d-flex justify-content-between align-items-center p-4">
  <span>
    Showing ${currentPage * 10 - 9} to ${currentPage * 10 > totalDatas ? totalDatas : currentPage * 10} of ${totalDatas} entries
  </span>
  <nav>
    <ul class="pagination mb-0">
      <c:if test="${currentPage > 1}">
        <li class="page-item">
          <a class="page-link" href="${baseUrl}?page=${currentPage - 1}&size=10">Previous</a>
        </li>
      </c:if>

      <c:set var="startPage" value="${currentPage > 3 ? currentPage - 2 : 1}" />
      <c:set var="endPage" value="${currentPage + 3 > totalPages ? totalPages : currentPage + 3}" />
      <c:if test="${endPage - startPage < 5}">
        <c:set var="startPage" value="${endPage - 5 > 1 ? endPage - 5 : 1}" />
        <c:set var="endPage" value="${startPage + 5 < totalPages ? startPage + 5 : totalPages}" />
      </c:if>

      <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <li class="page-item ${currentPage == i ? 'active' : ''}">
          <a class="page-link" href="${baseUrl}?page=${i}&size=10">${i}</a>
        </li>
      </c:forEach>

      <c:if test="${currentPage < totalPages}">
        <li class="page-item">
          <a class="page-link" href="${baseUrl}?page=${currentPage + 1}&size=10">Next</a>
        </li>
      </c:if>
    </ul>
  </nav>
</div>
