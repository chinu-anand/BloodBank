<%-- 
    Document   : login
    Created on : Jul 15, 2022, 6:44:18 PM
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
    <link rel="stylesheet" href="./login.css">
    <link rel="icon" type="image/x-icon" href="./images/bloodbank.png">
    <title>Login</title>
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
                    <a href="Register.jsp">
                        <li class="link-item">Register</li>
                    </a>

                    <li class="link-item">About Us</li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- navbar finish -->

    <!-- login form -->
    <div class="login-form">
        <div class="image-container">
            <img src="images/login.png" alt="login-Illustration">
        </div>
        
        <div class="form-container">
            <div class="form-body">
                <%
                    String msg = request.getParameter("msg");

                    if("invalid".equals(msg)){
                    %>
                    <script type = "text/javascript">
                            window.setTimeout(function(){
                                alert("Email or Password Wrong!!!");
                            }, 500); 
                </script>
                    <%
                     }
                 %>
                <p>Enter Login Details</p>
                <form action="LoginBusiness.jsp" method="post">
                    <div class="container">
                        <label for="username">Enter Username</label>
                        <input type="email" name="username" id="username" placeholder="Username/Email">
                        <label for="password">Enter Password</label>
                        <input type="password" name="password" id="password" placeholder="Password">
                        <button class="submitBtn">Submit</button>

                        <!--<a href="#forgotPassword" class="forget">Forgot Password?</a>-->
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- login form finish -->
   

</body>

</html>
