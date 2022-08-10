<%-- 
    Document   : compeltedOrders
    Created on : Feb 27, 2022, 1:32:26 PM
    Author     : HwZau
--%>

<%@page import="hwzau.dto.Order"%>
<%@page import="hwzau.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section class="container">
            <%
                String name = (String) session.getAttribute("name");
                String email = (String) session.getAttribute("email");
            %>

            <section>
                <h3>
                    Wecome <%= name%> come back
                    <h3> <a href="mainController?action=logout" class="logout">LOGOUT</a> </h3>
                    <h3><a href="viewAllOrderPersonalServlet">View All Orders</a></h3>
                </h3>
            </section>
            <section> <!--load all orders of the user at here-->
                <%
                    ArrayList<Order> list = OrderDAO.getOrders(email);
                    String[] status = {"", "Processing", "Completed", "Canceled"};
                    if (list != null && !list.isEmpty()) {
                        for (Order ord : list) {
                            if (ord.getStatus() == 2) {
                %>
                <table class="order" style="line-height: 2">
                    <tr>
                        <td>Order ID</td>
                        <td>Order Date</td>
                        <td>Ship Date</td>
                        <td>Order's status</td>
                        <td>action</td>                          
                    </tr>
                    <tr>
                        <td><%= ord.getOrderID()%></td>
                        <td><%= ord.getOrderDate()%></td>
                        <td><%= ord.getShipDate()%></td>
                        <td><%= status[ord.getStatus()]%>
                        </td>
                        <td> <a href="OrderDetail.jsp?orderid=<%= ord.getOrderID() %>"> Detail</td>
                    </tr>
                </table>

                <%          }
                    }
                } else {
                %>

                <p>You don't have any order</p>
                <%}%>
            </section>  

        </section>  
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
