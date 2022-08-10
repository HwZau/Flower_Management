<%-- 
    Document   : registration
    Created on : Feb 16, 2022, 10:03:56 AM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header><%@include file="header.jsp" %></header>
        <section class="form container">
            <form class="signup" action="mainController" method="post">
                <h1 class="form--title">REGISTER</h1>

                <table>
                    <tr>
                        <td class="form--text">Email</td>
                        <td ><input class="form--input" type="email" name="txtemail"  required="" value="<%= (request.getAttribute("txtemail") == null) ? "" : request.getAttribute("txtemail")%>" pattern="^(\\w)+@(a-zA-Z]+([.](\\w)+){1,2}"></td>
                    </tr>
                    <tr>
                        <td class="form--text">Full Name</td>
                        <td><input class="form--input" type="text" name="txtfullname"  required="" value="<%= (request.getAttribute("txtfullname") == null) ? "" : request.getAttribute("txtfullname")%>"></td>
                    </tr>
                    <tr>
                        <td class="form--text">Password</td>
                        <td ><input class="form--input" type="password" name="txtpassword" required=""></td>
                    </tr>

                    <tr>
                        <td class="form--text">Phone</td>
                        <td ><input class="form--input" type="text" name="txtphone" value="<%= (request.getAttribute("txtphone") == null) ? "" : request.getAttribute("txtphone")%>"
                                    <%=  (request.getAttribute("ERROR") == null) ? "" : request.getAttribute("ERROR")%>  
                        </td>
                    </tr>
                    <tr><td></td>
                        <td colspan="2"><input class="button button--big button--form" type="submit" value="Register" name="action"></td>
                    </tr>
                </table>
                <p style="text-align:center;font-size: 16px ">Already have an account? <a style="text-decoration: underline; font-size: 16px;" href="login.jsp">Login</a></p>
            </form>


        </section>
        <footer><%@include file="footer.jsp" %></footer>
    </body>
</html>
