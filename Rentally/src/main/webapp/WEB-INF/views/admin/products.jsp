<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="application"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta content="Codescandy" name="author">
  <title>Products Dashboard eCommerce HTML Template - FreshCart</title>
  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">


  <!-- Libs CSS -->
  <link href="${path}/resources/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
  <link href="${path}/resources/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
  <link href="${path}/resources/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


  <!-- Theme CSS -->
  <link rel="stylesheet" href="${path}/resources/css/theme.css">
</head>

<body>
<!-- main wrapper-->

<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-glass">
  <div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center w-100">
      <div class="d-flex align-items-center">
        <a class="text-inherit d-block d-xl-none me-4" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
          <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-text-indent-right" viewBox="0 0 16 16">
            <path
                    d="M2 3.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm10.646 2.146a.5.5 0 0 1 .708.708L11.707 8l1.647 1.646a.5.5 0 0 1-.708.708l-2-2a.5.5 0 0 1 0-.708l2-2zM2 6.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"
            />
          </svg>
        </a>
      </div>
      <div>
        <ul class="list-unstyled d-flex align-items-center mb-0 ms-5 ms-lg-0">
          <li class="dropdown-center">
            <a class="position-relative btn-icon btn-ghost-secondary btn rounded-circle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="bi bi-bell fs-5"></i>
              <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger mt-2 ms-n2">
								2
								<span class="visually-hidden">unread messages</span>
							</span>
            </a>
            <div class="dropdown-menu dropdown-menu-end dropdown-menu-lg p-0 border-0">
              <div class="border-bottom p-5 d-flex justify-content-between align-items-center">
                <div>
                  <h5 class="mb-1">Notifications</h5>
                  <p class="mb-0 small">You have 2 unread messages</p>
                </div>
                <a href="#!" class="text-muted">
                  <a href="#" class="btn btn-ghost-secondary btn-icon rounded-circle" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="Mark all as read">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-check2-all text-success" viewBox="0 0 16 16">
                      <path
                              d="M12.354 4.354a.5.5 0 0 0-.708-.708L5 10.293 1.854 7.146a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0l7-7zm-4.208 7-.896-.897.707-.707.543.543 6.646-6.647a.5.5 0 0 1 .708.708l-7 7a.5.5 0 0 1-.708 0z"
                      />
                      <path d="m5.354 7.146.896.897-.707.707-.897-.896a.5.5 0 1 1 .708-.708z" />
                    </svg>
                  </a>
                </a>
              </div>
              <div data-simplebar style="height: 250px">
                <!-- List group -->
                <ul class="list-group list-group-flush notification-list-scroll fs-6">
                  <!-- List group item -->
                  <li class="list-group-item px-5 py-4 list-group-item-action active">
                    <a href="#!" class="text-muted">
                      <div class="d-flex">
                        <img src="../assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle" />
                        <div class="ms-4">
                          <p class="mb-1">
                            <span class="text-dark">Your order is placed</span>
                            waiting for shipping
                          </p>
                          <span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-clock text-muted" viewBox="0 0 16 16">
															<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z" />
															<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z" />
														</svg>
														<small class="ms-2">1 minute ago</small>
													</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li class="list-group-item px-5 py-4 list-group-item-action">
                    <a href="#!" class="text-muted">
                      <div class="d-flex">
                        <img src="../assets/images/avatar/avatar-5.jpg" alt="" class="avatar avatar-md rounded-circle" />
                        <div class="ms-4">
                          <p class="mb-1">
                            <span class="text-dark">Jitu Chauhan</span>
                            answered to your pending order list with notes
                          </p>
                          <span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-clock text-muted" viewBox="0 0 16 16">
															<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z" />
															<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z" />
														</svg>
														<small class="ms-2">2 days ago</small>
													</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <li class="list-group-item px-5 py-4 list-group-item-action">
                    <a href="#!" class="text-muted">
                      <div class="d-flex">
                        <img src="../assets/images/avatar/avatar-2.jpg" alt="" class="avatar avatar-md rounded-circle" />
                        <div class="ms-4">
                          <p class="mb-1">
                            <span class="text-dark">You have new messages</span>
                            2 unread messages
                          </p>
                          <span>
														<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-clock text-muted" viewBox="0 0 16 16">
															<path d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z" />
															<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z" />
														</svg>
														<small class="ms-2">3 days ago</small>
													</span>
                        </div>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
              <div class="border-top px-5 py-4 text-center">
                <a href="#!">View All</a>
              </div>
            </div>
          </li>
          <li class="dropdown ms-4">
            <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="../assets/images/avatar/avatar-1.jpg" alt="" class="avatar avatar-md rounded-circle" />
            </a>

            <div class="dropdown-menu dropdown-menu-end p-0">
              <div class="lh-1 px-5 py-4 border-bottom">
                <h5 class="mb-1 h6">FreshCart Admin</h5>
                <small>admindemo@email.com</small>
              </div>

              <ul class="list-unstyled px-2 py-3">
                <li>
                  <a class="dropdown-item" href="#!">Home</a>
                </li>
                <li>
                  <a class="dropdown-item" href="#!">Profile</a>
                </li>

                <li>
                  <a class="dropdown-item" href="#!">Settings</a>
                </li>
              </ul>
              <div class="border-top px-5 py-3">
                <a href="#">Log Out</a>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>

<div class="main-wrapper">
  <!-- navbar vertical -->
  <!-- navbar -->
  <nav class="navbar-vertical-nav d-none d-xl-block">
    <div class="navbar-vertical">
      <div class="px-4 py-5">
        <a href="../index.html" class="navbar-brand">
          <img src="../assets/images/logo/freshcart-logo.svg" alt="" />
        </a>
      </div>
      <div class="navbar-vertical-content flex-grow-1" data-simplebar="">
        <ul class="navbar-nav flex-column" id="sideNavbar">
          <li class="nav-item">
            <a class="nav-link " href="../dashboard/index.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-house"></i></span>
                <span class="nav-link-text">Dashboard</span>
              </div>
            </a>
          </li>
          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Store Managements</span>
          </li>
          <li class="nav-item">
            <a class="nav-link  active " href="../dashboard/products.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-cart"></i></span>
                <span class="nav-link-text">Products</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../dashboard/categories.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-list-task"></i></span>
                <span class="nav-link-text">Categories</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a
                    class="nav-link  collapsed "
                    href="#"
                    data-bs-toggle="collapse"
                    data-bs-target="#navCategoriesOrders"
                    aria-expanded="false"
                    aria-controls="navCategoriesOrders"
            >
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-bag"></i></span>
                <span class="nav-link-text">Orders</span>
              </div>
            </a>
            <div id="navCategoriesOrders" class="collapse " data-bs-parent="#sideNavbar">
              <ul class="nav flex-column">
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/order-list.html">List</a>
                </li>
                <!-- Nav item -->
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/order-single.html">Single</a>
                </li>
              </ul>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link " href="../dashboard/vendor-grid.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-shop"></i></span>
                <span class="nav-link-text">Sellers / Vendors</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a
                    class="nav-link  collapsed "
                    href="#"
                    data-bs-toggle="collapse"
                    data-bs-target="#navCustomer"
                    aria-expanded="false"
                    aria-controls="navCustomer"
            >
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-people"></i></span>
                <span class="nav-link-text">Customers</span>
                <span class="badge bg-light-success text-dark-success ms-2">New</span>
              </div>
            </a>
            <div id="navCustomer" class="collapse " data-bs-parent="#sideNavbar">
              <ul class="nav flex-column">
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/customers.html">Customers</a>
                </li>
                <!-- Nav item -->
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/create-customers.html">Create Customers</a>
                </li>
                <!-- Nav item -->
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/customers-edits.html">Edit Customers</a>
                </li>
              </ul>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link " href="../dashboard/reviews.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-star"></i></span>
                <span class="nav-link-text">Reviews</span>
              </div>
            </a>
          </li>
          <!-- Nav item -->
          <li class="nav-item">
            <a
                    class="nav-link  collapsed "
                    href="#"
                    data-bs-toggle="collapse"
                    data-bs-target="#navMenuLevelFirst"
                    aria-expanded="false"
                    aria-controls="navMenuLevelFirst"
            >
              <span class="nav-link-icon"><i class="bi bi-arrow-90deg-down"></i></span>
              <span class="nav-link-text">Menu Level</span>
            </a>
            <div id="navMenuLevelFirst" class="collapse " data-bs-parent="#sideNavbar">
              <ul class="nav flex-column">
                <li class="nav-item">
                  <a
                          class="nav-link "
                          href="#"
                          data-bs-toggle="collapse"
                          data-bs-target="#navMenuLevelSecond1"
                          aria-expanded="false"
                          aria-controls="navMenuLevelSecond1"
                  >
                    Two Level
                  </a>
                  <div id="navMenuLevelSecond1" class="collapse" data-bs-parent="#navMenuLevel">
                    <ul class="nav flex-column">
                      <li class="nav-item">
                        <a class="nav-link " href="#">NavItem 1</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " href="#">NavItem 2</a>
                      </li>
                    </ul>
                  </div>
                </li>
                <li class="nav-item">
                  <a
                          class="nav-link  collapsed "
                          href="#"
                          data-bs-toggle="collapse"
                          data-bs-target="#navMenuLevelThreeOne1"
                          aria-expanded="false"
                          aria-controls="navMenuLevelThreeOne1"
                  >
                    Three Level
                  </a>
                  <div id="navMenuLevelThreeOne1" class="collapse " data-bs-parent="#navMenuLevel">
                    <ul class="nav flex-column">
                      <li class="nav-item">
                        <a
                                class="nav-link  collapsed "
                                href="#"
                                data-bs-toggle="collapse"
                                data-bs-target="#navMenuLevelThreeTwo"
                                aria-expanded="false"
                                aria-controls="navMenuLevelThreeTwo"
                        >
                          NavItem 1
                        </a>
                        <div id="navMenuLevelThreeTwo" class="collapse collapse " data-bs-parent="#navMenuLevelThree">
                          <ul class="nav flex-column">
                            <li class="nav-item">
                              <a class="nav-link " href="#">NavChild Item 1</a>
                            </li>
                          </ul>
                        </div>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " href="#">Nav Item 2</a>
                      </li>
                    </ul>
                  </div>
                </li>
              </ul>
            </div>
          </li>

          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Site Settings</span>
            <span class="badge bg-light-info text-dark-info">Coming Soon</span>
          </li>
          <li class="nav-item">
            <a class="nav-link  collapsed " href="#" data-bs-toggle="collapse" data-bs-target="#navBlog" aria-expanded="false" aria-controls="navBlog">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-newspaper"></i></span>
                <span class="nav-link-text">Blog</span>
                <span class="badge bg-light-success text-dark-success ms-2">New</span>
              </div>
            </a>
            <div id="navBlog" class="collapse " data-bs-parent="#sideNavbar">
              <ul class="nav flex-column">
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/blog-grid.html">Grid</a>
                </li>
                <!-- Nav item -->
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/blog-list.html">List</a>
                </li>
                <!-- Nav item -->
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/blog-new-post.html">Add Post</a>
                </li>
              </ul>
            </div>
          </li>

          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-images"></i></span>
                <span class="nav-link-text">Media</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-gear"></i></span>
                <span class="nav-link-text">Store Settings</span>
              </div>
            </a>
          </li>

          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Support</span>
            <span class="badge bg-light-info text-dark-info">Coming Soon</span>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-headphones"></i></span>
                <span class="nav-link-text">Support Ticket</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-question-circle"></i></span>
                <span class="nav-link-text">Help Center</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-infinity"></i></span>
                <span class="nav-link-text">How FreshCart Works</span>
              </div>
            </a>
          </li>

          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Our Apps</span>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-apple"></i></span>
                <span class="nav-link-text">Apple Store</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-google-play"></i></span>
                <span class="nav-link-text">Google Play Store</span>
              </div>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <nav class="navbar-vertical-nav offcanvas offcanvas-start navbar-offcanvac" tabindex="-1" id="offcanvasExample">
    <div class="navbar-vertical">
      <div class="px-4 py-5 d-flex justify-content-between align-items-center">
        <a href="../index.html" class="navbar-brand">
          <img src="../assets/images/logo/freshcart-logo.svg" alt="" />
        </a>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="navbar-vertical-content flex-grow-1" data-simplebar="">
        <ul class="navbar-nav flex-column">
          <li class="nav-item">
            <a class="nav-link " href="../dashboard/index.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-house"></i></span>
                <span>Dashboard</span>
              </div>
            </a>
          </li>
          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Store Managements</span>
          </li>
          <li class="nav-item">
            <a class="nav-link  active " href="../dashboard/products.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-cart"></i></span>
                <span class="nav-link-text">Products</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../dashboard/categories.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-list-task"></i></span>
                <span class="nav-link-text">Categories</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link  collapsed " href="#" data-bs-toggle="collapse" data-bs-target="#navOrders" aria-expanded="false" aria-controls="navOrders">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-bag"></i></span>
                <span class="nav-link-text">Orders</span>
              </div>
            </a>
            <div id="navOrders" class="collapse " data-bs-parent="#sideNavbar">
              <ul class="nav flex-column">
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/order-list.html">List</a>
                </li>
                <!-- Nav item -->
                <li class="nav-item">
                  <a class="nav-link " href="../dashboard/order-single.html">Single</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../dashboard/vendor-grid.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-shop"></i></span>
                <span class="nav-link-text">Sellers / Vendors</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../dashboard/customers.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-people"></i></span>
                <span class="nav-link-text">Customers</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="../dashboard/reviews.html">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-star"></i></span>
                <span class="nav-link-text">Reviews</span>
              </div>
            </a>
          </li>
          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Site Settings</span>
            <span class="badge bg-light-info text-dark-info">Coming Soon</span>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-newspaper"></i></span>
                <span class="nav-link-text">Blog</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-images"></i></span>
                <span class="nav-link-text">Media</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-gear"></i></span>
                <span class="nav-link-text">Store Settings</span>
              </div>
            </a>
          </li>
          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Support</span>
            <span class="badge bg-light-info text-dark-info">Coming Soon</span>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-headphones"></i></span>
                <span class="nav-link-text">Support Ticket</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-question-circle"></i></span>
                <span class="nav-link-text">Help Center</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-infinity"></i></span>
                <span class="nav-link-text">How FreshCart Works</span>
              </div>
            </a>
          </li>

          <li class="nav-item mt-6 mb-3">
            <span class="nav-label">Our Apps</span>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-apple"></i></span>
                <span class="nav-link-text">Apple Store</span>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" href="#!">
              <div class="d-flex align-items-center">
                <span class="nav-link-icon"><i class="bi bi-google-play"></i></span>
                <span class="nav-link-text">Google Play Store</span>
              </div>
            </a>
          </li>
          <li id="navMenuLevel" class="collapse " data-bs-parent="#sideNavbar">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a
                        class="nav-link "
                        href="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#navMenuLevelSecond2"
                        aria-expanded="false"
                        aria-controls="navMenuLevelSecond2"
                >
                  Two Level
                </a>
                <div id="navMenuLevelSecond2" class="collapse" data-bs-parent="#navMenuLevel">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link " href="#">NavItem 1</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="#">NavItem 2</a>
                    </li>
                  </ul>
                </div>
              </li>
              <li class="nav-item">
                <a
                        class="nav-link  collapsed "
                        href="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#navMenuLevelThree2"
                        aria-expanded="false"
                        aria-controls="navMenuLevelThree2"
                >
                  Three Level
                </a>
                <div id="navMenuLevelThree2" class="collapse " data-bs-parent="#navMenuLevel">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a
                              class="nav-link  collapsed "
                              href="#"
                              data-bs-toggle="collapse"
                              data-bs-target="#navMenuLevelThree3"
                              aria-expanded="false"
                              aria-controls="navMenuLevelThree3"
                      >
                        NavItem 1
                      </a>
                      <div id="navMenuLevelThree3" class="collapse collapse " data-bs-parent="#navMenuLevelThree">
                        <ul class="nav flex-column">
                          <li class="nav-item">
                            <a class="nav-link " href="#">NavChild Item 1</a>
                          </li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link " href="#">Nav Item 2</a>
                    </li>
                  </ul>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- main -->
  <main class="main-content-wrapper">
    <div class="container">
      <div class="row mb-8">
        <div class="col-md-12">
          <!-- page header -->
          <div class="d-md-flex justify-content-between align-items-center">
            <div>
              <h2>Products</h2>
              <!-- breacrumb -->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                  <li class="breadcrumb-item"><a href="#" class="text-inherit">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Products</li>
                </ol>
              </nav>
            </div>
            <!-- button -->
            <div>
              <a href="add-product.html" class="btn btn-primary">Add Product</a>
            </div>
          </div>
        </div>
      </div>
      <!-- row -->
      <div class="row">
        <div class="col-xl-12 col-12 mb-5">
          <!-- card -->
          <div class="card h-100 card-lg">
            <div class="px-6 py-6">
              <div class="row justify-content-between">
                <!-- form -->
                <div class="col-lg-4 col-md-6 col-12 mb-2 mb-lg-0">
                  <form class="d-flex" role="search">
                    <input class="form-control" type="search" placeholder="Search Products" aria-label="Search" />
                  </form>
                </div>
              </div>
            </div>
            <!-- card body -->
            <div class="card-body p-0">
              <!-- table -->
              <div class="table-responsive">
                <table class="table table-centered table-hover text-nowrap table-borderless mb-0 table-with-checkbox">
                  <thead class="bg-light">
                  <tr>
                    <th>Image</th>
                    <th>Proudct Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Create at</th>
                    <th>Remove</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${products}" var="product">
                    <tr class="table">
                      <td><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${product.category_seq}/${product.product_img}" width="48" height="48"></td>
                      <td>${product.product_name}</td>
                      <td>${product.category_seq}</td>
                      <td><fmt:formatNumber value="${product.product_pay}" type="number" pattern="#,###"/>원</td>
                      <td>${product.product_date}</td>
                      <td class="text-center">
                        <button class="btn btn-link p-0" onclick="deleteProduct(${product.product_seq})">
                          <i class="bi bi-trash me-3"></i>
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer d-flex justify-content-between align-items-center p-4">
              <span>Showing ${currentPage * 10 - 9} to ${currentPage * 10 > totalOrders ? totalOrders : currentPage * 10} of ${totalOrders} entries</span>
              <nav>
                <ul class="pagination mb-0">
                  <!-- Previous Button -->
                  <c:if test="${currentPage > 1}">
                    <li class="page-item">
                      <a class="page-link" href="../product/list?page=${currentPage - 1}&size=10">Previous</a>
                    </li>
                  </c:if>

                  <!-- Page Numbers -->
                  <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                      <a class="page-link" href="../product/list?page=${i}&size=10">${i}</a>
                    </li>
                  </c:forEach>

                  <!-- Next Button -->
                  <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                      <a class="page-link" href="../product/list?page=${currentPage + 1}&size=10">Next</a>
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
<script src="${path}/resources/js/theme.min.js"></script>

</body>
</html>
