<%-- 
    Document   : OrderDetail
    Created on : Feb 16, 2022, 12:37:59 PM
    Author     : HwZau
--%>

<%@page import="hwzau.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hwzau.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <section>
            <h3>Logout</h3>
            <a href="personalPage.jsp"> View All Order</a>
        </section>
        <section>
            <%
                String orderid = request.getParameter("orderid");

                if (orderid != null) {
                    int orderID = Integer.parseInt(orderid.trim());
                    ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                    if (list != null && !list.isEmpty()) {
                        int money = 0;
                        for (OrderDetail detail : list) {%>

            <table class="order">
                <tr><td><h3>Order ID</h3></td><td><h3>Plant ID</h3></td><td><h3>Plant Name</h3></td><td><h3>Image</h3></td><td><h3>Quantity</h3></td></tr>
                <tr>
                    <td><h2><%= detail.getOrderID()%></h2></td>
                    <td><h2><%= detail.getPlantID()%></h2></td>
                    <td><h2><%= detail.getPlantName()%></h2></td>
                    <td ><img src="<%=detail.getImgPath()%>" class="plantimg--order" /> 
                        <br/> <h2 class="price"> <%= detail.getPrice()%> </h2></td>
                    <td ><h2><%= detail.getQuantity()%></h2></td>
                    <% money = money + detail.getPrice() * detail.getQuantity(); %>

                </tr>
            </table>
            <% }%>
            <h3> Total Money: <%= money%> </h3>
            <%  } else {
            %>
            <p>You don't have any order</p>
            <% }
                }
            %>
        </section>
    </section>
</body>
</html>
