<%-- 
    Document   : managePlants
    Created on : Mar 20, 2022, 2:21:43 PM
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
        <table class="order">
            <tr>
                <th>Plant ID</th>
                <th>Plant Name</th>
                <th>Price</th>
                <th>Image</th>
                <th>Description</th>
                <th>Status</th>
                <th>Categories ID</th>
            </tr>
            <c:if test="${listPlants == null}">
                <h3>Empty</h3>
            </c:if>
            <c:forEach items="${listPlants}" var="listP">
                <tr> 
                    <td><c:out value="${listP.getId()}" /></td>
                    <td><c:out value="${listP.getName()}" /></td>
                    <td><c:out value="${listP.getPrice()}"/></td>
                    <td><img class="plantimg" src="<c:out value="${listP.getImgpath()}"/>" ></td>
                    <td><c:out value="${listP.getDescription()}"/></td>
                    <td>
                        <c:if test="${listP.getStatus() == 1}">Stocking</c:if>
                        <c:if test="${listP.getStatus() == 0}">Out of stock</c:if>
                        </td>
                        <td><c:out value="${listP.getCateid()}"/></td>
                </tr>
            </c:forEach>           
        </table>
        <div style="text-align: center;">
        <a href="mainController?action=addNewPlant">Add New Plant</a>  
        <br/>
        <a href="mainController?action=viewUpdatePlant">Update Plant</a>   
        </div>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>

    </body>
</html>
