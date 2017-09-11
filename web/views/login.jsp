<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sistema Universitario | Login</title>
    <!--<link href="static/css/main.css" rel="stylesheet" type="text/css" />-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
    <center>
        <h1>Sistema Universitario</h1>
    </center>
    <div class="row">
    <form class="login col-md-4 col-md-offset-4" action="../controlers/autenticacion.jsp" method="POST">
        <div class="form-group">
            <label for="exampleInputEmail1">Usuario</label>
            <input type="text" class="form-control" name="user" placeholder="User ID">
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Contrasena</label>
            <input type="password" class="form-control" name="pass" placeholder="Password">
        </div>
        <center><button type="submit" class="btn btn-default">Login</button></center>
    </form>
    </div>

</body>
</html>