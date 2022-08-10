<%-- 
    Document   : changeProfile
    Created on : Feb 27, 2022, 1:32:10 PM
    Author     : HwZau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp"%>
        </header>
        <section class="form container">
        <form class="signin" action="mainController" method="post">
            <h1 class="form--title">Change Profile</h1>
            <table >
                <tr>
                    <td class="form--text">Full Name</td>
                    <td><input class="form--input" name="txtfullname"></td>              
                </tr> 
                <tr>
                    <td class="form--text">Phone Number</td>
                    <td><input class="form--input" name="txtphonenumber"></td>              
                </tr>
                <tr>
                    <td class="form--text">Password</td>
                    <td><input class="form--input" placeholder="Confirm your password" type="pasword" name="txtpassword"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input class="button button--big" style="margin-left: 30px" type="submit" value="changeProfile" name="action"></td>
                </tr>

                <%
                    if (request.getAttribute("updateSuccess") != null) {%>
                <p style="text-align: center; color: green"><%=request.getAttribute("updateSuccess")%> </p>
                <%
                    }
                %>

                <%
                    if (request.getAttribute("updateFail") != null) {%>
                <p style="text-align: center;color: red"><%=request.getAttribute("updateFail")%> </p>
                <%
                    }
                %>

            </table> 
                
        </form>
                <h3 style="text-align:  center"><a href="viewAllOrderPersonalServlet">View All Orders</a></h3>
    </section>
        <footer>
            <%@include file="footer.jsp"%>
        </footer>
    </body>
</html>