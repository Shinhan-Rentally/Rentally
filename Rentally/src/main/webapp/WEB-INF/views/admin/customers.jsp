<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="page" value="customers" />
<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="application"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta content="Codescandy" name="author">
  <title>Customers Dashboard eCommerce HTML Template - FreshCart</title>
  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">


  <!-- Libs CSS -->
  <link href="${path}/resources/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
  <link href="${path}/resources/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
  <link href="${path}/resources/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


  <!-- Theme CSS -->
  <link rel="stylesheet" href="${path}/resources/css/theme.css">
  <style>
    /* Equal width for all columns */
    .table-column {
      width: 25%; /* Equal width for all columns */
      text-align: center; /* Center align text in the header */
    }

    /* Center align text for table cells (data rows) */
    .table td {
      text-align: center;
    }

    /* Center align text for table headers */
    .table th {
      text-align: center;
    }
  </style>
</head>

<body>
<%@ include file="../common/adminTopNavbar.jsp" %>
<div class="main-wrapper">
  <%@ include file="../common/adminNavbar.jsp" %>
  <main class="main-content-wrapper">
    <div class="container">
      <div class="row mb-8">
        <div class="col-md-12">
          <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-4">
            <div>
              <h2>Customers</h2>
              <!-- Breadcrumb -->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                  <li class="breadcrumb-item"><a href="#" class="text-inherit">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Customers</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>

      <!-- Customer Table Section -->
      <div class="row">
        <div class="col-xl-12 col-12 mb-5">
          <div class="card h-100 card-lg">
            <div class="p-6">
              <!-- Optional content for the row, add any action buttons or filters here -->
              <div class="row justify-content-between"></div>
            </div>

            <div class="card-body p-0">
              <div class="table-responsive">
                <table class="table table-centered table-hover table-borderless mb-0 table-with-checkbox text-nowrap">
                  <thead class="bg-light">
                  <tr>
                    <th class="table-column">ID</th>
                    <th class="table-column">Name</th>
                    <th class="table-column">Email</th>
                    <th class="table-column">Phone</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${customers}" var="customer">
                    <tr class="table">
                      <td>${customer.cust_id}</td>
                      <td>${customer.cust_name}</td>
                      <td>${customer.cust_email}</td>
                      <td>${customer.cust_phone}</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>

            <!-- Pagination Section -->
            <div class="card-footer d-flex justify-content-between align-items-center p-4">
              <span>Showing ${currentPage * 10 - 9} to ${currentPage * 10 > totalOrders ? totalOrders : currentPage * 10} of ${totalOrders} entries</span>
              <nav>
                <ul class="pagination mb-0">
                  <!-- Previous Button -->
                  <c:if test="${currentPage > 1}">
                    <li class="page-item">
                      <a class="page-link" href="../customers/list?page=${currentPage - 1}&size=10">Previous</a>
                    </li>
                  </c:if>

                  <!-- Page Numbers -->
                  <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                      <a class="page-link" href="../customers/list?page=${i}&size=10">${i}</a>
                    </li>
                  </c:forEach>

                  <!-- Next Button -->
                  <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                      <a class="page-link" href="../customers/list?page=${currentPage + 1}&size=10">Next</a>
                    </li>
                  </c:if>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>

  <!-- Libs JS -->
  <!-- <script src="../assets/libs/jquery/dist/jquery.min.js"></script> -->
  <script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>

  <!-- Theme JS -->
  <script src="${path}/resources/css/theme.min.js"></script>
</body>
</html>
