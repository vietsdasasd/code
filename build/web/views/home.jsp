<%-- 
    Document   : home.jsp
    Created on : 10 Jan, 2024, 10:09:48 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="constant.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <section id="header">
            <div class="container h-100">
                <div class="row align-items-center h-100">
                    <div class="col-sm-1 col-md-2 logo-box">
                        <div class="header-logo">
                            <a href="home">
                                <span class="header-logo_name">Sell-phone</span>
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAIAAAC2BqGFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTFGN0JGRkVDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTFGN0JGRkZDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1MUY3QkZGQ0MwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1MUY3QkZGREMwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgpTqXEAAAhlSURBVHja7JwLbBTH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"
                                     alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-sm-5 col-md-5 search-box">
                        <div class="input-box">
                            <div class="search-icon">
                                <i class='bx bx-search'></i>
                            </div>
                            <div class="search-input">
                                <input type="text" placeholder="Search for products, brands and more"
                                       aria-label="Example text with button addon">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-5 col-md-4 nav-menu_box">
                        <div class="row">
                            <div class="col">
                                <div class="user-status">
                                    <div class="user-logo">
                                        <i class='bx bx-user'></i>
                                    </div>
                                    <span class="user-title">Profile</span>
                                    <div class="user-box_access">
                                        <div class="user-box-header">
                                            <!-- access -->
                                            <!-- <div class="user-access">
                                                <a href="/profile.html" class="d-block">
                                                    <img src="https://images.unsplash.com/photo-1639149888905-fb39731f2e6c?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                                                        alt="">
                                                </a>
                                                <div class="user-access-info">
                                                    <span>Eden Smith</span>
                                                    <p>Los Angeles, CA</p>
                                                </div>
                                                <a href="#" class="logout-link">
                                                    <div class="logout-button">
                                                        Logout
                                                    </div>
                                                </a>
                                            </div> -->

                                            <!-- not access -->
                                            <div class="user-not-access">
                                                <span class="not-access-title">Wellcome</span>
                                                <p>To access account and manage orders</p>
                                                <a href="#" class="login-link">
                                                    <div class="login-button">
                                                        Login / Signup
                                                    </div>
                                                </a>
                                            </div>

                                        </div>
                                        <hr>
                                        <ul class="user-access-link">
                                            <li><a href="#">Orders</a></li>
                                            <li><a href="#">Wishlist</a></li>
                                            <li><a href="#">Gift Cards</a></li>
                                            <li><a href="#">Contact Us</a></li>
                                            <li class="access-new">
                                                <a href="#">Myntra Insider</a>
                                                <div class="special">New</div>
                                            </li>
                                        </ul>
                                        <hr>
                                        <ul class="page-access-link">
                                            <li><a href="#">Myntra Credit</a></li>
                                            <li><a href="#">Coupons</a></li>
                                            <li><a href="#">Saved Cards</a></li>
                                            <li><a href="#">Saved VPA</a></li>
                                            <li><a href="#">Saved Addresses</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="message-status">
                                    <div class="bell-logo">
                                        <i class='bx bx-bell'></i>
                                    </div>
                                    <span class="love-title">Notification
                                    </span>
                                </div>
                            </div>
                            <div class="col">
                                <a href="cartegories.html" class="d-block">
                                    <div class="cart-status">
                                        <div class="cart-logo">
                                            <i class='bx bx-shopping-bag'></i>
                                        </div>
                                        <span class="cart-title">Bag 0</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-1 left-nav_btn col-md-1 d-lg-none">
                        <i class='bx bx-menu'></i>
                    </div>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="address-page">
                <ul class="d-flex align-items-center m-0 py-3">
                    <li>
                        <a class="fs-4 me-2 text-black" href="">Trang chủ /
                        </a>
                    </li>
                    <li>
                        <a class="fs-4 text-black" href="">Điện thoại
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <section id="banner">
            <div class="container">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="slider-img">
                                <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/30/638369652344377455_F-C1_1200x300.png"
                                     alt="">
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="slider-img">
                                <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/12/25/638391402656881945_F-C1_1200x300.png"
                                     alt="">
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="slider-img">
                                <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/12/25/638391402656881945_F-C1_1200x300.png"
                                     alt="">
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="slider-img">
                                <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/12/25/638391455017222069_F-C1_1200x300@2x.png"
                                     alt="">
                            </div>
                        </div>
                    </div>
                    <div class="swiper-button-next">

                    </div>
                    <div class="swiper-button-prev">

                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </section>
        <section id="body" class="mt-5 container">
            <div class="h-100 mt-5">
                <div class="row box-fashion d-flex">
                    <div class="left-nav">
                        <div class="list-filter bg-white">
                            <div class="filter-header">
                                <h4>Filters</h4>
                            </div>
                            <div class="boder p-4">
                                <div class="">
                                    <h3 class="text-uppercase fs-5 fw-bold">Hãng sản xuất: </h3>
                                </div>
                                <ul class="list-filter_product mt-3">
                                    <c:forEach var="cat" items="${listCategory}">
                                    <li class="filter-brand_item">
                                        <div class="filter-brand_head">
                                            <span>${cat.categoriesName}</span>
                                            <i class='bx bx-plus icon-filter'></i>
                                        </div>
                                        <ul class="list-filter_child">
                                            <li>
                                                <a href="">Iphone X</a>
                                            </li>
                                            <li>
                                                <a href="">Iphone 12</a>
                                            </li>
                                            <li>
                                                <a href="">Iphone 13</a>
                                            </li>
                                        </ul>
                                    </li>   
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="boder p-4">
                                <div class="">
                                    <h3 class="text-uppercase fs-5 fw-bold">Mức giá: </h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="checkbox" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">Tất cả</label>
                                    </div>
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="checkbox" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">Dưới 2 triệu</label>
                                    </div>
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="checkbox" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">Từ 2 - 4 triệu</label>
                                    </div>
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="checkbox" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">
                                            Từ 4 - 7 triệu</label>
                                    </div>
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="checkbox" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">Trên 13 triệu</label>
                                    </div>
                                </div>
                            </div>
                            <div class="boder p-4">
                                <div class="">
                                    <h3 class="text-uppercase fs-5 fw-bold">Giảm giá: </h3>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="radio" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect"> dưới 10%</label>
                                    </div>
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="radio" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">15%</label>
                                    </div>
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="radio" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">20%</label>
                                    </div>
                                    <div class="col-md-12 d-flex align-items-center mt-3">
                                        <input class="me-3 pointer" type="radio" class="custom-radio" name="manType"
                                               id="manSelect">
                                        <label class="fs-5 pointer" for="manSelect">30%</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="right-product h-100">
                        <div class="card-body">
                            <h1 class="d-inline fw-bold">Điện thoại</h1><span class="ms-3 fs-3 text-muted">(21 sản
                                phẩm)</span>
                            <div class="d-flex align-items-center">
                                <span class="fs-3 text-muted me-4">Lọc theo: </span>
                                <div class="mt-3 d-flex flex-wrap gap-2">
                                    <div class="filter-tag me-3">
                                        <a href="">
                                            <h2 class="mb-0">Samsung</h2>
                                            <i class='bx bx-x'></i>
                                        </a>
                                    </div>
                                    <div class="filter-tag me-3">
                                        <a href="">
                                            <h2 class="mb-0">Từ 2 - 4 triệu
                                            </h2>
                                            <i class='bx bx-x'></i>
                                        </a>
                                    </div>
                                    <div class="filter-tag me-3">
                                        <a href="">
                                            <h2 class="mb-0">Xóa tất cả</h2>
                                            <i class='bx bx-x'></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-white mt-4 p-4">
                            <div class="sort-search">
                                <div class="d-flex align-items-center">
                                    <span class="title-filter">Ưu tiên xem:</span>
                                    <ul class="filter-views mb-0">
                                        <li class="filter-views_item">
                                            <a href="">Bán chạy nhất</a>
                                        </li>
                                        <li class="filter-views_item choice_filter">
                                            <a href="">Giá thấp</a>
                                        </li>
                                        <li class="filter-views_item">
                                            <a href="">Giá cao</a>
                                        </li>
                                        <li class="filter-views_item">
                                            <a href="">Ưu đãi online</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="sort-box">
                                    <div class="">
                                        <select class="form-select">
                                            <option value="1" class="py-5">What's new</option>
                                            <option value="2" class="py-5">Popularity</option>
                                            <option value="3" class="py-5">Best Discount</option>
                                            <option value="3" class="py-5">Price: Hight To Low</option>
                                            <option value="3" class="py-5">Price: Low To Hight</option>
                                        </select>
                                    </div>
                                    <div class="list-grid">
                                        <span class="grid-item choice_sort">
                                            <i class='bx bxs-grid'></i>
                                        </span>
                                        <span class="grid-item">
                                            <i class='bx bx-list-ul'></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-md-4 g-sm-2 mt-5">
                                <c:forEach items="${requestScope.listProduct}" var="product">
                                    <c:if test="${requestScope.isActive != true}">
                                        <div class="col-sm-6 col-md-4">
                                            <div class="product-item">
                                                <div class="position-relative " style="height: 300px; object-fit: cover">
                                                    <a href="ProductServlet?Service=proDetail&proId=${product.getProductId()}" class="d-block text-decoration-none">
                                                        <img src="${IConstant.pathProduct}/${product.getImagePath()}" alt="" class="overflow-hidden">
                                                    </a>
                                                    <div class="d-flex justify-content-center align-items-center px-3 button-products">
                                                        <button class="button-product me-3">
                                                            <i class='bx bx-shopping-bag'></i>
                                                            &ensp; Add to cart
                                                        </button>
                                                        <button class="button-product me-3">
                                                            <i class="fa-solid fa-arrows-up-down-left-right"></i>
                                                            &ensp; Qick view
                                                        </button>
                                                    </div>
                                                    <div class="product-sale">
                                                        <div class="product-sale_tag">
                                                            <div class="product-sale_header">
                                                            </div>
                                                            <div class="product-sale_content">
                                                                <p class="mb-0">Giảm ${product.discount}%</p>
                                                            </div>
                                                            <div class="product-sale_triangle">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="p-4 d-flex flex-column">
                                                    <h3 class="fw-bold text-black product-title">${product.productName}</h3>
                                                    <div class="product-item_memory">
                                                        <div class="memory_item choice_view">
                                                            <strong>128GB</strong>
                                                        </div>
                                                        <div class="memory_item">
                                                            <strong>256GB</strong>
                                                        </div>
                                                        <div class="memory_item">
                                                            <strong>1TB</strong>
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="mt-5 d-flex align-items-center justify-content-between flex-wrap text-center">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <span class="product-price">${product.getPriceAfterDiscount()}₫</span>
                                                        </div>
                                                        <div class="">
                                                            <p class="text-decoration-line-through text-black fs-4 mb-0">${product.getPrice()}₫
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <ul class="product-item_info mt-4">
                                                        <li>
                                                            <i class='bx bxs-microchip'></i>
                                                            <span>Helio G856.74</span>
                                                        </li>
                                                        <li>
                                                            <i class='bx bx-mobile'></i>
                                                            <span>inch6</span>
                                                        </li>
                                                        <li>
                                                            <i class='bx bx-chip'></i>
                                                            <span>128 GB</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="paging mt-5">
                                <div class="paging-box d-flex">
                                    <span class="prev-paging"><i class='bx bx-chevron-left unclick'></i></span>
                                    <span class="number-paging current-paging">1</span>
                                    <span class="number-paging">2</span>
                                    <span class="number-paging">3</span>
                                    <span class="number-paging">4</span>
                                    <span class="next-paging"><i class='bx bx-chevron-right'></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="footer" class="mt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-4 position-relative">
                    <h4 class="fw-bold mb-4">Contact</h4>
                    <p class="fs-4"><strong>Address:</strong> 562 Wellington Road Street 32, San Fransica</p>
                    <p class="fs-4"><strong>Phone:</strong> +01 2222 365 /(+91) 01 2345 6329</p>
                    <p class="fs-4"><strong>Hours:</strong> 10:00 - 18:00, Mon - Sat</p>
                    <div class="follow">
                        <h4>Follow Us</h4>
                        <div class="icons mt-5">
                            <i class="bx bxl-facebook me-2 fs-3"></i>
                            <i class="bx bxl-twitter me-2 fs-3"></i>
                            <i class="bx bxl-instagram me-2 fs-3"></i>
                            <i class="bx bxl-pinterest-alt me-2 fs-3"></i>
                            <i class="bx bxl-youtube me-2 fs-3"></i>
                        </div>
                    </div>
                    <div class="footer-logo">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAIAAAC2BqGFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTFGN0JGRkVDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTFGN0JGRkZDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1MUY3QkZGQ0MwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1MUY3QkZGREMwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgpTqXEAAAhlSURBVHja7JwLbBTH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"
                             class="" alt="">
                    </div>
                </div>
                <div class="col-md-2">
                    <h4 class="fw-bold mb-4">About</h4>
                    <ul>
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Delivery Inforation</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms &amp; Conditions</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col-md-2">
                    <h4 class="fw-bold mb-4">My Account</h4>
                    <ul>
                        <li><a href="#">Sign In</a></li>
                        <li><a href="#">View Cart</a></li>
                        <li><a href="#">My Wishlist</a></li>
                        <li><a href="#">Track My Order</a></li>
                        <li><a href="#">Help</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h2 class="fw-bold mb-4">Install App</h2>
                    <p class="my-4 desc-app">From App Store or Google Play</p>
                    <div class="d-flex">
                        <div class="row">
                            <div class="col">
                                <a href="" class="footer-app">
                                    <img src="./images/appStore.png" alt="">
                                </a>
                            </div>
                            <div class="col">
                                <a href="" class="footer-app">
                                    <img src="./images/googlePlay.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                    <p class="my-4 desc-app">Secured Payment Gaeways</p>
                    <div>
                        <a href="" class="d-block">
                            <img src="./images/pay.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-12">
                    <div class="copyright text-center">
                        <hr>
                        <p class="copyright">@ 2021, Tech2 etc - HTML CSS Ecoomerce Template</p>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 30,
            centeredSlides: true,
            loop: true,
            speed: 1500,

            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>
    <script>
        const leftnavbtn = document.querySelector('.left-nav_btn')
        leftnavbtn.addEventListener('click', () => {
            const leftNav = document.querySelector('.left-nav')
            leftNav.classList.toggle('showNav')
        })
        const radioButtons = document.querySelectorAll('input[type="radio"]');

        radioButtons.forEach((radioButton) => {
            radioButton.addEventListener('click', () => {
                radioButtons.forEach((otherRadioButton) => {
                    if (otherRadioButton !== radioButton) {
                        otherRadioButton.checked = false;
                    }
                });
            });
        });
    </script>
    <script>
    </script>
    <script src="./js/app.js"></script>
</body>

</html>
