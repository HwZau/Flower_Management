<%-- 
    Document   : manageCategories
    Created on : Mar 20, 2022, 2:47:03 PM
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
        <table class="order">
            <tr>
                <th>Cate ID</th>
                <th>Cate Name</th>
            </tr>
           
            <c:forEach items="${requestScope.listCate}" var="listC">
                <tr> 
                    <td><c:out value="${listC.getCateid()}" /></td>
                    <td><c:out value="${listC.getCatename()}" /></td>                   
                </tr>
            </c:forEach>           
        </table>
        <div style="text-align: center">
        <a href="mainController?action=addNewCate">Add New Cate</a>  
        <br/>
        <a href="mainController?action=viewUpdateCategories">Update Categories</a>   
        </div>
        </section>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
