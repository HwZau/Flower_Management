<%-- 
    Document   : ManageAccount
    Created on : Mar 7, 2022, 12:35:01 PM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Accounts</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>

        <c:import url="header_loginedAdmin.jsp"/>
        <form action="mainController" method="post">
            <input type="text" name="txtSearch" value="${param.txtSearch}">
            <input class="button" type="submit" value="Search Account" name="action">
        </form>

        <h1></h1>
        <table class="order container">
            <c:if test="${requestScope.accountList != null || searchAcc != null}">
            <tr>
                <th> ID</th>
                <th> Email</th>
                <th> Full Name</th>
                <th> Status</th>
                <th> Phone</th>
                <th> Role</th>
                <th> Action</th>
            </tr>
            </c:if>
            <c:forEach var="acc" items="${requestScope.accountList}">
                <tr>
                    <td><c:out value="${acc.getAccID()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>
                    <td><c:out value="${acc.getFullname()}"></c:out></td>
                        <td>
                        <c:choose>
                            <c:when test="${acc.getStatus() eq 1}"> Active </c:when>
                            <c:otherwise>InActive</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:out value="${acc.getPhone()}"></c:out>
                        </td>
                        <td>
                        <c:choose>
                            <c:when test="${acc.getRole() eq 1}"> Admin</c:when>
                            <c:otherwise>User</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${acc.getRole() eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/Unblock</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${requestScope.searchAcc != null}">
                <tr>
                    <td><c:out value="${requestScope.searchAcc.getAccID()}"></c:out></td>
                    <td><c:out value="${requestScope.searchAcc.getEmail()}"></c:out></td>
                    <td><c:out value="${requestScope.searchAcc.getFullname()}"></c:out></td>
                        <td>
                        <c:choose>
                            <c:when test="${requestScope.searchAcc.getStatus() eq  1}">Active</c:when>
                            <c:otherwise>InActive</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${requestScope.searchAcc.getPhone()}"></c:out></td>                  
                        <td>
                        <c:choose>
                            <c:when test="${requestScope.searchAcc.getRole() eq 1}">Admin</c:when>
                            <c:otherwise>User</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:if test="${requestScope.searchAcc.getRole()eq 0}">
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${requestScope.searchAcc.getEmail()}"></c:param>
                                <c:param name="status" value="${requestScope.searchAcc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a href="${mylink}">Block/UnBlock</a>
                        </c:if></td>
                </tr>
                
            </c:if>

            <c:if test="${requestScope.accountList == null && requestScope.searchAcc == null}">
                <h3 style="color: red">Account not exist!</h3> 
            </c:if>
        </table>
        <footer>
            <c:import url="footer.jsp"/>
        </footer>
    </body>
</html>
