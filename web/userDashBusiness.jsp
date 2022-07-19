

<%@page import="Packages.MySqlConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email =(String)session.getAttribute("username"); 
            String bg = request.getParameter("bldgrp");
            String update = request.getParameter("update");
            String status = "Pending";
            
//            System.out.println(email);
//            System.out.println(bg);
//            System.out.println(update);
//            System.out.println(status);
            
             try{
             
                if((String)session.getAttribute("username")==null){
                    int y=1/0;
                }
               
                Connection con = MySqlConnector.getCon();
                
                
                PreparedStatement pst = con.prepareStatement("insert into bloodrequest(email,Bloodgroup,units,cur_status) values(?,?,?,?)");
                pst.setString(1,email);
                pst.setString(2,bg);
                pst.setString(3,update);
                pst.setString(4,status);
                int i = pst.executeUpdate();
                
                if(i<0){
                int y=1/0;
                }
                

                response.sendRedirect("userDash.jsp?msg=valid");
                

            }
            catch(Exception e){
                response.sendRedirect("userDash.jsp?msg=invalid");
            } 
            
            
            %>
        
    </body>
</html>
