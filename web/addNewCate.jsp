<%-- 
    Document   : addNewCate
    Created on : Mar 20, 2022, 2:49:44 PM
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
                <tr><td>Categories Name</td><td><input name="cateName" required="required" required="required"></td></tr>              
                <tr><td></td><td><input class="button" type="submit" name="action" value="createNewCate"></td></tr>
            </form>
        </table>
    <c:if test="${message != null}">
        <h3 style="text-align: center; color: green"><c:out value="${message}"/></h3>
    </c:if>
        <a style="display: block; text-align: center" href="mainController?action=viewUpdateCategories">Update Categories</a>   
    </section>
    <footer>
        <c:import url="footer.jsp"/>
    </footer>
</body>
</html>
