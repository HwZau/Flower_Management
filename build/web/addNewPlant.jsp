<%-- 
    Document   : addNewPlant
    Created on : Mar 20, 2022, 2:09:04 PM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <c:import url="header_loginedAdmin.jsp"/>
        </header>
        <section class="container">
        <table class="order-table">
            <form method="post" action="mainController">               
                <tr><td>Plant Name</td><td><input name="pName" required="required" pattern="^[^0-9]+$"></td></tr>
                <tr><td>Price</td><td><input name="price" required="required" pattern="[^a-zA-Z-Z0-9_]+"></td></tr>
                <tr><td>Image</td><td><input name="imgPath" required="required"></td></tr>
                <tr><td>Description</td><td><input name="description" required="required" pattern="^[^0-9]+$"></td></tr>
                <tr><td>Status</td><td><input name="status" required="required"></td></tr>
                <tr><td>Categories ID</td><td><input name="cateId" required="required"></td></tr>                
                <tr><td></td><td><input class="button" type="submit" name="action" value="createNewPlant" ></td></tr>
            </form>
        </table>
        <c:if test="${message != null}">
            <h3 style="color: green"><c:out value="${message}"/></h3>
        </c:if>
        <c:if test="${notValidCateId != null}">
            <h3 style="color: red"><c:out value="${notValidCateId}"/></h3>
        </c:if>
            <a style="display: block; text-align: center;" href="mainController?action=viewUpdatePlant">Update Plant</a>
            </section>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
