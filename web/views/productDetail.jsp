<%-- 
    Document   : productDetail
    Created on : 11 Jan, 2024, 9:44:18 AM
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
    <title>Product Detail</title>
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
        <div class="container size-itemainer h-100">
            <div class="row align-items-center h-100">
                <div class="col-sm-1 col-md-3 logo-box">
                    <div class="header-logo">
                        <a href="ProductServlet">
                            <span class="header-logo_name">Sell-phone</span>
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAIAAAC2BqGFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTFGN0JGRkVDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTFGN0JGRkZDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1MUY3QkZGQ0MwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1MUY3QkZGREMwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgpTqXEAAAhlSURBVHja7JwLbBTH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"
                                alt="">
                        </a>
                    </div>
                </div>
                <div class="col-sm-6 col-md-5 search-box">
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
                                        <div class="user-access">
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
                                        </div>

                                        <!-- not access -->
                                        <!-- <div class="user-not-access">
                                            <span class="not-access-title">Wellcome</span>
                                            <p>To access account and manage orders</p>
                                            <a href="#" class="login-link">
                                                <div class="login-button">
                                                    Login / Signup
                                                </div>
                                            </a>
                                        </div> -->

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
            </div>
        </div>
    </section>
    
    <c:set var="product" value="${requestScope.proDetail}"/> 
    <section id="product-detail" class="mt-5">
        <div class="container h-100">
            <div class="row h-100 gx-5">
                <div class="col-md-5">
                    <div class="">
                        <div class="main-image">
                            <img src="${IConstant.pathProduct}/${product.getImagePath()}"
                                alt="" id="main-image">
                        </div>
                        <div class="position-relative">
                            <div class="small-img-group">
                                <div class="small-img-col">
                                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/v/n/vn_iphone_15_yellow_pdp_image_position-1a_yellow_color_1_4.jpg"
                                        width="100%" class="small-img" alt="">
                                </div>
                                <div class="small-img-col">
                                    <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/v/n/vn_iphone_15_green_pdp_image_position-1a_green_color_1_4.jpg"
                                        width="100%" class="small-img" alt="">
                                </div>
                                <div class="small-img-col">
                                    <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/v/n/vn_iphone_15_blue_pdp_image_position-1a_blue_color_1_4.jpg"
                                        width="100%" class="small-img" alt="">
                                </div>
                                <div class="small-img-col">
                                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/v/n/vn_iphone_15_yellow_pdp_image_position-1a_yellow_color_1_4.jpg"
                                        width="100%" class="small-img" alt="">
                                </div>
                                <div class="small-img-col">
                                    <img src="https://cdn2.cellphones.com.vn/x/media/catalog/product/v/n/vn_iphone_15_yellow_pdp_image_position-1a_yellow_color_1_4.jpg"
                                        width="100%" class="small-img" alt="">
                                </div>
                            </div>
                            <div class="image-buttons">
                                <button id="left-arrow"><i class='bx bx-chevron-left'></i></button>
                                <button id="right-arrow"><i class='bx bx-chevron-right'></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="">
                        <div class="product-title">
                            <h1 class="fw-bold">${product.productName}| Chính hãng VN/A</h1>
                        </div>
                        <div class="d-flex align-items-center flex-wrap mt-5">
                            <div class="px-4 py-1 border-red rounded-sm">
                                <span class="text-red fs-3 fw-bold">${product.getPriceAfterDiscount()}₫</span>
                            </div>
                            <div class="px-3">
                                <p class="text-decoration-line-through text-black fs-4 m-0">${product.getPrice()}₫</p>
                            </div>
                            <span class="text-white p-2 mx-2 fs-5 fw-bold bg-danger tag-sale">Giảm ${product.discount}%</span>
                            <div class="border-line border-l"></div>
                            <div class="d-flex align-items-center px- ">
                                <div class="">
                                    <span class="fs-4">12k sold</span>
                                </div>
                            </div>
                        </div>
                        <div class="box-pro_size mt-5">
                            <h5 class="fw-semibold">Dung lượng:</h5>
                            <div class="d-flex flex-wrap gap-4">
                                <div class="px-5 size-item py-2 border-weak pointer">
                                    <div class="row align-items-center h-100">
                                        <div class="col-3">
                                            <input type="radio" name="size" class="checkSize" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4 text-uppercase">1TB</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                                <div class="px-5 size-item py-2 border-weak pointer">
                                    <div class="row align-items-center h-100">
                                        <div class="col-3">
                                            <input type="radio" name="size" class="checkSize" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4 text-uppercase">256GB</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                                <div class="px-5 size-item py-2 border-weak pointer">
                                    <div class="row align-items-center h-100">
                                        <div class="col-3">
                                            <input type="radio" name="size" class="checkSize" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4 text-uppercase">128GB</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box-pro_color mt-5">
                            <h5 class="fw-semibold">Color:</h5>
                            <div class="d-flex flex-wrap gap-4">
                                <div class="py-2 border-weak pointer color-item position-relative">
                                    <div class="row align-items-center">
                                        <div class="col-3">
                                            <input type="radio" name="color" class="checkColor" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4">Hồng</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                                <div class="py-2 border-weak pointer color-item position-relative">
                                    <div class="row align-items-center">
                                        <div class="col-3">
                                            <input type="radio" name="color" class="checkColor" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4">Xanh dương</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                                <div class="py-2 border-weak pointer color-item position-relative">
                                    <div class="row align-items-center">
                                        <div class="col-3">
                                            <input type="radio" name="color" class="checkColor" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4">Xanh lá</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                                <div class="py-2 border-weak pointer color-item position-relative">
                                    <div class="row align-items-center">
                                        <div class="col-3">
                                            <input type="radio" name="color" class="checkColor" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4">Đen</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                                <div class="py-2 border-weak pointer color-item position-relative">
                                    <div class="row align-items-center">
                                        <div class="col-3">
                                            <input type="radio" name="color" class="checkColor" id="">
                                        </div>
                                        <div class="col-9">
                                            <div class="fs-4">Vàng</div>
                                        </div>
                                    </div>
                                    <div class="triagle-tag">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w-75 mt-5">
                            <h5 class="fw-semibold">Number:</h5>
                            <div class="d-flex align-items-center">
                                <div class="box-input">
                                    <button class="p-3 border-0 bg-white" id="minusNumberBtn">
                                        <i class="fa-solid fa-minus fs-5"></i>
                                    </button>
                                    <input type="text" value="1" class="input-number" id="numberValue" />
                                    <button class="p-3 border-0 bg-white" id="addNumberBtn">
                                        <i class="fa-solid fa-plus fs-5"></i>
                                    </button>
                                </div>
                                <div class="ms-4 fs-5">
                                    <span id="number-available">${product.available}</span> sản phẩm có sẵn
                                </div>
                            </div>
                        </div>
                        <div class="mt-5">
                            <div class="d-flex">
                                <a href="/cartegories.html"
                                    class="d-block w-fit-content px-4 py-4 border-0 rounded-sm add-pro_btn text-center me-3 bg-black text-white shadow-lg">
                                    <i class="bx bx-shopping-bag me-2"></i>
                                    <span class="fw-semibold">Add to bag</span>
                                </a>
                                <a href="/cartegories.html"
                                    class="d-block w-fit-content px-4 py-4 border-0 rounded-sm buy-pro_btn text-center bg-danger text-white shadow-lg">
                                    <span class="fw-semibold">Buy now</span>
                                </a>
                            </div>
                        </div>
                        <div class="mt-5">
                            <div class="">
                                <div class="fs-4">
                                    <p>Đóng gói sản phẩm Áo Khoác Gió Local Brand Lavi Studio/ Draft thêu FULL BOX bao
                                        gồm: hộp, kèm giấy gói, card thankyou , giấy thơm, lavi shipping bag *Các ngày
                                        sale chúng mình xin phép gửi túi zip để gửi sản phẩm đến
                                        tay khách hàng sớm nhất ạ
                                    </p>
                                    Áo Gió Lavi Studio - Draft
                                    <ul>
                                        <li>• Thêu logo: mặt trước </li>
                                        <li>• Tag cao su: mặt sau</li>
                                        <li>• Chất liệu : Gió dù 2 lớp</li>
                                        <li>• Size: M / L / XL </li>
                                    </ul>
                                    <p>Được chăm chút từ chất liệu, form dáng, đường may, hình in cho đến khâu đóng gói
                                        và hậu mãi, chiếc áo cao cấp này sẽ làm hài lòng cả những vị khách khó tính nhất
                                        và nếu chất liệu áo không giống như mô tả, chúng mình
                                        sẵn sàng hoàn trả toàn bộ số tiền mà bạn bỏ ra để trải nghiệm chiếc áo với chất
                                        liệu sánh ngang hàng hiệu này.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                                
    <section id="comment-product" class="container bg-white mt-5">
        <div class="px-3 py-4 border-bottom">
            <h3>Hỏi & đáp</h3>
        </div>
        <div class="px-3 py-4">
            <div class="d-flex align-items-center comment-box">
                <div class="h-100 comment-input_box">
                    <textarea class="h-100" name="" id="" placeholder="Nhập nội dung bình luận..."></textarea>
                </div>
                <button class="comment-submit_btn">Gửi bình luận</button>
            </div>
            <div class="comment-item mt-4">
                <div class="avatar-shape">
                    <img src="https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg"
                        alt="">
                </div>
                <div class="comment-item_content">
                    <h3 class="comment-item_user">Cường Trần</h3>
                    <p class="comment-item_content_text">Còn hàng ở vĩnh thuận kiên giang ko shop</p>
                    <div class="comment-item_info">
                        <div class="comment-info_time">3 phút trước</div>
                        <i class='bx bxs-circle'></i>
                        <div class="comment-info_like">Thích</div>
                        <i class='bx bxs-circle'></i>
                        <div class="comment-info_res">Trả lời</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="realation-product" class="container border-top mt-5">
        <h2 class="fw-bold my-4">SẢN PHẨM TƯƠNG TỰ</h2>
        <div class="row g-5 mt-5">
            <div class="col-sm-6 col-md-3">
                <div class="product-item">
                    <div class="position-relative ">
                        <a href="productDetail.html" class="d-block text-decoration-none">
                            <img src="https://images.fpt.shop/unsafe/fit-in/214x214/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/3/24/638152728715036708_xiaomi-13-lite-dd-docquyen-bh.jpg"
                                alt="" class="overflow-hidden">
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
                                    <p class="mb-0">Giảm 80%</p>
                                </div>
                                <div class="product-sale_triangle">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-4 d-flex flex-column">
                        <h3 class="fw-bold text-black product-title">iPhone 14 Pro Max 128GB</h3>
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
                        <div class="mt-5 d-flex align-items-center justify-content-between flex-wrap text-center">
                            <div class="d-flex align-items-center justify-content-between">
                                <span class="product-price">18.900.000₫</span>
                            </div>
                            <div class="">
                                <p class="text-decoration-line-through text-black fs-4 mb-0">6.490.000₫
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
            <div class="col-sm-6 col-md-3">
                <div class="product-item">
                    <div class="position-relative ">
                        <a href="productDetail.html" class="d-block text-decoration-none">
                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-14-pro_2__5.png"
                                alt="" class="overflow-hidden">
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
                                    <p class="mb-0">Giảm 80%</p>
                                </div>
                                <div class="product-sale_triangle">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-4 d-flex flex-column">
                        <h3 class="fw-bold text-black product-title">iPhone 14 Pro Max 128GB</h3>
                        <div class="product-item_memory">
                            <div class="memory_item choice_view">
                                <strong>128GB</strong>
                            </div>
                            <div class="memory_item">
                                <strong>256GB</strong>
                            </div>
                        </div>
                        <div class="mt-5 d-flex align-items-center justify-content-between flex-wrap text-center">
                            <div class="d-flex align-items-center justify-content-between">
                                <span class="product-price">18.900.000₫</span>
                            </div>
                            <div class="">
                                <p class="text-decoration-line-through text-black fs-4 mb-0">6.490.000₫
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
            <div class="col-sm-6 col-md-3">
                <div class="product-item">
                    <div class="position-relative ">
                        <a href="productDetail.html" class="d-block text-decoration-none">
                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-plus_1__1.png"
                                alt="" class="overflow-hidden">
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
                                    <p class="mb-0">Giảm 80%</p>
                                </div>
                                <div class="product-sale_triangle">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-4 d-flex flex-column">
                        <h3 class="fw-bold text-black product-title">iPhone 14 Pro Max 128GB</h3>
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
                        <div class="mt-5 d-flex align-items-center justify-content-between flex-wrap text-center">
                            <div class="d-flex align-items-center justify-content-between">
                                <span class="product-price">18.900.000₫</span>
                            </div>
                            <div class="">
                                <p class="text-decoration-line-through text-black fs-4 mb-0">6.490.000₫
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
            <div class="col-sm-6 col-md-3">
                <div class="product-item">
                    <div class="position-relative ">
                        <a href="productDetail.html" class="d-block text-decoration-none">
                            <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-redmi-note-12_1.png"
                                alt="" class="overflow-hidden">
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
                                    <p class="mb-0">Giảm 80%</p>
                                </div>
                                <div class="product-sale_triangle">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="p-4 d-flex flex-column">
                        <h3 class="fw-bold text-black product-title">iPhone 14 Pro Max 128GB</h3>
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
                        <div class="mt-5 d-flex align-items-center justify-content-between flex-wrap text-center">
                            <div class="d-flex align-items-center justify-content-between">
                                <span class="product-price">18.900.000₫</span>
                            </div>
                            <div class="">
                                <p class="text-decoration-line-through text-black fs-4 mb-0">6.490.000₫
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
        </div>
    </section>
    <section class="mt-5">
        <div class="container">
            <h2 class="fw-bold my-4">TIN TỨC</h2>
            <div class="row align-items-center">
                <div class="col-md-3">
                    <div class="card h-100">
                        <img class="card-img-top"
                            src="https://images.fpt.shop/unsafe/fit-in/275x183/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/12/5/638373692229292293_dien-thoai-samsung-choi-free-fire-thumb.jpg"
                            alt="Card image cap">
                        <div class="card-body h-100">
                            <h4 class="card-title"><a class="text-black" href="readNewPaper.html">
                                    Điểm danh TOP 5 điện thoại Samsung chơi Free Fire phân khúc giá rẻ - tầm trung
                                </a></h4>
                            <div class="mt-4">
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">Đánh Giá – Tư Vấn</a>
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">toplist</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card h-100">
                        <img class="card-img-top"
                            src="https://images.fpt.shop/unsafe/fit-in/275x183/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/27/638366718986351784_dien-thoai-choi-lien-quan-thumb.jpg"
                            alt="Card image cap">
                        <div class="card-body h-100">
                            <h4 class="card-title"><a class="text-black" href="readNewPaper.html">
                                    Bật mí 5 điện thoại chơi Liên Quân mượt nhất 2023: Hiệu năng tốt, giá rẻ trong tầm
                                    tay
                                </a></h4>
                            <div class="mt-4">
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">Đánh Giá – Tư Vấn</a>
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">toplist</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img class="card-img-top"
                            src="https://images.fpt.shop/unsafe/fit-in/275x183/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/11/14/638355532960824050_dien-thoai-choi-game-duoi-6-trieu-thumb.jpg"
                            alt="Card image cap">
                        <div class="card-body h-100">
                            <h4 class="card-title"><a class="text-black" href="readNewPaper.html">
                                    Top 5 điện thoại chơi game dưới 6 triệu: Giá tốt, cấu hình ổn thỏa sức chơi game
                                </a></h4>
                            <div class="mt-4">
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">Đánh Giá – Tư Vấn</a>
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">toplist</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <img class="card-img-top"
                            src="https://images.fpt.shop/unsafe/fit-in/275x183/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2023/9/28/638315329932794123_dien-thoai-pin-trau-gia-re-duoi-5-trieu-thumb.jpg"
                            alt="Card image cap">
                        <div class="card-body h-100">
                            <h4 class="card-title"><a class="text-black" href="readNewPaper.html">
                                    Tìm mua điện thoại pin trâu giá rẻ dưới 5 triệu tốt nhất 2023? Đừng bỏ qua 5 gợi ý
                                    này
                                </a></h4>
                            <div class="mt-4">
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">Đánh Giá – Tư Vấn</a>
                                <a href="#" class="btn btn-primary bg-weak text-black border-0">toplist</a>
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
    <script src="./js/app.js"></script>
    <script>
        const listProductImg = document.querySelectorAll('.small-img-col')
        const mainImage = document.getElementById('main-image')
        listProductImg.forEach(item => {
            item.addEventListener('click', () => {
                let chooseImg = item.querySelector('.small-img').getAttribute('src');
                mainImage.src = chooseImg
            })
        })
        const rightBtn = document.getElementById("right-arrow")
        const leftBtn = document.getElementById("left-arrow")
        const listImage = document.querySelectorAll(".small-img-group")[0]
        rightBtn.addEventListener("click", () => {
            listImage.scrollLeft += 140;
        })
        leftBtn.addEventListener("click", () => {
            listImage.scrollLeft -= 140;
        })

        listProductImg.forEach((item, currentIndex) => {
            item.addEventListener('mouseover', () => {
                let itemImage = item.getElementsByTagName('img')[0]
                for (let i = 0; i < listProductImg.length; i++) {
                    if (listProductImg[i].classList.contains('onmouse')) {
                        if (currentIndex != i) {
                            listProductImg[i].classList.remove('onmouse')
                            break;
                        }
                    }
                }
                item.classList.add('onmouse')
                mainImage.src = itemImage.src
            })
        })
        // increase, decrease number product order
        const addNumberBtn = document.getElementById('addNumberBtn')
        const minusNumberBtn = document.getElementById('minusNumberBtn')
        const numberValue = document.getElementById('numberValue')
        const numberAvailable = document.getElementById('number-available')
        //avoid more than available
        numberValue.addEventListener('change', () => {
            if (parseInt(numberValue.value) > parseInt(numberAvailable.innerText)) {
                numberValue.value = parseInt(numberAvailable.innerText);
            }
            if (parseInt(numberValue.value) < 0) {
                numberValue.value = 1;
            }
        })
        minusNumberBtn.addEventListener('click', () => {
            if ((parseInt(numberValue.value) - 1) > 0) {
                numberValue.value = (parseInt(numberValue.value) - 1);
            }
        })
        addNumberBtn.addEventListener('click', () => {
            if ((parseInt(numberValue.value) + 1) <= parseInt(numberAvailable.innerText)) {
                numberValue.value = (parseInt(numberValue.value) + 1);
            }
        })
    </script>
</body>

</html>
