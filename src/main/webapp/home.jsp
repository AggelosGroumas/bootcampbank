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
            <li class="nav-item active">
                <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="TransferTopup.jsp">Deposit</a>
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
        <h1 class="display-3">BootCamp - BANK</h1>
        <p>Με πίστη, αφοσίωση και όραμα, η BootCamp Bank διατηρεί σταθερές τις αρχές και τις αξίες που διέπουν τη
            λειτουργία
            της από την ίδρυσή της έως σήμερα. Πρωταρχικός μας στόχος είναι η αξιοπιστία, η συνέπεια και η ταχύτητα στην
            τραπεζική
            εξυπηρέτηση. Καθημερινό μας μέλημα; Η συνεχής ποιοτική και ποσοτική βελτίωση του επιπέδου των προϊόντων και
            των υπηρεσιών μας,
            η σύγχρονη και υπεύθυνη αντιμετώπιση όλων των τραπεζικών αναγκών των πελατών μας.</p>
    </div>
</div>

<div class="container">
    <!-- Example row of columns -->
    <div class="row">
        <div class="col-md-4">
            <img src="img/safeauto.png">
            <p>BootCamp Bank σε συνεργασία με την BootCamp Ασφαλιστική Α.Ε., τον πρώτο Ασφαλιστικό Όμιλο παγκοσμίως,
                δημιούργησαν αποκλειστικά για εσάς, τους Πελάτες μας, το νέο Πρόγραμμα ασφαλίσεως αυτοκινήτων "Safe
                Auto".
                Το νέο Πρόγραμμα σάς προσφέρει τρία ολοκληρωμένα προγράμματα ασφαλίσεως αυτοκινήτου σε προνομιακή τιμή.
                Επιλέξτε το πρόγραμμα ασφαλίσεως που ανταποκρίνεται στις ανάγκες σας και τις οικονομικές σας δυνατότητες
                και
                αποκτήστε το άμεσα με ιδιαιτέρως απλές και γρήγορες διαδικασίες..</p>
        </div>
        <div class="col-md-4">
            <img src="img/feelsafe.png">
            <p>H BootCamp Bank σε συνεργασία με την BootCamp Ασφαλιστική Α.Ε., τον πρώτο Ασφαλιστικό Όμιλο παγκοσμίως,
                δημιούργησαν αποκλειστικά για εσάς, τους Πελάτες μας, το νέο πρόγραμμα ασφαλιστικής καλύψεως κατόχων
                πιστωτικών ή
                χρεωστικών καρτών BootCamp Bank: Feel Safe. Το Πρόγραμμα αφορά στην προαιρετική ασφάλιση πιστωτικών ή
                χρεωστικών καρτών.</p>
        </div>
        <div class="col-md-4">
            <img src="img/healthforall.png">
            <p>H BootCamp Bank σε συνεργασία με την BootCamp Ασφαλιστική Α.Ε., δημιούργησε το Πρόγραμμα βασικής ιατρικής
                καλύψεως "BootCamp Υγεία για Όλους Classic" που φροντίζει την υγεία σας, με ολοκληρωμένες παροχές
                προλήψεως και
                διαγνώσεως για ενήλικες και παιδιά, μέσω του ευρύτατου δικτυού συμβεβλημένων διαγνωστικών κέντρων της
                Βιοϊατρική Α.Ε.,
                σε ιδιαίτερα προνομιακές τιμές..</p>
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

