<!--<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UNITEC</title>
    <link href="static/css/main.css" rel="stylesheet" type="text/css" />
    <link href="static/css/principal.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
     Latest compiled and minified CSS 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="header">
            <center><h1>SISTEMA UNIVERSITARIO</h1></center>
        </div>
        <div class="row panel-primary">
            <div class="col col-md-3 col-md-offset-1">
                <h3>Perfiles</h3>
                <ol class="menu">
                    <li><a href="login.jsp">Administrador (Registro)</a></li>
                    <li><a href="login.jsp">Profesores</a></li>
                    <li><a href="login.jsp">Alumnos</a></li>
                </ol>
            </div>
        </div>
        <div class="footer">
            <center><h3>DERECHOS RESERVADOS </h3></center>
        </div>
    </div>
</body>
</html>-->



<%-- 
    Document   : index
    Created on : 28-ago-2017, 18:52:01
    Author     : MarioBarahona
--%>

<%@page import="Dba.OracleConn"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body background="Fondo_Mostrar_Cliente.jpg" >
        <h1></h1>
        <div align="center">
            <a href="admin.jsp">  </a>
            <div align="center">
                <br>
                <h4><font color="Black"> LISTA DE TARJETAS</font></h4>  
                <br>

                <div class="col-md-1"></div>
                <div class="table-responsive">
                    <div class="container">
                        <table  class="table table-bordered"  >
                            <thead>

                                <tr class="warning  ">
                                    <th><font color ="black">Codigo</font></th>
                                    <th><font color ="black">Nombre de Usuario</font></th>
                                </tr>
                            </thead>          


                            <%
                                Connection con = null;

                                Statement st = null;
                                try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("select * from testing");
                                    ResultSet rs = db.query.getResultSet();

                                    String centinela = "n";
                                    while (rs.next()) {%>
                                        <tr>
                                            <td><%=rs.getString(1)%></td> <td><%=rs.getString(2)%></td>
                                        </tr>

                            <%
                                    }

                                    st.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                            %>                
                        </table>

                    </div> 

                </div>
            </div>
        </div>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <center>
        <form action="CrearTarjeta.jsp">
            <button type="submit" class="btn btn-default" > Regresar <span class="glyphicon glyphicon-share-alt"></span></button>
        </form>
    </center>      

</body>


</html>
