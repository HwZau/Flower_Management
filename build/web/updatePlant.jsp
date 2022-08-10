<%-- 
    Document   : updatePlant
    Created on : Mar 20, 2022, 2:19:20 PM
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
            <table style="width: 99%" class="order">
            <tr>
                <th>Plant ID</th>
                <th>Plant Name</th>
                <th>Price</th>
                <th>Image</th>
                <th>Description</th>
                <th>Status</th>
                <th>Categories ID</th>
            </tr>

            <c:forEach items="${listPlants}" var="listP">

                <form action="mainController" method="post">
                    <tr>
                        <td><input  value="<c:out value="${listP.getId()}"/>" name="pid" readonly type="number" ></td>
                        <td><input title="name not contain number" pattern="^[^0-9]+$" value="<c:out value="${listP.getName()}"/>" name="pName" required="required"></td>
                        <td><input value="<c:out value="${listP.getPrice()}"/>" name="price" required="required" pattern="^[^a-z]+$" type="number"></td>
                        <td><input value="<c:out value="${listP.getImgpath()}"/>" name="imgPath" required="required"></td>
                        <td><input title="description not contain number" pattern="^[^0-9]+$" value="<c:out value="${listP.getDescription()}"/>" name="description" required="required"></td>
                        <td>
                            <input value="<c:out value="${listP.getStatus()}"/>" name="status" required="required" pattern="^[^a-z]+$" type="number">
                        </td>
                        <td><input value="<c:out value="${listP.getCateid()}"/>" name="cateId" required="required" pattern="^[^a-z]+$" type="number"></td>
                        <td><input class="button" name="action" value="updatePlant" type="submit"></td>
                    </tr>
                </form>

            </c:forEach>           
        </table>
        <c:if test="${message != null}">
            <h3 style="text-align: center; color: green"><c:out value="${message}" /></h3>            
        </c:if>
        <c:if test="${notValidCateId != null}">
            <h3 style="text-align: center; color: red"><c:out value="${notValidCateId}" /></h3>            
        </c:if>
            <a style="display: block; text-align: center" href="mainController?action=addNewPlant">Add new Plant</a>  
        
        </section>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
