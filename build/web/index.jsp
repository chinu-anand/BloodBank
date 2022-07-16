<%-- 
    Document   : index.jsp
    Created on : Jul 15, 2022, 6:41:09 PM
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
    <link rel="stylesheet" href="./home.css">
    <link rel="icon" type="image/x-icon" href="./images/bloodbank.png">
    <title>Blood Bank System</title>
</head>

<body>
    <header>
        <nav class="navbar">
            <div class="logo">
                <img src="./images/bloodbank.png" alt="logo">
                <h3>Blood Bank</h3>
            </div>
            <div class="navlinks">
                <ul class="link-items">
                    <a href="login.jsp">
                        <li class="link-item">Login</li>
                    </a>
                    <a href="Register.jsp">
                        <li class="link-item">Register</li>
                    </a>
                    <li class="link-item">About Us</li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="intro">
        <p>This is a <span>Blood Bank System</span> for managing and supplying blood of different categories
            <span>efficiently</span> and <span>reliably</span>.
        </p>
    </div>


</body>

</html>