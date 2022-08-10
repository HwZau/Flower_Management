<%-- 
    Document   : personalPage
    Created on : Feb 16, 2022, 10:10:28 AM
    Author     : HwZau
--%>

<%@page import="hwzau.dto.Account"%>
<%@page import="hwzau.dao.AccountDAO"%>
<%@page import="hwzau.dao.OrderDAO"%>
<%@page import="hwzau.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body> 
        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                String token = "";
                for (Cookie aCookie : c) {
                    if (aCookie.getName().equals("selector")) {
                        token = aCookie.getValue();
                        Account acc = AccountDAO.getAccountbyToken(token);
                        if (acc != null) {
                            name = acc.getFullname();
                            email = acc.getEmail();
                            login = true;
                        }

                    }
                }
            } else {
                login = true;
            }

            if (login) {
        %>
        <c:import url="header_loginedUser.jsp"/>
        <section class="container">
            <section>
                <h3>Welcome <%= name%> come back</h3>
                <h3><a href="mainController?action=logout">LOGOUT</a></h3>
            </section>
            <section> <!--load all orders of the user at here-->
                <c:if test="${requestScope.listOd != null}">

                    <c:forEach items="${listOd}" var="list">
                        <table class="order" style="line-height: 2"> 
                            <tr>
                                <td>Order ID</td>
                                <td>Order Date</td>
                                <td>Ship Date</td>
                                <td>Status</td>
                                <td>Action</td>
                            </tr>
                            <tr>
                                <td><c:out value="${list.getOrderID()}"></c:out></td> 
                                <td><c:out value="${list.getOrderDate()}"></c:out></td>     
                                <td><c:out value="${list.getShipDate()}"></c:out></td>                  
                                <td><c:if test="${list.getStatus() == 1}">
                                        Processing
                                        </br> <a class="button" style="font-size: 12px" href="mainController?action=canceledOrdersInPersonalPage&&orderid=<c:out value="${list.getOrderID()}"/>"> Cancel Order</a>
                                    </c:if>
                                    <c:if test="${list.getStatus() == 2}">
                                        Completed
                                    </c:if>
                                    <c:if test="${list.getStatus() == 3}">
                                        Canceled
                                        </br> <a class="button" style="font-size: 12px" href="mainController?action=OrderAgainInPersonalPage&&orderid=<c:out value="${list.getOrderID()}"/>"> Order Again</a>
                                    </c:if>

                                </td>  
                                <td><a href="OrderDetail.jsp?orderid=<c:out value="${list.getOrderID()}"/>">Detail</a></td>
                            </tr>
                        </c:forEach>

                    </c:if>
                </table>
            </section>

             <section>
                <c:if test="${requestScope.listOrders != null}">
                    <table class="order" style="line-height: 2"> 

                        <c:forEach items="${requestScope.listOrders}" var="listSearch">
                            <tr>
                                <td>Order ID</td>
                                <td>Order Date</td>
                                <td>Ship Date</td>
                                <td>Status</td>
                                <td>Action</td>
                            </tr>
                            <tr>
                                <td><c:out value="${listSearch.getOrderID()}"></c:out></td> 
                                <td><c:out value="${listSearch.getOrderDate()}"></c:out></td>     
                                <td><c:out value="${listSearch.getShipDate()}"></c:out></td>                  
                                    <td>
                                    <c:if test="${listSearch.getStatus() == 1}">
                                        Processing
                                        </br> <a href="mainController?action=canceledOrdersInPersonalPage&&orderid=<c:out value="${listSearch.getOrderID()}"/>"> Cancel order</a>
                                    </c:if>
                                    <c:if test="${listSearch.getStatus() == 2}">
                                        Completed
                                    </c:if>
                                    <c:if test="${listSearch.getStatus() == 3}">
                                        Canceled
                                        </br> <a href="mainController?action=OrderAgainInPersonalPage&&orderid=<c:out value="${listSearch.getOrderID()}"/>"> Order again</a>
                                    </c:if>
                                </td>  
                                <td><a href="OrderDetail.jsp?orderid=<c:out value="${listSearch.getOrderID()}"/>">Detail</a></td>
                            </tr>
                        </c:forEach>

                    </c:if>
            </section>
            <footer>
                <c:import url="footer.jsp"/>
            </footer>
            <% } else { %>
            <h1 class="warning">You MUST <a class="button--buy" href="login.jsp">Login</a> to view your page</h1>
            <%
                }
            %>
    </body>
</html>
