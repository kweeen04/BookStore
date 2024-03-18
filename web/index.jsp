<%-- 
    Document   : index
    Created on : Mar 3, 2024, 10:34:19 AM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="vi">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My Shop</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
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

        <!--slider area start-->
        <div class="slider_area slider_style home_three_slider owl-carousel">
            <div class="single_slider" data-bgimg="assets/img/slider/content4.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_one">
                                <img style="opacity: 0%" src="assets/img/slider/content3.png" alt="">
                                
                                <a style="padding-top: 78px; color: black;"  href="book?action=listAll">Discover Now</a>
                            </div>
                        </div>
                    </div>
                </div>    
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/img3.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_two">
                                <img style="opacity: 0%" src="assets/img/slider/content4.png" alt="">
      
                                <a style="padding-top: 78px; color: black;"  href="book?action=listAll">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider" data-bgimg="assets/img/slider/img21.jpg">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <div class="slider_content content_three">
                                <img style="transform: translate(50%, 0%);" src="assets/img/slider/content5.png" alt="">
                                
                                
                                <a  href="book?action=listAll" style = "color: black">Discover Now</a>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--slider area end-->

        <!--banner area start-->
        <div class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="book?action=listAll"><img src="assets/img/bg/banner8_1.jpg" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="book?action=listAll"><img src="assets/img/bg/banner9.jpg" alt="#"></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="banner_area bottom">
                            <div class="banner_thumb">
                                <a href="book?action=listAll"><img src="assets/img/bg/banner10_1.jpg" alt="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--banner area end-->

        <!--product section area start-->
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm của chúng tôi</h2>
                            <p>Sản phẩm dành cho bạn</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${top10}" var="top10">
                                <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="book?action=bookdetail&book_id=${top10.book_id}"><img src="${top10.img_URL}" width="1400" height="2100" alt=""></a>
                                            <div class="quick_button">
                                                <a href="book?action=bookdetail&book_id=${top10.book_id}" title="quick_view">Xem sản phẩm</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="book?action=bookdetail&book_id=${top10.book_id}">${top10.book_name}</a></h3>
                                            <span class="current_price">${top10.book_price}đ</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--banner area start-->
        <section class="banner_section banner_section_three">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="book?action=listByGenre&genre_id=1"><img src="assets/img/bg/banner111_1.jpg" alt="#"></a>
                                <div class="banner_content">
                                    <h1>Fiction <br> Collection</h1>
                                    <a href="book?action=listAll">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="banner_area">
                            <div class="banner_thumb">
                                <a href="book?action=listByGenre&genre_id=4"><img src="assets/img/bg/banner121.jpg" alt="#"></a>
                                <div class="banner_content">
                                    <h1>Mistery <br> Collection</h1>
                                    <a href="book?action=listAll">Discover Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--banner area end-->

        <!--product section area start-->
        <section class="product_section womens_product bottom">
            <div class="container">
                <div class="row">   
                    <div class="col-12">
                        <div class="section_title">
                            <h2>Sản phẩm thịnh hành</h2>
                            <p>Sản phẩm ấn tượng và bán chạy nhất</p>
                        </div>
                    </div> 
                </div>    
                <div class="product_area"> 
                    <div class="row">
                        <div class="product_carousel product_three_column4 owl-carousel">
                            <c:forEach items="${topTrend}" var="td">
                            <div class="col-lg-3">
                                    <div class="single_product">
                                        <div class="product_thumb">
                                            <a class="primary_img" href="book?action=bookdetail&book_id=${td.book_id}"><img src="${td.img_URL}" width="10px;" alt=""></a>
                                            <div class="quick_button">
                                                <a href="book?action=bookdetail&book_id=${td.book_id}" title="quick_view">Xem sản phẩm</a>
                                            </div>
                                        </div>
                                        <div class="product_content">
                                            <h3><a href="book?action=bookdetail&book_id=${td.book_id}">${td.book_name}</a></h3>
                                            <span class="current_price">${td.book_price}đ</span>
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
        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>

</html>
