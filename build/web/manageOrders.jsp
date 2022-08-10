<%-- 
    Document   : manageOrders
    Created on : Mar 18, 2022, 6:39:44 PM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/>
        <section class="container">
        <form action="mainController">
            From <input type="date" name="from" value="${param.from}"> To <input type="date" name="to" value="${param.to}">
            <input class="button" type="submit"  value="Search Date Manage Orders" name="action">
        </form>
            <section class="order">
            <c:if test="${listOrders !=null}">
                <table>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Ship Date</th>
                        <th>Status</th>
                        <th>Account ID</th>
                    </tr>

                    <c:forEach items="${listOrders}" var="listOrd">
                        <form action="mainController">
                            <tr>
                                <td><input value="<c:out value="${listOrd.getOrderID()}" />" readonly="" name="orderId"></td>
                                <td><c:out value="${listOrd.getOrderDate()}" /></td>
                                <td> <input value="<c:out value="${listOrd.getShipDate()}"/>" type="date" name="shipdate2"></td>
                                <td>
                                    <c:if test="${listOrd.getStatus() == 1}">Processing</c:if>
                                    <c:if test="${listOrd.getStatus() == 2}">Completed</c:if>
                                    <c:if test="${listOrd.getStatus() == 3}">Canceled</c:if>
                                    </td>
                                    <td><c:out value="${listOrd.getAccID()}" /></td>
                                <td><input class="button" name="action" value="saveShipDate" type="submit"></td>
                            </tr>
                        </form>
                    </c:forEach>           
                </table>
            </c:if>

        </section>

        <section class="order">
            <c:if test="${requestScope.listOrdersManage != null}">
                <table>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Ship Date</th>
                        <th>Status</th>
                        <th>Account ID</th>
                    </tr>

                    <c:forEach items="${requestScope.listOrdersManage}" var="list">
                        <form action="mainController">
                            <tr>
                                <td><input value="<c:out value="${list.getOrderID()}" />" readonly="" name="orderId"></td>
                                <td><c:out value="${list.getOrderDate()}" /></td>
                                <td> <input value="<c:out value="${list.getShipDate()}"/>" type="date" name="shipDate"></td>
                                <td>
                                    <c:if test="${list.getStatus() == 1}">Processing</c:if>
                                    <c:if test="${list.getStatus() == 2}">Completed</c:if>
                                    <c:if test="${list.getStatus() == 3}">Canceled</c:if>
                                    </td>
                                    <td><c:out value="${list.getAccID()}" /></td>
                                <td><input class="button" name="action" value="saveShipDate" type="submit"></td>
                            </tr>
                        </form>
                    </c:forEach>           
                </table>
            </c:if>
        </section>
        <c:if test="${message != null}">
            <h3 style="color: green"><c:out value="${message}" /></h3>
        </c:if>
            </section>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>    
    </body>
</html>
