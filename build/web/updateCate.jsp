<%-- 
    Document   : updateCate
    Created on : Mar 20, 2022, 2:20:06 PM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="header_loginedAdmin.jsp"/>
        <section class="container">
        <table class="order">
            <tr>
                <th>Cate ID</th>
                <th>Cate Name</th>
            </tr>
            <c:forEach items="${listCate}" var="listC">

                <form action="mainController" method="post">
                    <tr>
                        <td><input  value="<c:out value="${listC.getCateid()}"/>" name="cateId" readonly type="number"></td>
                        <td><input title="name not contain number" pattern="^[^0-9]+$" value="<c:out value="${listC.getCatename()}"/>" name="cateName"></td>
                        <td><input class="button" name="action" value="updateCate" type="submit"></td>
                    </tr>
                </form>
            </c:forEach>           
        </table>
        <c:if test="${message != null}">
            <h3 style="text-align: center; color: green"><c:out value="${message}" /></h3>            
        </c:if>
            <a style="display: block; text-align: center" href="mainController?action=addNewCate">Add New Categories</a>
        </section>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
