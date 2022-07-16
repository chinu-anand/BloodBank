<%-- 
    Document   : Register.jsp
    Created on : Jul 15, 2022, 6:42:25 PM
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
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Open+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./Register.css">
    <link rel="icon" type="image/x-icon" href="./images/bloodbank.png">
    <title>Register</title>
</head>

<body>

    <script>
        function msg(s){
            alert(s);
        }
    </script>

    <!-- navbar -->
    <header>
        <nav class="navbar">
            <div class="logo">
                <img src="./images/bloodbank.png" alt="logo">
                <h3>Blood Bank</h3>
            </div>
            <div class="navlinks">
                <ul class="link-items">
                    <a href="index.jsp">
                        <li class="link-item">Home</li>
                    </a>
                    <li class="link-item">About Us</li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- navbar finish -->
    
   

    <!-- Register Body Area -->
    <div class="form">
        <div class="form-container">
            <div class="form-body">
                 <%
           String msg = request.getParameter("msg");
           
           if("valid".equals(msg)){
           %>
           <script>msg("Registration Successful.")</script>
           <%
            }
        %>
        
        <% 
           if("invalid".equals(msg)){
           %>
           <script>msg("Password Mismatch.")</script>
           <%
            }
        %>
        
        <% 
           if("exist".equals(msg)){
           %>
                <script>msg("Email Already exist.")</script>
           <%
            }
        %>
        <% 
           if("lenProblem".equals(msg)){
           %>
                <script>msg("Password Must be of length 6 or greater.")</script>
           <%
            }
        %>
                <p>Enter Your Details</p>
                <form action="RegisterBusiness.jsp" method="post">
                    <div class="container">
                        <!-- Mandatory Fields -->
                        <div class="field">
                            <label for="name">Name :</label>
                            <input type="text" name="name" id="name" placeholder="Full Name" required>
                        </div>
                        <div class="field">
                            <label for="email">Email :</label>
                            <input type="email" name="email" id="email" placeholder="Email Id" required>
                        </div>
                        <div class="field">
                            <label for="password">Password :</label>
                            <input type="password" name="password" id="password" placeholder="New Password" required>
                        </div>
                        <div class="field">
                            <label for="confirmPass">Confirm Password :</label>
                            <input type="password" name="confirmpass" id="confirmpass" placeholder="Confirm Password"
                                required>
                        </div>

                        <!-- Selection of Blood Group -->
                        <div class="field">
                            <label for="bloodgrp">Blood Group :</label>
                            <select name="bloodgrp" id="bloodgrp" class="selects" required>
                                <option value="A+">A+</option>
                                <option value="A-">A-</option>
                                <option value="B+">B+</option>
                                <option value="B-">B-</option>
                                <option value="O+">O+</option>
                                <option value="O-">O-</option>
                                <option value="AB+">AB+</option>
                                <option value="AB-">AB-</option>
                            </select>
                        </div>
                        <button class="btn" id="register">Register</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="image-container">
            <img src="./images/register.png" alt="register-illustration">
        </div>
    </div>

    <!-- Register Body Area Finish -->

</body>

</html>
