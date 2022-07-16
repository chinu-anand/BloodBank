<%-- 
    Document   : LogoutBusiness
    Created on : Jul 16, 2022, 12:14:05 AM
    Author     : Suraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           
                session.invalidate();
                response.sendRedirect("index.jsp");
         %>
    </body>
</html>
