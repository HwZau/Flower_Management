<%-- 
    Document   : header_loginedUser
    Created on : Feb 16, 2022, 10:10:43 AM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="changeProfile.jsp">Change Profile</a></li>
                    <li><a href="compeltedOrders.jsp">Completed Orders</a></li>
                    <li><a href="canceledOrders.jsp">Canceled Orders</a></li>
                    <li><a href="processingOrders.jsp">Processing Orders</a></li>
                    <form action="mainController">
                        <li>Form <input type="date" name="form" value="${param.from}"> To <input type="date" name="to" value="${param.to}"> 
                            <input class="button button--medium" type="submit" value="Search Date" name="action"></input></li>
                    </form>
                    
                </ul>
            </nav>
        </header>
    </body>
</html>
