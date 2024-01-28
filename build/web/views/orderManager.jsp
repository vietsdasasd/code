<%@page import="java.util.List" %>
<%@page import="dal.DaoOrder" %>
<%@page import="model.OrderManager"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.math.RoundingMode"%>
<html lang="en">
    <% List<OrderManager> orders = (List<OrderManager>)request.getAttribute("orders"); System.out.println(orders.size());%>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cartegories</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
              integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>

        <section id="header">
            <div class="container h-100 w-100">
                <div class="row align-items-center h-100">
                    <div class="col-2 logo-box">
                        <div class="header-logo">
                            <a href="ProductServlet">
                                <span class="header-logo_name">Sell-phone</span>
                                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAIAAAC2BqGFAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTFGN0JGRkVDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTFGN0JGRkZDMEM1MTFFQTkwMkZBOEFENzdFODgwMUYiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1MUY3QkZGQ0MwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1MUY3QkZGREMwQzUxMUVBOTAyRkE4QUQ3N0U4ODAxRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgpTqXEAAAhlSURBVHja7JwLbBTHGcdnZnf29p4G2+czhhST1tDWPFpMwyNReCYhkBCEaZUHCqCWCDWVAq0SqUnaVFRq2oZKEAiFtokAA1YKBAohhjwNpG5DRZvYjWtiit1CZIxtjO+1dze7O907O1RE4JydW9/e5vtbsmTdzXr3t9/O9/9mZwa30HIEMl8EEABoAA0C0AAaQIMANIAGAWgADaBBANpGEjN3KIxUlfO4neBg6kCIWwy0rgolfmlyefLMeO5Dxlg9d541nUVEtBZoXYs5p38jsPd528RzcMP2zrXPEOK1Xh+taXbqVTlTIRmC6wABaAANoEEAGkCDADSABtAgAJ1rErPyX1lza/zUB1ig2QegMcetU8TSkfYEHX2ttmPNjwTkyzpnjuKOiZNH1O4mw/NsCBpTSpAHU3fWQWPkjtfXd656qmjvJoQx9NFmpinRF95/6MrPNkEyND2qieDpXrcxsrcGQJsd1QRhsXPVk4kPmgC0yWEtSnpP8NKDa/WuKwDaXAOCqSvR+GHnd3+MdN0uoLk135NzQn3hPx3p/smGVJBn0oRkyd6JAkcJi3bXgufKLzY7ZnyT5HlyPqLdlXe5bpups3Ay5VsxMdKuR34ae/uvmDhyGzQpzC/a/4JjYjm3JGssUq2tM/LyUSzkOGhDQlFB4MBvxdLRnEWtGNeigAQBZW7OVTZdh3jzlwKHtgnFhZwpVmSd0TPKsr2TJowL7NtCvG7O7DQ70pI+2nFrRdGeDdghcFUF0Gk+a4N82Jz3zPa/+CuEVJvN3jMN9OcISfdDiwo2PsP1mBlVmRUkrBGKMhPNRNQutLF/niF5Xlo6ahDR7Zg6CWMx+k4tJpKpQ8O5DTqJJqHG6xsiVYeVoyeM6BZHjyRu14COIc+6hfdElbq6ZKVgL9Q48/t1cM7VOEeMloxyLbnLu2KJVDF+QAfoWP5EaGc1oXkAOj3gTOVIIdTtnDvNs7LStXAOdjvTaphgl5b+IHK4hlAfgE5bus61mEGPji3zPHSvZ9l9Rp3y2Y3CkfZ7VinH/5xizQF0+uGNuJrgKCbkFbgWzvKsXOqcO6P/jKd3XG67c3n8/QZCvZ9m3TvKmlMJEw/1nkqqpnMFI9HwGN7lS1yV84Wight+t/XCxXkPs3+3pt6X86uUsVPm4SjnCSw6cyVn4uxsXvVJwhRHjHQvne9dUZlaN3cdscbmtnkPa20dmDr7WGsaCQz3rX5QeasuduIvRimARdn60Z05ezdAL4gFEQsOvScSO3UqvP1grO40lqhhwI3f15yfv0CeXhHZf5RHFZwcTkuOF+s9PUhTA69skadPNu6B2vIfpCcwplbGjS2xHdvVhDmuzLNskeeBReKXr0mYSs2J9iWreVzDYu9twDoLuufPDdS8lPr0ePD5HdFj7xqdCRFcyZF7iOgbBzg1CkKto0t553h4xyFWf4YM89IxN/V2wbRsNC0rjbxSgznu5Wg8DYmPGrXWdtfiO4yPDDPjnD2VhxXW3KKzsJEDrIbbGqD7cBv4hORLDSURb2iI7DxkVJicsd4KUxo/Vgz4o68eM8r03i4CEzn2j9NIJ87Z04w/ja+5v7PAteB2lNDYRy16LIi5hXBbCfT/R7oIFiRMBPX8x9Ejb0R3H1H/+7FY7HfdO0fIz4++9mYfa+MHU6X2XbFkhOOT4lMoCRgx7l58ByaievacFulGunHzso8bW3/LzL4KU3I7583wPboseuxkaOtuA19f6tNUI3CLD2xzLpj5aXfYciH0u+rQjgNq2wWMZEwlAJ1+wiTS+K+q5y/yiHLVY3CWEIZ5it+quq5H1C52hF7aG/r9H1lrC0ZSamcIAJ1WhcmwKF7r5DBnUaOyH/H2bnF0yfVvU3dPuOpgcOuexL+aMKIp6w2gB3UhOgvJ36oofnMH8d1w4othxsMvHwm9UBU7XY+HttLBdtrWOGmu71sY2Lc5OVmgHzE1cvD14KadsZN/44ZrSVpv03Fb0nUMOmoMc93YoF8OuxbM6veiiVRe5l25VL5lkn65h51t5Zpy1TUC6PRYE0fsvfeI7JJvm/KZX05VOouds6byUJQ1t6YqHWpSdNsNdLLINMz1Gyfo2DHShHHptBBLjUpnoevuVKXTfM6kSgfbcut5rqpYFopffVGeM21ADVnj2eCWXeE9h7XuDoJdKDm0wgF0/2VOXAjkG4aPfv0rA21rVDrBbdXh7fv1rh6j489MtYtsKkxlrb2jvfJRrb1zoG3FMaPyf/l43pqVuhrN2LACsq04pu5EU9Ol+x8z7PNgDkAzOUvf3mtYOKFepfZk5/eeGpQt5wB6IFco+kLV+7qf+HWWT8P2oFPrNb3dz20JbqoC0GZfJSbE2bX259EDrwNos8caBKQlJ5vF6/4OoM02fJIW6gxurgLQQyAxW1MSvnhLlO0AWtc5YwhhBDIPNFfj8swp8rRJnEWAtZmguSqUFPn3/EYoLLT9WrYsdx16RBHH3OSvWo9EbOP1VVZJhs75txesf1LXo1bdK8JGBYvvseV5q1foahD4mm7v8jc+7Zo7R2chSIzmgsYS9e9aL5WVpTYvAJlZsAjF/qLqjcTn5SoD0OZWhlJFeeEfnkVIs+vCYwuV4O5v3z183Q91LYy+2B5kKDavGvb099mZc8FdVRg5spsbdRQa5PvDnABtqHDrOmniWB5jQzDLrb/yVWOOCV+zM2jsduU9/gj00SAADaBBABpAA2gQgAbQIAANoAE0KHdA8+TKYRsJy44MblCWMTTJxZTvN11e+6xNxvgFkjj9IRbkjPHJ3KosjBjTkWKfiE5uhSBnKqgz+LBzREWCvPbqWm2x9TwkQxCABtAgAA2gATQIQANoEIAG0AAalGn9T4ABAAi7CCUB4zUcAAAAAElFTkSuQmCC"
                                     alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-10 nav-menu_box">
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
                </div>
            </div>
        </section>
        <section>
            <div class="row h-100">
                <div class="col-md-2 h-100 left-nav-admin p-0">
                    <div class="p-5 pe-0">
                        <ul>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-2 text-white d-flex align-items-center">
                                    <i class='bx bxs-dashboard me-3'></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3 active">
                                <a href="" class="fs-2 text-white">
                                    <i class='bx bx-cart me-3'></i>
                                    <span>Order</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-2 text-white d-flex align-items-center">
                                    <i class='bx bx-circle-three-quarter me-3'></i>
                                    <span>Statistic</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-2 text-white d-flex align-items-center">
                                    <i class='bx bxs-data me-3'></i>
                                    <span>Products</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-2 text-white d-flex align-items-center">
                                    <i class='bx bx-line-chart me-3'></i>
                                    <span>Stock</span>
                                </a>
                            </li>
                            <li class="py-4 ps-3 mb-3">
                                <a href="" class="fs-2 text-white d-flex align-items-center">
                                    <i class='bx bx-purchase-tag-alt me-3'></i>
                                    <span>Offer</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10 h-100 manage-product">
                    <h1 class="fw-bold my-4">Manager Order</h1>
                    <div class="row mt-5 ">
                        <div class="col-6">
                            <div class="d-flex align-items-center">
                                <div class="file-upload_box" data-bs-toggle="modal" data-bs-target="#importModal">
                                    <span class="d-md-block d-none" onclick="exportData()">Import from excel</span>
                                    <!-- <input type="file" accept="xls" id="file-upload_input"> -->
                                    <i class='bx bxs-file-import'></i>
                                </div>




                                <form id="exportForm" action="orderManagerServlet" method="get">
                                    <!-- Trường ẩn để giữ giá trị danh sách OrderManager dưới dạng JSON -->
                                    

                                    <!-- Nút để kích hoạt hàm exportData -->
                                    <div class="file-export_box ms-4" onclick="exportData()">
                                        <input type="hidden" name="service" value="export">
                                        <span class="d-md-block d-none">Export to Excel</span>
                                        <i class='bx bxs-file-export'></i>
                                    </div>
                                </form>





                            </div>
                        </div>
                        <div class="col-6">
                            <div class="box-procees_order">
                                <div class="sort-order_btn">
                                    <i class='bx bx-sort-alt-2'></i>
                                    <span>Sort by</span>
                                    <div class="box-sort_order">
                                        <form action="orderManagerServlet" method="POST">
                                            <h4 class="box-sort_title mb-0">Sort by</h4>
                                            <div class="line_space-ver"></div>
                                            <div class="p-3">
                                                <h3 class="sort_title">Date</h3>
                                                <div class="d-flex align-items-center">
                                                    <input type="radio" id="order-date_asc" name="order-date_asc" value="Ascending">
                                                    <label for="order-date_des" class="ms-3 fs-4">Ascending</label>
                                                </div>
                                                <div class="d-flex align-items-center mt-4">
                                                    <input type="radio" id="order-date_des" name="order-date_asc" value="Descending">
                                                    <label for="order-date_des" class="ms-3 fs-4">Descending</label>
                                                </div>
                                            </div>
                                            <div class="line_space-ver"></div>
                                            <div class="p-3">
                                                <h3 class="sort_title">Price</h3>
                                                <div class="d-flex align-items-center">
                                                    <input type="radio" id="order-name_asc" name="order-name_asc" value="Ascending">
                                                    <label for="order-name_asc" class="ms-3 fs-4">Ascending</label>            
                                                </div>


                                                <div class="d-flex align-items-center mt-4">
                                                    <input type="radio" id="order-name_des" name="order-name_asc" value="Descending">
                                                    <label for="order-name_des" class="ms-3 fs-4">Descending</label>
                                                </div>



                                            </div>
                                            <div class="line_space-ver"></div>
                                            <div class="p-3">
                                                <div class="d-flex justify-content-between p-3">
                                                    <button type="reset" class="reset_filter-btn">Reset</button>
                                                    <button type="submit" class="apply_filter-btn">Apply now</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="filter-order_btn">
                                    <i class='bx bx-slider'></i>
                                    <span>Filter</span>
                                    <div class="box-filter_order">
                                        <form action="orderManagerServlet" method="post">
                                            <h4 class="box-filter_title mb-0 p-4">Filter</h4>
                                            <div class="line_space-ver"></div>
                                            <div class="p-3">
                                                <h3 class="filter_title">Date range</h3>
                                                <div class="mt-4 row">
                                                    <div class="col-6">
                                                        <p class="fs-5 mb-0">From:</p>
                                                        <input type="date" id="order-date_start" name="order-date_start">
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="fs-5 mb-0">To:</p>
                                                        <input type="date" id="order-date_end" name="order-date_end">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="p-3">
                                                <h3 class="filter_title">Status</h3>
                                                <select class="form-select form-select_status"
                                                        aria-label="Default select example">
                                                    <option value="1">
                                                        Done
                                                    </option>
                                                    <option value="2">
                                                        Wait
                                                    </option>
                                                    <option value="3">
                                                        Process
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="p-3">
                                                <h3 class="filter_title">Keyword Search</h3>
                                                <div
                                                    class="bg-white border d-flex align-items-center rounded-md overflow-hidden">
                                                    <span class="p-3 text-black-weak">
                                                        <i class="fa-solid fa-magnifying-glass fs-3"></i>
                                                    </span>
                                                    <input type="text" placeholder="Search..."
                                                           class="border-0 w-100 py-4 pe-3 fs-4" name="keyword">
                                                </div>
                                            </div>
                                            <div class="p-3">
                                                <div class="d-flex justify-content-between p-3">
                                                    <button type="reset" class="reset_filter-btn">Reset</button>
                                                    <button type="submit" class="apply_filter-btn">Apply now</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="mt-5 col-lg-12 table-header bg-weak rounded-xl ">
                            <div class="row fs-4 fw-bold py-4 px-3 d-flex align-items-center justify-content-between">
                                <div class="col-10 col-md-1">
                                    <div class="d-flex align-items-center">
                                        <input type="checkbox" id="checkAllOrder">
                                        <label for="checkAllOrder" class="ms-3">All</label>
                                    </div>
                                </div>
                                <div class="col-md-3 d-none d-md-block">
                                    <div class="d-flex align-items-center">
                                        <span>Mail</span>
                                        <i class='bx bx-envelope ms-2'></i>
                                    </div>
                                </div>
                                <div class="col-md-2 d-none d-md-block">
                                    <div class="d-flex align-items-center">
                                        <span>Phone</span>
                                        <i class='bx bx-phone ms-2'></i>
                                    </div>
                                </div>
                                <div class="col-md-2 d-none d-md-block">
                                    <div class="d-flex align-items-center">
                                        <span>Date</span>
                                        <i class='bx bx-sort-down text-black-weak ms-2'></i>
                                    </div>
                                </div>
                                <div class="col-md-2 d-none d-md-block">Total</div>
                                <div class="col-md-1 d-none d-md-block">Status</div>
                                <div class="col-2 col-md-1 text-md-center text-end">View</div>
                            </div>
                        </div>

                        <%
                        DecimalFormat df = new DecimalFormat("#,##0");
                        //DaoOrder dao_order = new DaoOrder();
                       
                        int itemsPerPage = 4; // Số lượng item trên mỗi trang
        int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
        int startIndex = (currentPage - 1) * itemsPerPage;
        int endIndex = Math.min(startIndex + itemsPerPage, orders.size());
                        
                        
                        
                        for(int i = startIndex; i < endIndex; i++){
                        OrderManager order = orders.get(i);
                        %>
                        <!--ph?n view ra các ??n hàng-->

                        <div class="col-12 col-sm-6 mt-5 transition-item">
                            <div
                                class="row position-relative fs-4 px-3 py-4 d-flex align-items-center justify-content-between bg-white rounded-lg border">
                                <div class="col-sm-12">
                                    <div class="d-flex align-items-center justify-content-md-start justify-content-between">
                                        <input type="checkbox">
                                        <label for="" class="ms-3"><%=order.getOrderId()%></label>
                                    </div>
                                </div>
                                <div class="col-sm-12" style="word-break: break-all;">
                                    <span class="text-danger fw-boldz">Mail:
                                    </span><%=order.getEmail()%>
                                </div>
                                <div class="col-sm-6">
                                    <span class="text-danger fw-bold">Phone:
                                    </span><%=order.getPhone()%>
                                </div>
                                <div class="col-sm-12">
                                    <span class="text-danger fw-bold fs-4">Add date:</span><%=order.getOrderDate()%>
                                </div>
                                <div class="col-sm-12">
                                    <span class="text-danger fw-bold ">Total: </span><%=df.format(order.getTotal())%> vnđ
                                </div>
                                <div class="col-6 fs-4">
                                    <select onchange="this.className = this.options[this.selectedIndex].className"
                                            class="process-status">
                                        <option class="done-status" value="Chờ xử lý">Chờ xử lý</option>
                                        <option class="wait-status" value="Đặt hàng thành công">Đặt hàng thành công</option>
                                        <option class="process-status" value="Hủy đơn hàng" selected>Hủy đơn hàng</option>
                                    </select>
                                </div>
                                <div class="col-6 text-md-center text-end">
                                    <a href="orderDetailServlet?orderId=<%=order.getOrderId()+""%>&customerId=<%=order.getCustomerId()+""%>"
                                       class="text-black-weak text-decoration-none text-info">Detail</a>
                                </div>
                                <div class="col-6 text-md-center text-end">
    <!--                                <a href="orderManagerServlet?service=delete&orderId=<%=order.getOrderId()%>"
                                        class="text-danger text-decoration-none text-info">Delete</a>-->
                                    <form action="orderManagerServlet" method="POST">
                                        <input type="hidden" value="<%=order.getOrderId()%>" name="orderId">
                                        <button class="text-danger text-decoration-none text-info" type="submit" value="delete" name="service" style="border: none; outline: none; box-shadow: none;">delete</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>


                    </div>
                </div>
                <div class="paging mt-5">
                    <div class="paging-box d-flex">
                        <span class="prev-paging">
                            <% if (currentPage > 1) { %>
                            <a href="?page=<%= currentPage - 1 %>"><i class='bx bx-chevron-left'></i></a>
                                <% } else { %>
                            <i class='bx bx-chevron-left unclick'></i>
                            <% } %>
                        </span>
                        <ul class="pagination">
                            <% int totalPages = (int) Math.ceil((double) orders.size() / (double) itemsPerPage);
               for (int i = 1; i <= totalPages; i++) { %>
                            <li class="number-paging" <%= (i == currentPage) ? "active" : "" %>">
                                <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                            </li>
                            <% } %>
                        </ul>
                        <span class="next-paging">
                            <% if (currentPage < totalPages) { %>
                            <a href="?page=<%= currentPage + 1 %>"><i class='bx bx-chevron-right'></i></a>
                                <% } else { %>
                            <i class='bx bx-chevron-right unclick'></i>
                            <% } %>
                        </span>
                    </div>
                </div>

            </div>

        </div>
        <!-- Modal -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- <script src="./js/app.js"></script> -->
        <script>
                                        $('#importModal').on('show.bs.modal', function (event) {
                                            $('body').addClass('hiddenPadding');
                                            var button = $(event.relatedTarget) // Button that triggered the modal
                                            var recipient = button.data('whatever') // Extract info from data-* attributes
                                            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                                            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                                            var modal = $(this)
                                            modal.find('.modal-title').text(recipient)
                                            modal.find('.modal-body input').val(recipient)
                                        });
                                        const exportFileBtn = document.querySelector('.file-export_box')
                                        exportFileBtn.addEventListener('click', () => {
                                            confirm("You want to export 250 file")
                                        });

                                        //code chuyển dữ liệu sang trang khác để export ra exel
                                        function exportData() {
                                            // Submit form để chuyển dữ liệu
                                            document.getElementById('exportForm').submit();
                                        }

        </script>
</body>

</html>