<%--
    Document   : menu_principal
    Created on : 09-10-2017, 09:42:41 PM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>

<%//seguridad del sistema%>
<%
  
    if (session.getAttribute("s_user") == null) {
            String site = new String("http://localhost:9999/SistemaUniversitario/index.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
    }
%>

<%
    OracleConn db = new OracleConn();
    ResultSet rs;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.2/jspdf.plugin.autotable.min.js"></script> -->

        <script type="text/javascript" src="jspdf.debug.js"></script>
        <!-- <script src="../statics/js/script.js" type="text/javascript"></script> -->
        <!-- <link href="statics/css/style.css" rel="stylesheet" type="text/css" /> -->
        <title>Sistema Universitario | Administracion</title>
    </head>
    <body>
        <!--NAVBAR-->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Sistema Universitario | Registro</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Logueado como <span class="login-name"><%=session.getAttribute("s_nombre")%></span> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Modificar Perfil</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a class="btn-exit" href="#">Salir</a></li>
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
                                <input type="text" class="form-control" id="pclase-code" name="pclase-code" value="">
                            </div>
                            <div class="form-group">
                                <label for="pclase-name" class="control-label">Descripcion:</label>
                                <input type="text" class="form-control" id="pclase-name" name="pclase-name" value="">
                            </div>
                            <div class="form-group">
                                <label for="pclase-anio" class="control-label">Año:</label>
                                <input type="number" class="form-control" id="pclase-anio" name="pclase-anio" value="">
                            </div>
                            <div class="form-group">
                                <label for="pclase-frdate" class="control-label">Fecha Inicio:</label>
                                <input type="date" class="form-control" id="pclase-frdate" name="pclase-frdate" value="">
                            </div>
                            <div class="form-group">
                                <label for="pclase-todate" class="control-label">Fecha Fin:</label>
                                <input type="date" class="form-control" id="pclase-todate" name="pclase-todate" value="">
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
                            <!-- <input type="text" class="form-control" id="usuario-perfil" value="" name="usuario-perfil"> -->
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
                        <h4 class="modal-title" id="modalClaseLabel">Crear Clase</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="clase-id" class="control-label">Codigo:</label>
                                <input type="text" class="form-control" id="clase-id" name="clase-id">
                            </div>
                            <div class="form-group">
                                <label for="clase-comentario" class="control-label">Nombre:</label>
                                <input type="text" class="form-control" id="clase-comentario" name="clase-comentario">
                            </div>
                            <div class="form-group">
                                <label for="clase-carrera">Carrera:</label>
                                <select class="form-control" id="clase-carrera">
                                    <%
                                        try {
                                            db.conectar();
                                            db.query.execute("SELECT * FROM carreras");
                                            rs = db.query.getResultSet();
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                    <%
                                            }
                                            db.desconectar();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </select>
                            </div>
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
                                <label for="precio-id" class="control-label">Codigo:</label>
                                <input type="text" class="form-control" id="precio-id" name="precio-id">
                            </div>
                            <div class="form-group">
                                <label for="precio-comentario" class="control-label">Descripcion:</label>
                                <input type="text" class="form-control" id="precio-comentario" name="precio-comentario">
                            </div>
                            <div class="form-group">
                                <label for="precio-precio" class="control-label">Precio:</label>
                                <input type="number" class="form-control" id="precio-precio" name="precio-precio">
                            </div>
                            <div class="form-group">
                                <label for="precio-cantidad" class="control-label">Cantidad:</label>
                                <input type="number" class="form-control" id="precio-cantidad" name="precio-cantidad">
                            </div>
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
                                <label for="ruta-id" class="control-label">Codigo:</label>
                                <input type="text" class="form-control" id="ruta-id" name="ruta-id">
                            </div>
                            <div class="form-group">
                                <label for="ruta-comentario" class="control-label">Descripcion:</label>
                                <input type="text" class="form-control" id="ruta-comentario" name="ruta-comentario">
                            </div>
                            <div class="form-group">
                                <label for="ruta-origen" class="control-label">Origen:</label>
                                <input type="text" class="form-control" id="ruta-origen" name="ruta-origen">
                            </div>
                            <div class="form-group">
                                <label for="ruta-destino" class="control-label">Destino:</label>
                                <input type="text" class="form-control" id="ruta-destino" name="ruta-destino">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-ruta">Guardar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL - Seccion -->
        <div class="modal fade" id="modalSeccion" tabindex="-1" role="dialog" aria-labelledby="modalSeccionLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalSeccionLabel">Crear Seccion</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="seccion-id" class="control-label">Codigo:</label>
                                <input type="text" class="form-control" id="seccion-id" name="seccion-id">
                            </div>
                            <div class="form-group">
                                <label for="seccion-claseId">Clase:</label>
                                <select class="form-control" id="seccion-claseId">
                                    <%
                                        try {
                                            db.conectar();
                                            db.query.execute("SELECT * FROM clases");
                                            rs = db.query.getResultSet();
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                    <%
                                            }
                                            db.desconectar();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="seccion-maestroId">Maestro:</label>
                                <select class="form-control" id="seccion-maestroId">
                                    <%
                                        try {
                                            db.conectar();
                                            db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'MAE'");
                                            rs = db.query.getResultSet();
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                    <%
                                            }
                                            db.desconectar();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="seccion-dias" class="control-label">Dias:</label>
                                <input type="text" class="form-control" id="seccion-dias" name="seccion-dias">
                            </div>
                            <div class="form-group">
                                <label for="seccion-hora" class="control-label">Hora:</label>
                                <input type="time" class="form-control" id="seccion-hora" name="seccion-hora">
                            </div>
                            <div class="form-group">
                                <label for="seccion-comentario" class="control-label">Descripcion:</label>
                                <input type="text" class="form-control" id="seccion-comentario" name="seccion-comentario">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-seccion">Guardar</button>
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
                    <li role="presentation" class="active"><a class="reg-inicio" href="#">Inicio</a></li>
                    <li role="presentation"><a id="reg-info-gen" href="#">Informacion General</a></li>
                    <li role="presentation"><a id="reg-btn-periodos" href="#">Periodos de Clases</a></li>
                    <li role="presentation"><a id="reg-btn-alumnos" href="#">Alumnos</a></li>
                    <li role="presentation"><a id="reg-btn-maestros" href="#">Maestros</a></li>
                    <li role="presentation"><a id="reg-btn-admin" href="#">Administradores</a></li>
                    <li role="presentation"><a id="reg-btn-carreras" href="#">Carreras</a></li>
                    <li role="presentation"><a id="reg-btn-clases" href="#">Clases</a></li>
                    <li role="presentation"><a id="reg-btn-precios" href="#">Precios</a></li>
                    <li role="presentation"><a id="reg-btn-rutas" href="#">Rutas</a></li>
                    <li role="presentation"><a id="reg-btn-secciones" href="#">Secciones (Asignar Maestro a Clases)</a></li>
                    <li role="presentation"><a id="reg-btn-matricula" href="#">Matricula</a></li>
                    <li role="presentation"><a id="reg-btn-reportes" href="#">Reportes</a></li>
                    <li role="presentation"><a id="reg-btn-salir" class="btn-exit" href="#">Salir</a></li>
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

                    <%
                        try {
                            db.conectar();
                            db.query.execute("SELECT * FROM institucion_info WHERE institucion_id = '1'");
                            rs = db.query.getResultSet();
                            rs.next();

                    %>

                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-nombre">Nombre</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="instInfo-nombre" value="<%=rs.getString("nombre")%>" placeholder="Escriba el nombre de la insitucion">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-telefono">Telefono</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="instInfo-telefono" value="<%=rs.getString("telefono")%>" placeholder="Escriba el telefono de la insitucion">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-correo">Correo</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="instInfo-correo" value="<%=rs.getString("correo")%>" placeholder="Escriba el correo de la insitucion">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-ubicacion_geo">Ubicacion Geografica</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="instInfo-ubicacion_geo" value="<%=rs.getString("ubicacion_geo")%>" placeholder="Latitud/Longitud">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-direccion_fisica">Direccion Fisica</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="instInfo-direccion_fisica" placeholder="Escriba Direccion Fisica"><%=rs.getString("direccion_fisica")%></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-vision">Mision</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="instInfo-vision" placeholder="Escriba mision de la institucion"><%=rs.getString("vision")%></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-mision">Vision</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="instInfo-mision" placeholder="Escriba vision de la institucion"><%=rs.getString("mision")%></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-objetivos">Objetivos</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="instInfo-objetivos" placeholder="Escriba objetivos de la institucion"><%=rs.getString("objetivos")%></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="instInfo-politicas">Politicas</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="5" id="instInfo-politicas" placeholder="Escriba politicas de la institucion"><%=rs.getString("politicas")%></textarea>
                            </div>
                        </div>
                        <%
                                db.desconectar();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default btn-save-instInfo">Guardar</button>
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear" data-target="#modalPeriodoClases">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cod</th>
                                <th>Comentario</th>
                                <th>Anio</th>
                                <th>Fecha Inicio</th>
                                <th>Fecha Fin</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM periodosclases");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4) + ',' + rs.getString(5)%>" data-target="#modalPeriodoClases" id="<%= rs.getString(1)%>"
                                       class="btn-editar-pclase" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-pclase" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>


                            <% }
                                    db.desconectar();
                                } catch (Exception e) {
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear,ALM" data-target="#modalUsuarios">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cuenta</th>
                                <th>Nombre</th>
                                <th>Fecha Nac.</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'ALM'");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%=  rs.getString("perfil_id_fk") + ',' + rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4) + ',' + rs.getString(5)%>" data-target="#modalUsuarios" id="<%= rs.getString(1)%>"
                                       class="btn-editar-usuario" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-usuario" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <% }
                                    db.desconectar();
                                } catch (Exception e) {
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear,MAE" data-target="#modalUsuarios">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cuenta</th>
                                <th>Nombre</th>
                                <th>Fecha Nac.</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'MAE'");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(6) + ',' + rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4) + ',' + rs.getString(5)%>" data-target="#modalUsuarios" id="<%= rs.getString(1)%>"
                                       class="btn-editar-usuario" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-usuario" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <% }
                                    db.desconectar();
                                } catch (Exception e) {
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear,REG" data-target="#modalUsuarios">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Cuenta</th>
                                <th>Nombre</th>
                                <th>Fecha Nac.</th>
                                <th>Telefono</th>
                                <th>Correo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'REG'");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(6) + ',' + rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4) + ',' + rs.getString(5)%>" data-target="#modalUsuarios" id="<%= rs.getString(1)%>"
                                       class="btn-editar-usuario" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-usuario" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <% }
                                    db.desconectar();
                                } catch (Exception e) {
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear" data-target="#modalCarrera">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Fecha Fund.</th>
                                <th>Duracion</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM carreras");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4)%>" data-target="#modalCarrera" id="<%= rs.getString(1)%>"
                                       class="btn-editar-carrera" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-carrera" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <%  }
                                    db.desconectar();
                                } catch (Exception e) {
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear" data-target="#modalClase">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Carrera</th>
                                <th>Nombre</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM clases");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3)%>" data-target="#modalClase" id="<%= rs.getString(1)%>"
                                       class="btn-editar-clase" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-clase" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <% }
                                    db.desconectar();
                                } catch (Exception e) {
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-accion="crear" data-toggle="modal" data-target="#modalPrecio">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Descripcion</th>
                                <th>Precio</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM servicios");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3)%>" data-target="#modalPrecio" id="<%= rs.getString(1)%>"
                                       class="btn-editar-precio" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-precio" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <%}
                                    db.desconectar();
                                } catch (Exception e) {
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
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear" data-target="#modalRuta">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Descripcion</th>
                                <th>Origen</th>
                                <th>Destino</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM rutas");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4)%>" data-target="#modalRuta" id="<%= rs.getString(1)%>"
                                       class="btn-editar-ruta" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-ruta" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <% }
                                    db.desconectar();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>

                        </tbody>
                    </table>
                </div>

                <!--SECCIONES-->
                <div id="reg-secciones" class="collapse">
                    <div  class="page-header">
                        <h1>Secciones</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel reg-inicio">Cancelar</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear" data-target="#modalSeccion">Crear</button>
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Clase</th>
                                <th>Maestro</th>
                                <th>Descripcion</th>
                                <th>Dias</th>
                                <th>Hora</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT * FROM secciones");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4) + ',' + rs.getString(5) + ',' + rs.getString(6)%>" data-target="#modalSeccion" id="<%= rs.getString(1)%>"
                                       class="btn-editar-seccion" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a class="btn-delete-seccion" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                            <% }
                                    db.desconectar();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>

                        </tbody>
                    </table>
                </div>

                <!--MATRICULA-->
                <div id="reg-matricula" class="collapse">
                    <div  class="page-header">
                        <h1>Matricula</h1>
                    </div>
                    <form class="">
                        <div class="col-sm-12">
                            <!-- <div class="form-group row">
                                <label class="control-label col-sm-2" for="email">Alumno</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="matricula-alumnoId" placeholder="">
                                </div>
                            </div> -->
                            <div class="form-group row">
                                <label for="matricula-alumnoId">Alumno:</label>
                                <select class="form-control" id="matricula-alumnoId">
                                    <option selected="selected" value="">---</option>
                                    <%
                                        try {
                                            db.conectar();
                                            db.query.execute("SELECT * FROM usuarios WHERE perfil_id_fk = 'ALM'");
                                            rs = db.query.getResultSet();
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                    <%
                                            }
                                            db.desconectar();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group row">
                                <label for="matricula-carreraId">Carrera:</label>
                                <select class="form-control" id="matricula-carreraId">
                                    <option selected="selected" value="">---</option>
                                    <%
                                        try {
                                            db.conectar();
                                            db.query.execute("SELECT * FROM carreras");
                                            rs = db.query.getResultSet();
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                    <%
                                            }
                                            db.desconectar();
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="col-sm-12">
                                <div class="form-group row">
                                    <div class="col-sm-3">
                                        Clase
                                    </div>
                                    <div class="col-sm-3">
                                        Seccion
                                    </div>
                                    <div class="col-sm-3">
                                        Dias
                                    </div>
                                    <div class="col-sm-3">
                                        Hora
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-claseId1" name="matricula-claseId1">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM clases");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-seccionId1" name="matricula-seccionId1">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM secciones");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" disabled class="form-control" id="matricula-dias1" placeholder="">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="time" disabled class="form-control" id="matricula-hora1" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-claseId2">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM clases");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-seccionId2" name="matricula-seccionId2">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM secciones");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" disabled class="form-control" id="matricula-dias2" placeholder="">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="time" disabled class="form-control" id="matricula-hora2" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-claseId3">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM clases");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-seccionId3" name="matricula-seccionId3">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM secciones");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" disabled class="form-control" id="matricula-dias3" placeholder="">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="time" disabled class="form-control" id="matricula-hora3" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-claseId4">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM clases");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="form-group row col-sm-3">
                                        <select class="form-control" id="matricula-seccionId4" name="matricula-seccionId4">
                                            <option selected="selected" value="">---</option>
                                            <%
                                                try {
                                                    db.conectar();
                                                    db.query.execute("SELECT * FROM secciones");
                                                    rs = db.query.getResultSet();
                                                    while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getString(1)%>"><%=rs.getString(1) + " - " + rs.getString(2)%></option>
                                            <%
                                                    }
                                                    db.desconectar();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" disabled class="form-control" id="matricula-dias4" placeholder="">
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="time" disabled class="form-control" id="matricula-hora4" placeholder="">
                                    </div>
                                </div>
                                <br>
                                <br>
                                <br>
                                <div class="form-group row">
                                    <div class="col-sm-offset-8 col-sm-2">
                                        <button type="submit" class="btn btn-primary btn-cancel">Cancelar</button>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="submit" class="btn btn-primary btn-save-matricula">Matricular</button>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </form>
                </div>
                <div id="reg-reportes" class="collapse">
                    <div  class="page-header">
                        <h1>Reportes</h1>
                    </div>
                    <!-- CONSULTAS A BD PARA GENERAR REPORTES -->

                    <ul>
                        <li><button type="button" class="btn btn-link" onclick="javascript:reporteMatricula()">Reporte de Matricula</button></li>
                        <li><button type="button" class="btn btn-link">Calificaciones</button></li>
                        <li><button type="button" class="btn btn-link">Reclamos por fallas de equipos</button></li>
                    </ul>
                    <div style="visibility: hidden">
                      <div id="reporteMatricula">
                        <table>
                            <thead>
                                <tr>
                                    <th>Clase</th>
                                    <th>Seccion</th>
                                    <th>Alumno</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    try {
                                        db.conectar();
                                        db.query.execute("SELECT * FROM matricula");
                                        rs = db.query.getResultSet();

                                        while (rs.next()) {%>
                                <tr>
                                    <td><%=rs.getString("clase_id_fk")%></td>
                                    <td><%=rs.getString("seccion_id_fk")%></td>
                                    <td><%=rs.getString("alumno_id_fk")%></td>
                                </tr>
                                <% }
                                        db.desconectar();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                            </tbody>
                        </table>
                      </div>
                    </div>
                </div>

            </div>
        </div>

    </body>

    <script>
        // VARS
        var url = "http://localhost:9999/SistemaUniversitario";
        var reg_id = "";

        //OPEN LIST REGS
        $("#reg-info-gen").click(function () {
            ShowView("confi_sis");
        });
        $(".reg-inicio").click(function () {
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
        $("#reg-btn-secciones").click(function () {
            ShowView("secciones");
        });
        $("#reg-btn-matricula").click(function () {
            ShowView("matricula");
        });
        $("#reg-btn-reportes").click(function () {
            ShowView("reportes");
        });

        //MODALS

        // OPEN WINDOW FOR EDIT REG
        // CONTEXTS VIEWS (CONTEXTUALIZAR LOS MODALES, PARA SABER SI ES UN MODAL PARA CREAR, ACTUALIZAR, PERFIL USUARIO)

        $('#modalPeriodoClases').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var accionName = "";
            var title = "Periodo Clase";

            array = button.data('accion');
            array = array.split(",");
            switch (array[0]) {
                case "crear":
                    accionName = "Crear - ";
                    break;
                case "editar":
                    accionName = "Editar - ";
            }
            modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            modal.find("#pclase-code").val(array[1]);
            modal.find("#pclase-name").val(array[2]);
            modal.find("#pclase-anio").val(array[3]);
            modal.find("#pclase-frdate").val(array[4]);
            modal.find("#pclase-todate").val(array[5]);
        });

        $('#modalUsuarios').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var perfil = "";
            var accionName = "";
            var perfilid = "";

            array = button.data('accion');
            array = array.split(",");
            perfilid = array[1];

            switch (perfilid) {
                case "ALM":
                    perfil = "Alumno";
                    break;
                case "MAE":
                    perfil = "Profesor";
                    break;
                case "REG":
                    perfil = "Administrador";
            }

            if (array[0] == "editar") {
                accionName = "Editar - ";
                $("#usuario-id").prop('disabled', true);
            } else {
                accionName = "Crear - ";
                $("#usuario-id").removeAttr("disabled");
            }

            modal.find('.modal-title').text(accionName + perfil);
            modal.find('#usuario-perfil').val(perfilid); //ASIGNA VALOR AL CAMPO PERFIL

            // modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            
            modal.find("#usuario-id").val(array[2]);
            modal.find("#usuario-name").val(array[3]);
            modal.find("#usuario-fnac").val(array[4]);
            modal.find("#usuario-telefono").val(array[5]);
            modal.find("#usuario-correo").val(array[6]);
        });

        $('#modalCarrera').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var accionName = "";
            var title = "Carrera";

            array = button.data('accion');
            array = array.split(",");
            switch (array[0]) {
                case "crear":
                    accionName = "Crear - ";
                    break;
                case "editar":
                    accionName = "Editar - ";
            }
            modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            modal.find("#carrera-id").val(array[1]);
            modal.find("#carrera-comentario").val(array[2]);
            modal.find("#carrera-fecha").val(array[3]);
            modal.find("#carrera-duracion").val(array[4]);
        });

        $('#modalClase').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var accionName = "";
            var title = "Clase";

            array = button.data('accion');
            array = array.split(",");
            switch (array[0]) {
                case "crear":
                    accionName = "Crear - ";
                    break;
                case "editar":
                    accionName = "Editar - ";
            }
            modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            modal.find("#clase-id").val(array[1]);
            modal.find("#clase-comentario").val(array[3]);
            modal.find("#clase-carrera").val(array[2]);
        });

        $('#modalPrecio').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var accionName = "";
            var title = "Precio";

            array = button.data('accion');
            array = array.split(",");
            switch (array[0]) {
                case "crear":
                    accionName = "Crear - ";
                    break;
                case "editar":
                    accionName = "Editar - ";
            }
            modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            modal.find("#precio-id").val(array[1]);
            modal.find("#precio-comentario").val(array[2]);
            modal.find("#precio-precio").val(array[3]);
        });

        $('#modalRuta').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var accionName = "";
            var title = "Ruta";

            array = button.data('accion');
            array = array.split(",");
            switch (array[0]) {
                case "crear":
                    accionName = "Crear - ";
                    break;
                case "editar":
                    accionName = "Editar - ";
            }
            modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            modal.find("#ruta-id").val(array[1]);
            modal.find("#ruta-comentario").val(array[2]);
            modal.find("#ruta-origen").val(array[3]);
            modal.find("#ruta-destino").val(array[4]);
        });

        $('#modalSeccion').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var accionName = "";
            var title = "Seccion";

            array = button.data('accion');
            array = array.split(",");
            switch (array[0]) {
                case "crear":
                    accionName = "Crear - ";
                    break;
                case "editar":
                    accionName = "Editar - ";
            }
            modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            modal.find("#seccion-id").val(array[1]);
            modal.find("#seccion-claseId").val(array[2]);
            modal.find("#seccion-maestroId").val(array[3]);
            modal.find("#seccion-comentario").val(array[4]);
            modal.find("#seccion-dias").val(array[5]);
            modal.find("#seccion-hora").val(array[6]);
        });

        // SAVE & UPDATE ACTIONS
        $(".btn-save-instInfo").click(function () {
            // //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-instInfo",
                nombre: $("#instInfo-nombre").val(),
                telefono: $("#instInfo-telefono").val(),
                correo: $("#instInfo-correo").val(),
                ubicacion_geo: $("#instInfo-ubicacion_geo").val(),
                direccion_fisica: $("#instInfo-direccion_fisica").val(),
                vision: $("#instInfo-vision").val(),
                mision: $("#instInfo-mision").val(),
                objetivos: $("#instInfo-objetivos").val(),
                politicas: $("#instInfo-politicas").val()
            }).done(function (data, status) {
                messageActive(data, "Guardado todos los cambios.");
            });
            // location.reload();
        });
        $(".btn-save-pclase").click(function () {
            $("#modalPeriodoClases").modal('hide');
            // var array = $(this).attr('id');
            // array = array.split(",");
            // Stop form from submitting normally
            // //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-pclass",
                per_id: $("#pclase-code").val(),
                desc: $("#pclase-name").val(),
                anio: $("#pclase-anio").val(),
                frdate: $("#pclase-frdate").val(),
                todate: $("#pclase-todate").val()
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
            // location.reload();
        });

        $(".btn-save-usuario").click(function () {
            $("#modalUsuarios").modal('hide');
            //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-usuario",
                usuario_id: $("#usuario-id").val(),
                nombre: $("#usuario-name").val(),
                fecha_nac: $("#usuario-fnac").val(),
                telefono: $("#usuario-telefono").val(),
                correo: $("#usuario-correo").val(),
                perfil_id_fk: $("#usuario-perfil").val()
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
        });

        $(".btn-save-carrera").click(function () {
            $("#modalCarrera").modal('hide');
            //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-carrera",
                carrera_id: $("#carrera-id").val(),
                comentario: $("#carrera-comentario").val(),
                fecha_fundacion: $("#carrera-fecha").val(),
                duracion: $("#carrera-duracion").val(),
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
        });

        $(".btn-save-clase").click(function () {
            $("#modalClase").modal('hide');
            //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-clase",
                clase_id: $("#clase-id").val(),
                carrera_id_fk: $("#clase-carrera").val(),
                comentario: $("#clase-comentario").val()
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
        });

        $(".btn-save-precio").click(function () {
            $("#modalPrecio").modal('hide');
            //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-precio",
                servicio_id: $("#precio-id").val(),
                comentario: $("#precio-comentario").val(),
                precio: $("#precio-precio").val(),
                cantidad: $("#precio-cantidad").val()
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
        });

        $(".btn-save-ruta").click(function () {
            $("#modalRuta").modal('hide');
            //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-ruta",
                ruta_id: $("#ruta-id").val(),
                comentario: $("#ruta-comentario").val(),
                origen: $("#ruta-origen").val(),
                destino: $("#ruta-destino").val()
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
        });

        $(".btn-save-seccion").click(function () {
            $("#modalSeccion").modal('hide');
            //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-seccion",
                seccion_id: $("#seccion-id").val(),
                clase_id_fk: $("#seccion-claseId").val(),
                maestro_id_fk: $("#seccion-maestroId").val(),
                dias: $("#seccion-dias").val(),
                hora: $("#seccion-hora").val(),
                comentario: $("#seccion-comentario").val()
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
        });

        $(".btn-save-matricula").click(function () {
            // $("#modalSeccion").modal('hide');
            //event.preventDefault();
            $.post(url + "/controlers/save_update_registro.jsp", {
                id: "crear-matricula",
                alumnoId: $("#matricula-alumnoId").val(),
                carreraId: $("#matricula-carreraId").val(),
                claseId1: $("#matricula-claseId1").val(),
                claseId2: $("#matricula-claseId2").val(),
                claseId3: $("#matricula-claseId3").val(),
                claseId4: $("#matricula-claseId4").val(),
                seccionId1: $("#matricula-seccionId1").val(),
                seccionId2: $("#matricula-seccionId2").val(),
                seccionId3: $("#matricula-seccionId3").val(),
                seccionId4: $("#matricula-seccionId4").val()
                        // comentario  : $("#matricula-comentario").val()
            }).done(function (data, status) {
                messageActive(data, "Registro guardado.");
            });
        });

        // DELETE ACTIONS
        $(".btn-delete-pclase").click(function () {
            if (confirm("Borrar Registro?")) {
                deleteRegister("borrar-pclase", $(this).attr('id'));
            }

        });
        $(".btn-delete-usuario").click(function () {
            if (confirm("Borrar Registro?")) {
                deleteRegister("borrar-usuario", $(this).attr('id'));
            }

        });
        $(".btn-delete-carrera").click(function () {
            if (confirm("Borrar Registro?")) {
                deleteRegister("borrar-carrera", $(this).attr('id'));
            }

        });
        $(".btn-delete-clase").click(function () {
            if (confirm("Borrar Registro?")) {
                deleteRegister("borrar-clase", $(this).attr('id'));
            }

        });
        $(".btn-delete-precio").click(function () {
            if (confirm("Borrar Registro?")) {
                deleteRegister("borrar-precio", $(this).attr('id'));
            }

        });
        $(".btn-delete-ruta").click(function () {
            if (confirm("Borrar Registro?")) {
                deleteRegister("borrar-ruta", $(this).attr('id'));
            }

        });
        $(".btn-delete-seccion").click(function () {
            if (confirm("Borrar Registro?")) {
                deleteRegister("borrar-seccion", $(this).attr('id'));
            }

        });

        //FUNCTIONS
        function deleteRegister(id, reg_id) {
            $.post(url + "/controlers/delete.jsp", {
                id: id,
                reg_id: reg_id
            }).done(function (data, status) {
                messageActive(data, "Registro Borrado");
            });
        }
        function messageActive(data, messagestr) {
            if (data.indexOf("ok") >= 0) {
                $("#error-message").collapse("show");
                $(".alert").removeClass("alert-danger").addClass("alert-success");
                $("#error-message-text").html("<center>" + messagestr + "</center>");
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
            secciones = "hide";
            matricula = "hide";
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
                case "secciones":
                    secciones = "show";
                    break;
                case "matricula":
                    matricula = "show";
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
            $("#reg-secciones").collapse(secciones);
            $("#reg-matricula").collapse(matricula);
            $("#error-message").collapse("hide");
        }

        function reporteMatricula() {
            var pdf = new jsPDF('p', 'pt', 'letter');
            // source can be HTML-formatted string, or a reference
            // to an actual DOM element from which the text will be scraped.
            source = $('#reporteMatricula')[0];

            pdf.setFontSize(30);
            pdf.text($("#instInfo-nombre").val(), 230, 70);
            pdf.setFontSize(22);
            pdf.text("Reporte de Matricula año 2017", 150, 120);
            // we support special element handlers. Register them with jQuery-style
            // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
            // There is no support for any other type of selectors
            // (class, of compound) at this time.
            specialElementHandlers = {
                // element with id of "bypass" - jQuery style selector
                '#bypassme': function (element, renderer) {
                    // true = "handled elsewhere, bypass text extraction"
                    return true;
                }
            };
            margins = {
                top: 180,
                bottom: 60,
                left: 40,
                width: 522
            };
            // all coords and widths are in jsPDF instance's declared units
            // 'inches' in this case
            pdf.fromHTML(
                    source, // HTML string or DOM elem ref.
                    margins.left, // x coord
                    margins.top, {// y coord
                        'width': margins.width, // max width of content on PDF
                        'elementHandlers': specialElementHandlers
                    },
                    function (dispose) {
                        // dispose: object with X, Y of the last line add to the PDF
                        //          this allow the insertion of new lines after html
                        pdf.save('ReporteMatricula.pdf');
                    }
            , margins);
        }

        $(".btn-exit").click(function () {
           window.location.replace(document.location.origin + "/SistemaUniversitario/index.html");
            $.post(url + "/controlers/autenticar.jsp", {
                user: "",
                pass: "",
            }).done(function (data, status) {
                
            });
        });

    </script>
</html>
