<jsp:useBean id="account" scope="session" type="ebanking.model.Account"/>
<jsp:useBean id="user" scope="session" type="ebanking.model.User"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-7"
         pageEncoding="ISO-8859-7" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Jumbotron Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/jumbotron.css" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-default fixed-top">
    <a class="navbar-brand" href="#">${user.firstName}</a>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Deposit</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Withdraw</a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="logoutcontroller">Logout<span class="sr-only">(current)</span></a></li>
        </ul>
    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">Μεταφορά χρημάτωv, με ασφάλεια!</h1>
        <p>Η τράπεζά μας σας δίνει την δυνατότητα για μεταφορά χρημάτων από κάποιον λογαριασμό σας, σε έναν άλλον,
        εύκολα, και με ασφάλεια!
            <br> Επίσης έχετε την δυνατότητα πίστωσης χρημάτων στο λογαριασμό σας, με την υπηρεσία Topup.
        </p>
    </div>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <h2>Transfer</h2>
            <form method="post" action="transfertopupcontroller">
                <div class="form-group row">
                    <label for="example-text-input" class="col-2 col-form-label">Account</label>
                    <div class="col-10">
                        <input class="form-control" type="text" value="Target account" name="transferToAccount" id="example-text-input">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="example-number-input" class="col-2 col-form-label">Amount</label>
                    <div class="col-10">
                        <input class="form-control" type="number" value="100" name="amount" id="example-number-input">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Transfer</button>
            </form>
        </div>
        <div class="col-md-4">
            <%
                Object error = request.getAttribute("errorMessage");
                if (error != null) {
                    String show = "<div class=\"alert alert-danger alert-dismissable fade in\">"
                            + "<a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>"
                            + "<strong>Oops!</strong> %s"
                            + "</div>";
                    out.println(String.format(show, error));
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
        <div class="col-md-4">
            <h2>Topup</h2>
            <div class="col-md-12 alert alert-info">Current Balance: ${account.balance}</div>
            <div class="col-md-12 container">
                <form method="post" action="transfertopupcontroller">
                    <fieldset class="form-group">
                        <legend>Choose amount</legend>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="amount" id="optionsRadios1"
                                       value="500" checked>
                                500
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="amount" id="optionsRadios2"
                                       value="1000">
                                1000
                            </label>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="amount" id="optionsRadios3"
                                       value="1500">
                                1500
                            </label>
                        </div>
                    </fieldset>
                    <button type="submit" class="btn btn-primary">Topup</button>
                </form>
            </div>
        </div>
    </div>

    <hr>

    <footer>
        <p>&copy; Company 2017</p>
    </footer>
</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

