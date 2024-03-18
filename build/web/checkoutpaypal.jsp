<%-- 
    Document   : checkoutpaypal
    Created on : Mar 7, 2024, 9:27:29 PM
    Author     : Pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            table {
                border: 0;
            }
            table td {
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <div align="center">
            <h1>Check Out</h1>
            <br/>
            <form action="authorize_payment" method="post">
                <table>
                    <tr>
                        <td>Product:</td>
                    <c:set var="o" value="${sessionScope.cart}"/>
                    
                        
                            <td> Book </td>
                            <input type="hidden" name="product" value="Book">
                        </tr>
                    </c:forEach>
                    </tr>
                    <tr>
                        <td>Sub Total:</td>
                        <td>${sessionScope.total / 24616} $</td>
                        <input type="hidden" name="subtotal" value="${sessionScope.total / 24616}">
                    </tr>
                    <tr>
                        <td>Shipping:</td>
                        <td>1.2 $</td>
                        <input type="hidden" name="shipping" value="1.2">
                    </tr>    
                    <tr>
                        <td>Tax:</td>
                        <td>1 $</td>
                        <input type="hidden" name="tax" value="1">
                    </tr>    
                    <tr>
                        <td>Total Amount:</td>
                        <td>${sessionScope.total /24616 + 1.2 + 1} $</td>
                        <input type="hidden" name="total" value="${sessionScope.total /24616 + 1.2 + 1}">
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Checkout" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
