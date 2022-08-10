<%-- 
    Document   : login
    Created on : Feb 16, 2022, 9:49:31 AM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <section class="form container">

            <form class="signin" action="mainController" method="post" >
                <h1 class="form--title">LOGIN</h1>
                <table>
                    <tr><td class="form--text">Email</td><td><input class="form--input" type="email" name="txtemail"></td></tr>
                    <tr><td class="form--text">Password</td><td ><input class="form--input"  type="password" name="txtpassword"></td></tr>
                    <tr><td></td><td colspan="2"><input class="button button--big button--form" type="submit" value="Login" name="action"></td></tr>
                    <%
                        if (request.getAttribute("invalidEmail") != null) {
                    %>
                    <p style="color: red; text-align: center;">
                        <%= request.getAttribute("invalidEmail")%>
                    </p>
                    <%
                        }
                    %>
                    <tr><td></td><td colspan="2"><input class="button--form" type="checkbox" value="savelogin" name="savelogin"> Stayed Signed In</td></tr>
                </table>
                <div class="warning"><font style="color:red;"><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font></div>
            </form>
        </section>
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
