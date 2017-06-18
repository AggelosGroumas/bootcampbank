<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<div class="login-page">
    <div class="form">
        <form class="register-form" method="post" action="usercontroller">
            <input type="text" name="username" placeholder="username"/>
            <input type="text" name="name" placeholder="name"/>
            <input type="text" name="lastname" placeholder="lastname"/>
            <input type="password" name="password" placeholder="password"/>
            <input type="text" name="emailAddress" placeholder="email address"/>
            <button>create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
        </form>
        <form class="login-form" method="post" action="logincontroller">
            <input type="text" name="username" placeholder="username"/>
            <input type="password" name="password" placeholder="password"/>
            <button>login</button>
            <p class="message">Not registered? <a href="#">Create an account</a></p>
        </form>
    </div>
    <%
        Object error = request.getAttribute("errorMessage");
        if (error != null) {
            String show = "<div class=\"alert alert-danger alert-dismissable fade in\">"
                    + "<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>"
                    + "<strong>Oops!</strong> User creation failed!."
                    + "</div>";
            out.println(show);
        }
        Object message = request.getAttribute("message");
        if (message != null) {
            String show = "<div class=\"alert alert-info alert-dismissable fade in\">\n" +
                    "<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" +
                    "<strong>Info!</strong> %s.\n" +
                    "</div>";
            out.println(String.format(show, message));
        }


    %>

</div>

<script type="text/javascript" src="js/login.js"></script>
</body>
</html>
