<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Wishlist</title>
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
    <jsp:include page="layout/menu.jsp" />
    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area other_bread">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <ul>
                            <li><a href="index.html">Trang chủ</a></li>
                            <li>/</li>
                            <li>Wishlist</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--breadcrumbs area end-->

    <!-- wishlist area start -->
    <div class="shopping_cart_area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table_desc">
                        <div class="cart_page table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th class="product_remove">Delete</th>
                                        <th class="product_thumb">Image</th>
                                        <th class="product_name">Book</th>
                                        <th class="product-name">Author</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.wishlist.items}" var="item">
                                        <tr>
                                            <td class="product_remove"><a href="wishlist?action=deletewishlist&book_id=${item.book.book_id}"><i class="fa fa-trash-o"></i></a></td>
                                            <td class="product_thumb"><a href="book?action=bookdetail&book_id=${item.book.book_id}"><img src="${item.book.img_URL}" alt=""></a></td>
                                            <td class="product_name"><a href="book?action=bookdetail&book_id=${item.book.book_id}">${item.book.book_name}</a></td>
                                            <td class="product-name">${item.book.book_author}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

           
        </div>
    </div>
    <!-- wishlist area end -->

    <!--footer area start-->
    <jsp:include page="layout/footer.jsp" />
    <!--footer area end-->

    <!-- JS
    ============================================ -->

    <!--map js code here-->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
    <script src="https://www.google.com/jsapi"></script>
    <script src="assets/js/map.js"></script>


    <!-- Plugins JS -->
    <script src="assets/js/plugins.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

</body>

</html>
