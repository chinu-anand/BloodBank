<%-- 
    Document   : userDash
    Created on : Jul 15, 2022, 6:45:08 PM
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
    <link rel="stylesheet" href="./userDash.css">
    <link rel="icon" type="image/x-icon" href="./images/bloodbank.png">
    <title>Dashboard</title>
</head>

<body>
    <!-- navbar -->
    <header>
        <nav class="navbar">
            <div class="logo">
                <img src="./images/bloodbank.png" alt="logo">
                <h3>Blood Bank</h3>
            </div>
            <div class="navlinks">
                <ul class="link-items">
                    <li class="link-item">My Profile</li>
                    <a href="LogoutBusiness.jsp">
                        <li class="link-item">Log Out</li>
                    </a>
                </ul>
            </div>
        </nav>
    </header>
    <!-- navbar finish -->

    <!-- Dashboard Area -->
    <div class="container">
        <div class="dash">
            
            <!-- Image -->
            <div class="image-container">
                <img src="./images/user.png" alt="userDash">
            </div>
             <%
                    String msg = request.getParameter("msg");

                    if("invalid".equals(msg)){
                    %>
                    <h3>Oops Please try again.</h3>
                    <%
                     }
                    else if("valid".equals(msg)){
                        %>
                    
                        <h3>Request sent successfully.</h3>
                        <%
                    }
                 %>
            <!-- Application Atatus -->
            <div class="status">
                <h3>Application Status</h3>
                <div class="table">
                    <table
                    <tr><th>Blood Group</th>
                            <th>Units</th>
                            <th>Status</th>
                    </tr>
                    
                    <%
                            Connection con = MySqlConnector.getCon();
                            Statement statement = con.createStatement() ;
                            ResultSet resultset = statement.executeQuery("select * from bloodrequest where email='"+(String)session.getAttribute("username")+"'");
                            while(resultset.next()){ %>
                         <tr>
                             <td style="color:orangered"><%=resultset.getString("Bloodgroup")%></td>
                            <td style="color:orangered"><%=resultset.getString("units")%></td>
                            <td style="color:orangered"><%=resultset.getString("cur_status")%></td>
                        </tr>
                        <% }
                        %>
<!--                    <tr>
                            <td>B-</td>
                            <td>0</td>
                            <td>Rejected</td>
                        </tr>
                    <tr>
                            <td>B-</td>
                            <td>0</td>
                            <td>Accepted</td>
                        </tr>
                    <tr>
                            <td>B-</td>
                            <td>0</td>
                            <td>Pending</td>
                        </tr>-->
                        </table>
                </div>
            </div>
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
//                            Connection con = MySqlConnector.getCon();
//                            Statement statement = con.createStatement() ;
                            ResultSet rset = statement.executeQuery("select * from blood") ;
                            while(rset.next()){ %>
                         <tr>
                             <td style="color:orangered"><%=rset.getString("bloodgroup")%></td>
                            <td style="color:orangered"><%=rset.getString("units")%></td>
                        </tr>
                        <% }
                        %>
                        
<!--                        <tr>
                            <td>A-</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>B+</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>B-</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>O+</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>O-</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>AB+</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td>AB-</td>
                            <td>0</td>
                        </tr>-->
                    </table>
                </div>
            </div>


        </div>
        <!-- Dashboard Area Finish -->

        <!-- Apply Area -->
        <div class="apply">
            <form action="userDashBusiness.jsp" method="post">
            <div class="apply-box">
                <h3>Apply for Blood:</h3>
                <div class="btncontainer">
                    <h3>Group -</h3>
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
                    <h3>Quantity -</h3>
                    <select name="update" id="bldgrp" class="selects">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>

                    <button>Apply</button>
                </div>
            </div>
                </form>
        </div>

        <!-- Apply Area Finish -->

    </div>

</body>

</html>