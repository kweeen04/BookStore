<%-- 
    Document   : contact
    Created on : Mar 3, 2024, 10:31:57 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Reid - contact us</title>
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

        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="index.html">Trang chủ</a></li>
                                <li>/</li>
                                <li>Liên hệ</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->


        <!--contact area start-->
        <div class="contact_area">
            <div class="container">   
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message content">
                            <h3>Liên hệ</h3>
                            <ul>
                                <li><i class="fa fa-fax"></i>  Khu đô thị FPT City, Ngũ Hành Sơn, Da Nang 550000, Vietnam</li>
                                <li><i class="fa fa-phone"></i> <a href="mailto:spencerbookstore@gmail.com">spencerbookstore@gmail.com</a></li>
                                <li><i class="fa fa-envelope-o"></i> (+84)796510005</li>
                            </ul>             
                        </div> 
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="contact_message form">
                            <h3>Gửi thông tin phản hồi</h3>   
                            <form id="contact-form" method="GET" action="https://script.google.com/macros/s/AKfycbymc4721B4atbG9XygagELQA6HyoZecaXVCqW96CFhiJ2C1djJI_wOhCsZiJEONAruF/exec">
                                <p>       
                                    <label>  Địa chỉ email</label>
<input name="Email" pattern="[^ @]*@[^ @]*" placeholder="Email *" required="" value="" type="email">
                                </p>
                                <p>          
                                    <label>  Tiêu đề</label>
                                    <input name="Subject" placeholder="Subject *" required="" value="" type="text">
                                </p>    
                                <div class="contact_textarea">
                                    <label>  Thông tin</label>
                                    <input placeholder="Message *" name="Message" required="" value="" class="form-control2" >    
                                </div>
                                <br>
                                <button type="submit"> Send</button>
                            </form> 
                        </div> 
                    </div>
                </div>
            </div>    
        </div>
        <!--contact area end-->

        <!--contact map start-->
        <div class="contact_map">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="map-area">
                            <iframe id="googleMap" style="border: none;" <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30688.79475301701!2d108.25080151113278!3d15.956187640006021!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2sFPT%20University%20Danang!5e0!3m2!1sen!2s!4v1709709632693!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--contact map end-->

        <jsp:include page="layout/footer.jsp"/>

        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>
    </body>

</html>