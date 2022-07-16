<%-- 
    Document   : LoginBusiness
    Created on : Jul 15, 2022, 8:48:07 PM
    Author     : Suraj
--%>

<%@page import="java.sql.*"%>
<%@page import="Packages.MySqlConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            String email = request.getParameter("username");
            String pass = request.getParameter("password");
            
            if(email.equals("admin@admin")&&pass.equals("admin")){
                response.sendRedirect("adminDash.jsp");
            }

                  //set attribute in session
            session.setAttribute("username", email);
            
            try{
               
                Connection con = MySqlConnector.getCon();
                PreparedStatement pst = con.prepareStatement("Select * from register where email=? and pass=?");
                pst.setString(1, email);
                pst.setString(2, pass);
                ResultSet rs = pst.executeQuery(); 
                
                
                if(rs.next()){

                    response.sendRedirect("userDash.jsp");
                }

            }
            catch(Exception e){
                response.sendRedirect("login.jsp?msg=invalid");
            }            
          %>
    </body>
</html>
