<%-- 
    Document   : book-details.jsp
    Created on : Mar 3, 2024, 10:45:30 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Book details</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS 
        ========================= -->


        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>

        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area product_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li>/</li>
                                <li>Book Details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--product details start-->
        <div class="product_details">
            <div class="container">

                <div class="row">
                    <div class="col-lg-5 col-md-5">
                        <div class="product-details-tab">

                            <div id="img-1" class="zoomWrapper single-zoom">
                                <a href="#">
                                    <img id="zoom1" src="${bookData.img_URL}" data-zoom-image="${bookData.img_URL}" alt="product">
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 col-md-7">
                        <div class="product_d_right">
                            <form action="cart?book_id=${bookData.book_id}" method="POST">
                                <h1>${bookData.book_name}</h1>
                                <div class="product_price">
                                    <span class="current_price">Author: ${bookData.book_author}</span>
                                </div>
                                <div class="product_price">
                                    <span class="current_price">Price: ${bookData.book_price} VNĐ</span>
                                </div>
                                <div class="product_price">
                                    <span class="current_price">Public Date: ${bookData.public_date}</span>
                                </div>
                                <div class="product_desc">
                                    <p>${bookData.book_description}</p>
                                </div>


                                <div class="product_variant quantity">
                                    <label>Quantity</label>
                                    <input min="1" max="${bookData.book_quantity}" name="quantity" type="number">
                                    <button class="button" type="submit">Thêm vào giỏ hàng</button>  
                                </div>
                                     <%-- Thêm nút "Thêm vào mục yêu thích" và chuyển hướng đến trang wishlist.jsp --%>
                                <!-- Trong book-details.jsp -->
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <a href="wishlist?action=addtowishlist&book_id=${bookData.book_id}" class="button" style="margin-left: 10px;">Thêm vào mục yêu thích</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="login.jsp" class="button" style="margin-left: 10px;">Đăng nhập để thêm vào mục yêu thích</a>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </div>
                    </div>
                </div>
            </div>    
        </div>
        <!--product details end-->
        <!--product info end-->

        <!--product section area start-->
        <section class="product_section related_product">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm tương tự</h2>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${requestScope.BookByGenre}" var="pc">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="book?action=bookdetail&book_id=${pc.book_id}"><img src="${pc.img_URL}" alt=""></a>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="book?action=bookdetail&book_id=${pc.book_id}">${pc.book_name}</a></h3>
                                            <span class="current_price">${pc.book_author}</span>
                                            <span class="current_price">${pc.book_price}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--product section area end-->

        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
        <script>
//            $("#submit").click(function()){
//            swal({
//            title: "Thanks for Contacting us..!",
//                    text: "We Will Contact You Soon...",
//                    icon: "success",
//            })
//            }
        </script>
    </body>

</html>
