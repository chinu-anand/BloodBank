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
            
            String mesg= request.getParameter("msg");
            String id = request.getParameter("id");
            String unt = request.getParameter("unt");
//            System.out.println(mesg);
//            System.out.println(id);
//            System.out.println(unt);
            System.out.println(bg.equals("B "));
            System.out.println(bg+"&&"+"B+");
            
            if(bg.equals("B")){
                bg="B+";
            }
            
            
            
            System.out.println(bg);
           
            String msg="invalid";

            
            try{
               
                Connection con = MySqlConnector.getCon();
                
                if(mesg!=null&&id!=null&&unt!=null&&bg!=null){
                    if(!ss.equals("admin@admin")){
                        msg="login";
                        int y=1/0;
                    }
//                Statement statement = con.createStatement() ;
//                ResultSet rs = statement.executeQuery("select * from blood where bloodgroup='"+bg+"'");
                
                PreparedStatement psp = con.prepareStatement("select * from blood where bloodgroup=?");
                if(bg.equals("A ")){
                    psp.setString(1, "A+");
                }
                else if(bg.equals("B ")){
                    psp.setString(1, "B+");
                }
                else if(bg.equals("O ")){
                    psp.setString(1, "O+");
                }
                else if(bg.equals("AB ")){
                    psp.setString(1, "AB+");
                }
                else{
                    psp.setString(1, bg);
            }
                
               
                ResultSet rs = psp.executeQuery();
                
                int m = 0;

                    while(rs.next()){
                            
                            m+=Integer.parseInt(rs.getString("units"));
                    }
                 
                 
                
                System.out.println(m);
                
                if(m<Integer.parseInt(unt)){
                        msg="overflow";
                        int y=1/0;
                 }
                 
                 System.out.println(mesg.equals("Accepted"));
               
                if(mesg.equals("Accepted")){
               
                PreparedStatement pst = con.prepareStatement("update blood set units=? where bloodgroup=?");
                if(bg.equals("A ")){
                
                    pst.setString(2, "A+");
                }
                else if(bg.equals("B ")){
                    pst.setString(2, "B+");
                }
                else if(bg.equals("O ")){
                    pst.setString(2, "O+");
                }
                else if(bg.equals("AB ")){
                    pst.setString(2, "AB+");
                }
                else{
                    pst.setString(2, bg);
            }
                pst.setString(1,Integer.toString(m-Integer.parseInt(unt)));
                pst.executeUpdate();
                } 
                
                 
                 
                PreparedStatement pss = con.prepareStatement("update bloodrequest set cur_status=? where id=?");
                pss.setString(2,id);
               // ps.setString(2,Integer.toString(Integer.parseInt(unt)-m));
                pss.setString(1,mesg);
                pss.executeUpdate();
                
               
                
                msg=mesg;
               
            }
            
            //units update code
            else{
                
                Statement statement = con.createStatement() ;
                ResultSet resultset = statement.executeQuery("select * from blood where bloodgroup='"+bg+"'");
                
                if(!ss.equals("admin@admin")){
                        msg="login";
                        int y=1/0;
                }
                int x = Integer.parseInt(update);

                    while(resultset.next()){
                            
                            x+=Integer.parseInt(resultset.getString("units"));
                    }
                
                if(x<0){
                        msg="neg";
                        int y=1/0;
                }
                
                PreparedStatement pst = con.prepareStatement("update blood set units=? where bloodgroup=?");
                pst.setString(2,bg);
                pst.setString(1,Integer.toString(x));
                int i = pst.executeUpdate();
                
                if(i<0){
                    int y=1/0;
                }
                msg="valid";
                
//                System.out.println(x);
//          }      System.out.println("hellooooooooooooooo");
            }
                response.sendRedirect("adminDash.jsp?msg="+msg);
                
            
            }
            catch(Exception e){
                response.sendRedirect("adminDash.jsp?msg="+msg);
            } 
            %>
    </body>
</html>
