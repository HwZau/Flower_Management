<%-- 
    Document   : header
    Created on : Feb 16, 2022, 9:41:23 AM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="#"> <img src="./img/logo.jpg" id="logo"/> </a></li>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="registration.jsp">Register</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="mainController?action=viewcart">View Cart</a></li>
                    <li><form action="mainController" method="post" class="formsearch">
                            <input placeholder="Search product here!" type="text" name="txtsearch" value="<%=(request.getParameter("txtsearch") == null)?"" : request.getParameter("txtsearch")%>">
                            <select name="searchby">
                                <option value="byname">By Name</option>
                                <option value="bycate">By Category</option>
                            </select>
                            <input class="button"  type="submit" value="Search Product" name="action" >
                        </form></li>
                </ul>
            </nav>
        </header>
    </body>
</html>
