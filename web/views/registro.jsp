<%--
    Document   : menu_principal
    Created on : 09-10-2017, 09:42:41 PM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>

<%//seguridad del sistema%>
<%if (session.getAttribute("s_user") == null) {
        request.getRequestDispatcher("index.html").forward(request, response);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <title>Sistema Universitario | Administracion</title>
    </head>
    <body>
        <!--NAVBAR-->
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Sistema Universitario</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Logueado como <span class="login-name"><%=session.getAttribute("s_nombre")%></span> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Modificar Perfil</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <!--MODALS-->
        <!-- MODAL - CREAR PERIODO -->
        <div class="modal fade" id="modalPeriodoClases" tabindex="-1" role="dialog" aria-labelledby="modalPeriodoClasesLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalPeriodoClasesLabel">Periodo de Clases</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="pclase-code" class="control-label">Cod:</label>
                                <input type="text" class="form-control" id="pclase-code" name="pclase-code">
                            </div>
                            <div class="form-group">
                                <label for="pclase-name" class="control-label">Descripcion:</label>
                                <input type="text" class="form-control" id="pclase-name" name="pclase-name">
                            </div>
                            <div class="form-group">
                                <label for="pclase-anio" class="control-label">Año:</label>
                                <input type="number" class="form-control" id="pclase-anio" name="pclase-anio">
                            </div>
                            <div class="form-group">
                                <label for="pclase-frdate" class="control-label">Fecha Inicio:</label>
                                <input type="date" class="form-control" id="pclase-frdate" name="pclase-frdate">
                            </div>
                            <div class="form-group">
                                <label for="pclase-todate" class="control-label">Fecha Fin:</label>
                                <input type="date" class="form-control" id="pclase-todate" name="pclase-todate">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-pclase">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL - CREAR ALUMNO, PROFESOR, ADMINISTRADORES -->
        <div class="modal fade" id="modalUsuarios" tabindex="-1" role="dialog" aria-labelledby="modalUsuariosLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalUsuariosLabel">Crear Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="usuario-id" class="control-label">Cuenta:</label>
                                <input type="text" class="form-control" id="usuario-id" name="usuario-id">
                            </div>
                            <div class="form-group">
                                <label for="usuario-name" class="control-label">Nombre:</label>
                                <input type="text" class="form-control" id="usuario-name" name="usuario-name">
                            </div>
                            <div class="form-group">
                                <label for="usuario-fnac" class="control-label">Fecha Nac:</label>
                                <input type="date" class="form-control" id="usuario-fnac" name="usuario-fnac">
                            </div>
                            <div class="form-group">
                                <label for="usuario-telefono" class="control-label">Telefono:</label>
                                <input type="text" class="form-control" id="usuario-telefono" name="usuario-telefono">
                            </div>
                            <div class="form-group">
                                <label for="usuario-correo" class="control-label">Correo:</label>
                                <input type="email" class="form-control" id="usuario-correo" name="usuario-correo">
                            </div>
                            <input type="hidden" class="form-control" id="usuario-perfil" value="" name="usuario-perfil">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-usuario">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL - Carrera -->
        <div class="modal fade" id="modalCarrera" tabindex="-1" role="dialog" aria-labelledby="modalCarreraLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalCarreraLabel">Crear Carrera</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="carrera-id" class="control-label">Cod. Carrera:</label>
                                <input type="text" class="form-control" id="carrera-id" name="carrera-id">
                            </div>
                            <div class="form-group">
                                <label for="carrera-comentario" class="control-label">Descricion:</label>
                                <input type="text" class="form-control" id="carrera-comentario" name="carrera-comentario">
                            </div>
                            <div class="form-group">
                                <label for="carrera-fecha" class="control-label">Fecha Fundacion:</label>
                                <input type="date" class="form-control" id="carrera-fecha" name="carrera-fecha">
                            </div>
                            <div class="form-group">
                                <label for="carrera-duracion" class="control-label">Duracion (Años):</label>
                                <input type="number" class="form-control" id="carrera-duracion" name="carrera-duracion">
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-carrera">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL - Clase -->
        <div class="modal fade" id="modalClase" tabindex="-1" role="dialog" aria-labelledby="modalClaseLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalClaseLabel">Crear Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="usuario-id" class="control-label">Cuenta:</label>
                                <input type="text" class="form-control" id="usuario-id" name="usuario-id">
                            </div>
                            <div class="form-group">
                                <label for="usuario-name" class="control-label">Nombre:</label>
                                <input type="text" class="form-control" id="usuario-name" name="usuario-name">
                            </div>
                            <div class="form-group">
                                <label for="usuario-fnac" class="control-label">Fecha Nac:</label>
                                <input type="date" class="form-control" id="usuario-fnac" name="usuario-fnac">
                            </div>
                            <div class="form-group">
                                <label for="usuario-telefono" class="control-label">Telefono:</label>
                                <input type="text" class="form-control" id="usuario-telefono" name="usuario-telefono">
                            </div>
                            <div class="form-group">
                                <label for="usuario-correo" class="control-label">Correo:</label>
                                <input type="email" class="form-control" id="usuario-correo" name="usuario-correo">
                            </div>
                            <input type="hidden" class="form-control" id="usuario-perfil" value="" name="usuario-perfil">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-clase">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL - Precio -->
        <div class="modal fade" id="modalPrecio" tabindex="-1" role="dialog" aria-labelledby="modalPrecioLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalPrecioLabel">Crear Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="usuario-id" class="control-label">Cuenta:</label>
                                <input type="text" class="form-control" id="usuario-id" name="usuario-id">
                            </div>
                            <div class="form-group">
                                <label for="usuario-name" class="control-label">Nombre:</label>
                                <input type="text" class="form-control" id="usuario-name" name="usuario-name">
                            </div>
                            <div class="form-group">
                                <label for="usuario-fnac" class="control-label">Fecha Nac:</label>
                                <input type="date" class="form-control" id="usuario-fnac" name="usuario-fnac">
                            </div>
                            <div class="form-group">
                                <label for="usuario-telefono" class="control-label">Telefono:</label>
                                <input type="text" class="form-control" id="usuario-telefono" name="usuario-telefono">
                            </div>
                            <div class="form-group">
                                <label for="usuario-correo" class="control-label">Correo:</label>
                                <input type="email" class="form-control" id="usuario-correo" name="usuario-correo">
                            </div>
                            <input type="hidden" class="form-control" id="usuario-perfil" value="" name="usuario-perfil">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-precio">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL - Ruta -->
        <div class="modal fade" id="modalRuta" tabindex="-1" role="dialog" aria-labelledby="modalRutaLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalRutaLabel">Crear Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="usuario-id" class="control-label">Cuenta:</label>
                                <input type="text" class="form-control" id="usuario-id" name="usuario-id">
                            </div>
                            <div class="form-group">
                                <label for="usuario-name" class="control-label">Nombre:</label>
                                <input type="text" class="form-control" id="usuario-name" name="usuario-name">
                            </div>
                            <div class="form-group">
                                <label for="usuario-fnac" class="control-label">Fecha Nac:</label>
                                <input type="date" class="form-control" id="usuario-fnac" name="usuario-fnac">
                            </div>
                            <div class="form-group">
                                <label for="usuario-telefono" class="control-label">Telefono:</label>
                                <input type="text" class="form-control" id="usuario-telefono" name="usuario-telefono">
                            </div>
                            <div class="form-group">
                                <label for="usuario-correo" class="control-label">Correo:</label>
                                <input type="email" class="form-control" id="usuario-correo" name="usuario-correo">
                            </div>
                            <input type="hidden" class="form-control" id="usuario-perfil" value="" name="usuario-perfil">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-ruta">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!--MESSAGES-->
        <div id="error-message" class="col-md-4 col-md-offset-4 collapse">
            <div class="alert alert-danger alert-dismissable fade in">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <!--<strong>Error!</strong> This alert box could indicate a dangerous or potentially negative action.-->
              <a id="error-message-text"></a>
            </div>
        </div>
        <br>
        <!--MAIN MENU-->
        <div class="col-md-12">
            <div class="col-md-3 col-md-offset-1">
                <ul class="nav nav-pills nav-stacked">
                    <li role="presentation" class="active"><a id="reg-inicio" href="#">Inicio</a></li>
                    <li role="presentation"><a id="reg-info-gen" href="#">Informacion General</a></li>
                    <li role="presentation"><a id="reg-btn-periodos" href="#">Periodos de Clases</a></li>
                    <li role="presentation"><a id="reg-btn-alumnos" href="#">Alumnos</a></li>
                    <li role="presentation"><a id="reg-btn-maestros" href="#">Maestros</a></li>
                    <li role="presentation"><a id="reg-btn-admin" href="#">Administradores</a></li>
                    <li role="presentation"><a id="reg-btn-carreras" href="#">Carreras</a></li>
                    <li role="presentation"><a id="reg-btn-clases" href="#">Clases</a></li>
                    <li role="presentation"><a id="reg-btn-precios" href="#">Precios</a></li>
                    <li role="presentation"><a id="reg-btn-rutas" href="#">Rutas</a></li>
                    <li role="presentation"><a id="reg-btn-reportes" href="#">Reportes</a></li>
                    <li role="presentation"><a id="reg-btn-salir" href="#">Salir</a></li>
                </ul>
            </div>
            <div class="col-md-6 col-md-offset-1 ">
                <div id="reg-title" class="collapse in">
                    <div class="jumbotron">
                        <div class="container">
                            <h1>Area Administrativa</h1>
                            <p>Bienvenido al area administrativa del sistema</p>
                        </div>
                    </div>
                </div>

                <!--CONFIGURACION GENERAL-->
                <div id="reg-confi-sis" class="collapse">
                    <div  class="page-header">
                        <h1>Informacion general del sistema</h1>
                    </div>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Nombre</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="uni-nombre" placeholder="Escriba el nombre de la insitucion">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Telefono</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="uni-nombre" placeholder="Escriba el telefono de la insitucion">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Correo</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="uni-nombre" placeholder="Escriba el correo de la insitucion">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Ubicacion Geografica</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="uni-nombre" placeholder="Latitud/Longitud">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="comment">Direccion Fisica</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="uni-mision" placeholder="Escriba Direccion Fisica"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="comment">Mision</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="uni-mision" placeholder="Escriba mision de la institucion"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="comment">Vision</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="uni-mision" placeholder="Escriba vision de la institucion"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="comment">Objetivos</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="uni-mision" placeholder="Escriba objetivos de la institucion"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="comment">Politicas</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="uni-mision" placeholder="Escriba politicas de la institucion"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Guardar</button>
                            </div>
                        </div>
                    </form>
                </div>

                <!--PERIODOS-->
                <div id="reg-periodos" class="collapse">
                    <div  class="page-header">
                        <h1>Periodos de clases</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPeriodoClases">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cod</th>
                                <th>Comentario</th>
                                <th>Anio</th>
                                <th>Fecha Inicio</th>
                                <th>Fecha Fin</th>
                            </tr>
                        </thead>
                        <tbody>

                          <%
                            try {
                                  OracleConn db = new OracleConn();
                                  db.conectar();
                                  db.query.execute("SELECT * FROM periodosclases");
                                  ResultSet rs = db.query.getResultSet();

                                  while (rs.next()) {%>
                                    <tr>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                    </tr>
                          <% }
                                  db.desconectar();
                              }catch (Exception e) {
                                  e.printStackTrace();
                              }
                          %>
                        </tbody>
                    </table>
                </div>

                <!--ALUMNOS-->
                <div id="reg-alumnos" class="collapse">
                    <div  class="page-header">
                        <h1>Alumnos</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-perfil="ALM" data-target="#modalUsuarios">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cuenta</th>
                                <th>Nombre</th>
                                <th>Fecha Nac.</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%

                               try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'ALM'");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                                      <tr>
                                          <td><%=rs.getString(1)%></td>
                                          <td><%=rs.getString(2)%></td>
                                          <td><%=rs.getString(3)%></td>
                                          <td><%=rs.getString(4)%></td>
                                          <td><%=rs.getString(5)%></td>
                                      </tr>
                            <% }
                                    db.desconectar();
                                }catch (Exception e) {
                                    e.printStackTrace();
                                }%>
                        </tbody>
                    </table>
                </div>

                <!--MAESTROS-->
                <div id="reg-maestros" class="collapse">
                    <div  class="page-header">
                        <h1>Maestros</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-perfil="MAE" data-target="#modalUsuarios">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cuenta</th>
                                <th>Nombre</th>
                                <th>Fecha Nac.</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'MAE'");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                                      <tr>
                                          <td><%=rs.getString(1)%></td>
                                          <td><%=rs.getString(2)%></td>
                                          <td><%=rs.getString(3)%></td>
                                          <td><%=rs.getString(4)%></td>
                                          <td><%=rs.getString(5)%></td>
                                      </tr>
                            <% }
                                    db.desconectar();
                                }catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <!--ADMINISTRADORES-->
                <div id="reg-admin" class="collapse">
                    <div  class="page-header">
                        <h1>Administradores</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-perfil="REG" data-target="#modalUsuarios">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cuenta</th>
                                <th>Nombre</th>
                                <th>Fecha Nac.</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'REG'");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                                      <tr>
                                          <td><%=rs.getString(1)%></td>
                                          <td><%=rs.getString(2)%></td>
                                          <td><%=rs.getString(3)%></td>
                                          <td><%=rs.getString(4)%></td>
                                          <td><%=rs.getString(5)%></td>
                                      </tr>
                            <% }
                                    db.desconectar();
                                }catch (Exception e) {
                                    e.printStackTrace();
                                }%>
                        </tbody>
                    </table>
                </div>

                <!--CARRERAS-->
                <div id="reg-carreras" class="collapse">
                    <div  class="page-header">
                        <h1>Carreras</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCarrera">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Fecha Fund.</th>
                                <th>Duracion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("SELECT * FROM carreras");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                                    <tr>
                                        <td><%=rs.getString(1)%></td>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(3)%></td>
                                        <td><%=rs.getString(4)%></td>
                                    </tr>
                            <%  }
                                    db.desconectar();
                                }catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <!--CLASES-->
                <div id="reg-clases" class="collapse">
                    <div  class="page-header">
                        <h1>Clases</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalClase">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("SELECT * FROM clases");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                                      <tr>
                                          <td><%=rs.getString(1)%></td>
                                          <td><%=rs.getString(3)%></td>
                                      </tr>
                            <% }
                                    db.desconectar();
                                }
                                catch (Exception e) {
                                    e.printStackTrace();
                                }%>
                        </tbody>
                    </table>
                </div>

                <!--PRECIOS-->
                <div id="reg-precios" class="collapse">
                    <div  class="page-header">
                        <h1>Precios</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPrecio">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("SELECT * FROM servicios");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                                        <tr>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%></td>
                                        </tr>
                            <%}
                                    db.desconectar();
                                }
                                catch (Exception e) {
                                    e.printStackTrace();
                                }%>
                        </tbody>
                    </table>
                </div>

                <!--RUTAS-->
                <div id="reg-rutas" class="collapse">
                    <div  class="page-header">
                        <h1>Rutas</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalRuta">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Descripcion</th>
                                <th>Origen</th>
                                <th>Destino</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                              try {
                                    OracleConn db = new OracleConn();
                                    db.conectar();
                                    db.query.execute("SELECT * FROM rutas");
                                    ResultSet rs = db.query.getResultSet();

                                    while (rs.next()) {
                            %>
                                      <tr>
                                          <td><%=rs.getString(1)%></td>
                                          <td><%=rs.getString(2)%></td>
                                          <td><%=rs.getString(3)%></td>
                                          <td><%=rs.getString(4)%></td>
                                      </tr>
                            <% }
                                    db.desconectar();
                                }
                                catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>

    <script>
        // VARS
        var url = "http://localhost:9999/SistemaUniversitario";

        //OPEN REGS
        $("#reg-info-gen").click(function () {
            ShowView("confi_sis");
        });
        $("#reg-inicio").click(function () {
            ShowView("title");
        });
        $("#reg-btn-periodos").click(function () {
            ShowView("periodos");
        });
        $("#reg-btn-alumnos").click(function () {
            ShowView("alumnos");
        });
        $("#reg-btn-maestros").click(function () {
            ShowView("maestros");
        });
        $("#reg-btn-admin").click(function () {
            ShowView("admin");
        });
        $("#reg-btn-carreras").click(function () {
            ShowView("carreras");
        });
        $("#reg-btn-clases").click(function () {
            ShowView("clases");
        });
        $("#reg-btn-precios").click(function () {
            ShowView("precios");
        });
        $("#reg-btn-rutas").click(function () {
            ShowView("rutas");
        });

        //MODALS
        $('#modalPeriodoClases').on('show.bs.modal', function (event) {
            var modal = $(this);
            // modal.find('.modal-title').text('New message to ' + recipient)
            // modal.find('.modal-body input').val(recipient)
            // $("#pclase-code").val("MAT02");
            // $("#pclase-name").val("ALGEGRA");
        });

        $('#modalUsuarios').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var perfil = "";

            switch (button.data('perfil')){
              case "ALM":
                perfil = "Alumno";
                break;
              case "MAE":
                perfil = "Profesor";
                break;
              case "REG":
                perfil = "Administrador";
            }

            modal.find('.modal-title').text(perfil);
            modal.find('#usuario-perfil').val(button.data('perfil')); //ASIGNA VALOR AL CAMPO PERFIL
        });

        $(".btn-save-pclase").click(function () {
            $("#modalPeriodoClases").modal('hide');
            // var array = $(this).attr('id');
            // array = array.split(",");
            // Stop form from submitting normally
            event.preventDefault();
            $.post(url + "/controlers/crear.jsp", {
                id      : "crear-pclass",
                per_id  : $("#pclase-code").val(),
                desc    : $("#pclase-name").val(),
                anio    : $("#pclase-anio").val(),
                frdate  : $("#pclase-frdate").val(),
                todate  : $("#pclase-todate").val()
            }).done(function (data, status) {
                messageActive(data);
            });
            // location.reload();
        });

        $(".btn-save-usuario").click(function () {
            $("#modalUsuario").modal('hide');
            event.preventDefault();
            $.post(url + "/controlers/crear.jsp", {
                id          : "crear-usuario",
                usuario_id  : $("#usuario-id").val(),
                nombre      : $("#usuario-name").val(),
                fecha_nac   : $("#usuario-fnac").val(),
                telefono    : $("#usuario-telefono").val(),
                correo      : $("#usuario-correo").val(),
                perfil_id_fk: $("#usuario-perfil").val()
            }).done(function (data, status) {
                messageActive(data);
            });
        });

        $(".btn-save-carrera").click(function () {
            $("#modalCarrera").modal('hide');
            event.preventDefault();
            $.post(url + "/controlers/crear.jsp", {
                id              : "crear-carrera",
                carrera_id      : $("#carrera-id").val(),
                comentario      : $("#carrera-comentario").val(),
                fecha_fundacion : $("#carrera-fecha").val(),
                duracion        : $("#carrera-duracion").val(),
            }).done(function (data, status) {
                messageActive(data);
            });
        });

        $(".btn-save-clase").click(function () {
            $("#modalClase").modal('hide');
            event.preventDefault();
            $.post(url + "/controlers/crear.jsp", {
                id            : "crear-clase",
                clase_id      : $("#clase-id").val(),
                carrera_id_fk : $("#clase-carrera").val(),
                comentario    : $("#clase-comentario").val()
            }).done(function (data, status) {
                messageActive(data);
            });
        });

        $(".btn-save-precio").click(function () {
            $("#modalPrecio").modal('hide');
            event.preventDefault();
            $.post(url + "/controlers/crear.jsp", {
                id          : "crear-precio",
                servicio_id : $("#precio-id").val(),
                comentario  : $("#precio-comentario").val(),
                precio      : $("#precio-precio").val(),
                cantidad    : $("#precio-cantidad").val()
            }).done(function (data, status) {
                messageActive(data);
            });
        });

        $(".btn-save-ruta").click(function () {
            $("#modalRuta").modal('hide');
            event.preventDefault();
            $.post(url + "/controlers/crear.jsp", {
                id        : "crear-ruta",
                ruta_id   : $("#ruta-id").val(),
                comentario: $("#ruta-comentario").val(),
                origen    : $("#ruta-origen").val(),
                destino   : $("#ruta-destino").val()
            }).done(function (data, status) {
                messageActive(data);
            });
        });

        //FUNCTIONS
        function messageActive(data){
          if (data.indexOf("ok") >= 0) {
              $("#error-message").collapse("show");
              $(".alert").removeClass("alert-danger").addClass("alert-success");
              $("#error-message-text").html("<center>El registro ha sido guardado.</center>");
          } else {
              $("#error-message").collapse("show");
              $(".alert").removeClass("alert-success").addClass("alert-danger");
              $("#error-message-text").html(data.toString());
          }
          console.log(data);
        }

        function ShowView(view_id) {
            title = "hide";
            confi_sis = "hide";
            periodos = "hide";
            alumnos = "hide";
            maestros = "hide";
            carreras = "hide";
            clases = "hide";
            precios = "hide";
            rutas = "hide";
            admin = "hide";
            reportes = "hide";
            switch (view_id) {
                case "title":
                    title = "show";
                    break;
                case "confi_sis":
                    confi_sis = "show";
                    break;
                case "periodos":
                    periodos = "show";
                    break;
                case "alumnos":
                    alumnos = "show";
                    break;
                case "maestros":
                    maestros = "show";
                    break;
                case "admin":
                    admin = "show";
                    break;
                case "carreras":
                    carreras = "show";
                    break;
                case "clases":
                    clases = "show";
                    break;
                case "precios":
                    precios = "show";
                    break;
                case "rutas":
                    rutas = "show";
                    break;
                case "reportes":
                    reportes = "show";
                    break;

            }
            $("#reg-title").collapse(title);
            $("#reg-confi-sis").collapse(confi_sis);
            $("#reg-periodos").collapse(periodos);
            $("#reg-alumnos").collapse(alumnos);
            $("#reg-maestros").collapse(maestros);
            $("#reg-admin").collapse(admin);
            $("#reg-carreras").collapse(carreras);
            $("#reg-clases").collapse(clases);
            $("#reg-precios").collapse(precios);
            $("#reg-rutas").collapse(rutas);
            $("#reg-reportes").collapse(reportes);
            $("#error-message").collapse("hide");
        }
    </script>
</html>
