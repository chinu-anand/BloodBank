<%-- 
    Document   : adminDashBusiness
    Created on : Jul 15, 2022, 9:35:47 PM
    Author     : Suraj
--%>

<%@page import="Packages.MySqlConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String bg = request.getParameter("bldgrp");
            String update = request.getParameter("update");
            
            String ss = (String)session.getAttribute("username");

            
            try{
               
                Connection con = MySqlConnector.getCon();
                Statement statement = con.createStatement() ;
                ResultSet resultset = statement.executeQuery("select * from blood where bloodgroup='"+bg+"'") ;
                
                if(!ss.equals("admin@admin")){
                        int y=1/0;
                }
                int x = Integer.parseInt(update);

                    while(resultset.next()){
                            
                            x+=Integer.parseInt(resultset.getString("units"));
                    }
                
                if(x<0){
                        int y=1/0;
                }
                
                PreparedStatement pst = con.prepareStatement("update blood set units=? where bloodgroup=?");
                pst.setString(2,bg);
                pst.setString(1,Integer.toString(x));
                int i = pst.executeUpdate();
                
                if(i<0){
                int y=1/0;
                }
                
//                System.out.println(x);
//                System.out.println("hellooooooooooooooo");
                response.sendRedirect("adminDash.jsp?msg=valid");
                

            }
            catch(Exception e){
                response.sendRedirect("adminDash.jsp?msg=invalid");
            } 
            %>
    </body>
</html>
