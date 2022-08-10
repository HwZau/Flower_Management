<%-- 
    Document   : index
    Created on : Feb 16, 2022, 9:47:51 AM
    Author     : HwZau
--%>


<%@page import="hwzau.dao.PlantDAO"%>
<%@page import="hwzau.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Cart</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="form container">
            <%
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>
            <h3>Welcome <%= (session.getAttribute("name"))%> come back! </h3>
            <h3><a href="mainController?action=logout">Logout</a></h3>
            <h3><a href="personalPage.jsp">Personal Page</a></h3>
            <% } %>

            <table width ="100%" class="shopping order">
                <tr><td>Image</td><td>Product Name</td><td>Product ID</td><td>Quantity</td><td>Action</td></tr>
                <%
                    Plant p;
                    int total = 0;
                    HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                    if (cart != null) {
                        Set<String> pids = cart.keySet();
                        for (String pid : pids) {
                            int quantity = cart.get(pid);
                            p = PlantDAO.getItem(pid);
                            total = total + quantity * p.getPrice();
                %>

                <form action="mainController" method="post">
                    <tr>
                        <td><img src="<%=p.getImgpath()%>" class="plantimg"</td>
                        <td><%=p.getName()%></td>
                        <td><input type="hidden" value="<%= pid%>" name="pid"><a href="getPlantServlet?pid=<%= pid%>"><%= pid%></a></td>
                        <td><input type="number" value="<%= quantity%>" name="quantity"></td>
                        <td><input class="button" type="submit" value="Update" name="action">
                            <input class="button" type="submit" value="Delete" name="action"></td>

                    </tr>
                </form>
                <%
                    }
                } else {
                %>
                <tr><td>Your cart is EMPTY</td></tr>
                <%}
                    
                %>
                <tr><td>Total Money:  <%=total%>$</td></tr>
                <tr><td>Order Date: <%= (new Date()).toString()%> </td></tr>
                <tr><td>Ship Date: N/A </td></tr>
            </table>
            <section style="text-align: center;">
                <form action="mainController" method="post">
                    <input style="margin-top: 10px;" class="button button--big"   type="submit" value="Save Order" name="action">
                </form>
                <div class="warning"> <font ><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font></div>
            </section>

        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
