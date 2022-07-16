
    
<%@page import="Packages.MySqlConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String bg = request.getParameter("bloodgrp");
            String pass = request.getParameter("password");
            String pass1 = request.getParameter("confirmpass");
            

            String msg="valid";
           
            try{
               
                Connection con = MySqlConnector.getCon();
                Statement statement = con.createStatement() ;
                ResultSet resultset = statement.executeQuery("select * from register where email ='"+email+"'") ;

                if(resultset.isBeforeFirst()){
                    msg="exist";
                    int x=1/0;
                }
                if(!pass1.equals(pass)){
                    msg="invalid";
                    int x=1/0;

                }
                
                if(pass.length()<6){
                 msg="lenProblem";
                 int x=1/0;
            }
            
            
            
            PreparedStatement ps = con.prepareStatement("insert into register(username,email,bloodgroup,pass) values(?,?,?,?)");
            ps.setString(1,name);
            ps.setString(2,email);
            ps.setString(3,bg);
            ps.setString(4,pass);
            ps.executeUpdate();
            response.sendRedirect("Register.jsp?msg="+msg);
            
            }
            catch(Exception e){
                response.sendRedirect("Register.jsp?msg="+msg);
            }            
    %>
    </body>
</html>
