<%-- 
    Document   : index
    Created on : Feb 16, 2022, 9:47:51 AM
    Author     : HwZau
--%>


<%@page import="hwzau.dao.PlantDAO"%>
<%@page import="hwzau.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section class="container">
            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Plant> list;
                String[] tmp = {"Out Of Stock", "Available"};
                if (keyword == null && searchby == null) {
                    list = PlantDAO.getPlants("","");
                } else {
                    list = PlantDAO.getPlants(keyword, searchby);
                }

                if (list != null && !list.isEmpty()) {
                    for (Plant p : list) {%>
            <table class="product">
                <tr>
                    <td><img src="<%=p.getImgpath()%>" class="plantimg"/> </td>

                    <td class="product--infor"><h3>Information</h3>
                        Product ID: <%= p.getId()%> <br/>
                        Product Name: <%= p.getName()%><br/>
                        Price: <%= p.getPrice()%><br/>
                        Descriptopn : <%= p.getDescription() %> <br/>
                        Status: <%= tmp[p.getStatus()]%><br/>
                        Category: <%= p.getCatename()%></td>
                    <td class="button--product"><a class="button" href="mainController?action=addtocart&pid=<%= p.getId()%>">Add To Cart</a> <br/>
                    <a class="button button--buy"  href="mainController?action=buy&pid=<%= p.getId()%>">Buy Now</a></td>
                </tr>
            </table>
            <%}
            } else {
            %>
            <h1 style="text-align: center; color: red">Not Available</h1>
            <%}

            %>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
