<%-- 
    Document   : adminDash
    Created on : Jul 15, 2022, 6:43:30 PM
    Author     : Suraj
--%>

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

    <div class="dash">
        
        <!-- Image -->
        <div class="image-container">
            <img src="./images/admin.png" alt="admin">
        </div>
        <%
                    String msg = request.getParameter("msg");

                    if("invalid".equals(msg)){
                    %>
                    <h3>Blood Group can't be Updated.</h3>
                    <%
                     }
                    else{
                        %>
                    
                        <h3>Blood Group Updated Successfully.</h3>
                        <%
                    }
                 %>
        <!-- Panel Area -->
        <div class="panel">
            <div class="panel-body">
                <h3>Manage Requests</h3>
                <form action="adminDashBusiness.jsp" methos="post">
                <div class="confirm">
                    <div class="request">
                        <div class="btns">
                            <span >Accept</span><!-- comment -->
                            <span >Accept</span><!-- comment -->
                            <span >Accept</span><!-- comment -->
                            <button class="accept" value="Accept" name="Accept">Accept</button>
                            <button class="reject">Reject</button>
                        </div>
                    </div>
                </div>
                    </form>

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
        <!-- Dashboard Area Finish -->
    </div>

</body>

</html>
