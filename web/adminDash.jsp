<%-- 
    Document   : adminDash
    Created on : Jul 15, 2022, 6:43:30 PM
    Author     : Suraj
--%>

<%@page import="Packages.MySqlConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./adminDash.css">
    <link rel="icon" type="image/x-icon" href="./images/bloodbank.png">
    <title>Dashboard</title>
</head>

<body>
      
    <!-- navbar -->
    <header>
        <nav class="navbar">
            <div class="logo">
                <img src="images/bloodbank.png" alt="logo">
                <h3>Blood Bank</h3>
            </div>
            <div class="navlinks">
                <ul class="link-items">
                   
                    <a href="LogoutBusiness.jsp">
                        <li class="link-item">Log Out</li>
                    </a>
                </ul>
            </div>
        </nav>
    </header>
    <!-- navbar finish -->

    <!-- Dashboard Area -->

    <div class="dash">
        
        <!-- Image -->
        <div class="image-container">
            <img src="./images/admin.png" alt="admin">
        </div>
        <%
            if((String)session.getAttribute("username")==null){
            %>
                <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Please Login to see admin page!!!");
                            }, 500); 
                </script>
            <%
            }
            else{
            %>
        <%
                    String msg = request.getParameter("msg");

                    if("invalid".equals(msg)){
                    %>
                        <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Oops Please try again.!!!");
                            }, 500); 
                </script>
                    
                    <%
                     }%>
                <%  if("valid".equals(msg)){
                        %>
                        
                        <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Blood Bank Updated Successfully..");
                            }, 500); 
                </script>
                        <%
                    }
                 %>
                 
                 <%  if("neg".equals(msg)){
                        %>
                        
                        <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Oops units can't be -ve!!!!");
                            }, 500); 
                </script>
                        <%
                    }
                 %>
                 
                 <%  if("overflow".equals(msg)){
                        %>
                        
                        <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Oops Required units not available !!!!");
                            }, 500); 
                </script>
                        <%
                    }
                 %>
                 
                  <%  if("overflow".equals(msg)){
                        %>
                        
                        <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Oops Required units not available !!!!");
                            }, 500); 
                </script>
                        <%
                    }
                 %>
                 
                 <%  if("Accepted".equals(msg)){
                        %>
                        
                        <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Units accepted successfully!!!!");
                            }, 500); 
                </script>
                        <%
                    }
                 %>
                 
                 <%  if("Rejected".equals(msg)){
                        %>
                        
                        <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Units Rejected successfully!!!!");
                            }, 500); 
                </script>
                        <%
                    }
                 %>
                  <!-- Availablity Chart -->
            <div class="chart">
                <h3>Availablity Chart</h3>
                <div class="table">
                    <table>
                        <tr>
                            <th>Group</th>
                            <th>Amount</th>
                        </tr>
                        <%
                            Connection con = MySqlConnector.getCon();
                            Statement statement = con.createStatement() ;
                            ResultSet rset = statement.executeQuery("select * from blood") ;
                            while(rset.next()){ %>
                         <tr>
                             <td style="color:orangered"><%=rset.getString("bloodgroup")%></td>
                            <td style="color:orangered"><%=rset.getString("units")%></td>
                        </tr>
                        <% }
                        %>
                    </table>
                </div>
            </div>

        <!-- Panel Area -->
        <div class="panel">
            <div class="panel-body">
                <h3>Manage Requests</h3>
               
                <div class="confirm">
                     <%
                            //Connection con = MySqlConnector.getCon();
                            //Statement statement = con.createStatement() ;
                            String stat = "Pending";
                            ResultSet rs = statement.executeQuery("select * from bloodrequest where cur_status='"+stat+"'");
                            while(rs.next()){ %>
                    <div class="request">
                        <div class="data">
                            <span ><%=rs.getString("Bloodgroup")%></span><!-- comment -->
                            <span ><%=rs.getString("units")%></span><!-- comment -->
                            <span ><%=rs.getString("email")%></span><!-- comment -->
                        </div>
                        <div class="btns"> 
                            <a href="adminDashBusiness.jsp?msg=Accepted&id=<%=rs.getString("id")%>&unt=<%=rs.getString("units")%>&bldgrp=<%=rs.getString("Bloodgroup")%>">
                                <button class="accept">Accept</button>
                            </a>
                            <a href="adminDashBusiness.jsp?msg=Rejected&id=<%=rs.getString("id")%>&unt=<%=rs.getString("units")%>&bldgrp=<%=rs.getString("Bloodgroup")%>">
                                <button class="reject">Reject</button>
                            </a>
                        </div>
                            
                        
                    </div>
                     <%}%>
                </div>
                

                <!-- <h3>Manage Stock</h3> -->
                <h3>Manage Stock</h3>
                <form action="adminDashBusiness.jsp" method="post">
                <div class="update-box">
                    
                    <p>Group -</p>
                    <select name="bldgrp" id="bldgrp" class="selects">
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                    </select>
                    <p>Quantity -</p>
                    <input type="number" name="update" step="1" value="0">
                    <button>Update</button>
                   
                </div>
                     </form>
            </div>

        </div>
                <% }
                %>
        <!-- Dashboard Area Finish -->
    </div>
        


</body>

</html>
