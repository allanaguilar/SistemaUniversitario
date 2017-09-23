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
        <title>Sistema Universitario | Alumnos</title>
    </head>
    <body>
        <!--NAVBAR-->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Sistema Universitario | Alumnos</a>
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
        <!-- MODAL - PONDERACIONES CLASES -->
        <div class="modal fade" id="modalPonderaciones" tabindex="-1" role="dialog" aria-labelledby="modalPonderacionesLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="modalPonderacionesLabel">Ponderacion de Clase</h4>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="ponderacion-clase" class="control-label">Clase:</label>
                                <input type="text" class="form-control" id="ponderacion-clase" name="ponderacion-clase" value="">
                            </div>
                            <div class="form-group">
                                <label for="ponderacion-seccion" class="control-label">Seccion:</label>
                                <input type="text" class="form-control" id="ponderacion-seccion" name="ponderacion-seccion" value="">
                            </div>
                            <div class="form-group">
                                <label for="ponderacion-acumulativo" class="control-label">Nota Acumulativo:</label>
                                <input type="number" class="form-control" id="ponderacion-acumulativo" name="ponderacion-acumulativo" value="">
                            </div>
                            <div class="form-group">
                                <label for="ponderacion-examen" class="control-label">Nota Examen:</label>
                                <input type="number" class="form-control" id="ponderacion-examen" name="ponderacion-examen" value="">
                            </div>
                            <input type="hidden" class="form-control" id="ponderacion-maestro" name="ponderacion-maestro" value="">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-cancel" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-save-ponderacion">Guardar</button>
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
                    <li role="presentation" class="active"><a class="mae-inicio" href="#">Inicio</a></li>
                    <li role="presentation"><a id="alm-btn-historial" href="#">Historial Academico</a></li>
                    <li role="presentation"><a id="mae-btn-notas" href="#">Informacion Academica</a></li>
                    <li role="presentation"><a id="mae-btn-reclamo" href="#">Listado de Clases</a></li>
                    <li role="presentation"><a id="mae-btn-reportes" href="#">Inprimir Hoja de Confirmacion</a></li>
                    <li role="presentation"><a id="mae-btn-buses" href="#">Matricula</a></li>
                    <li role="presentation"><a id="mae-btn-salir" class="btn-exit" href="#">Salir</a></li>
                </ul>
            </div>
            <div class="col-md-6 col-md-offset-1 ">
                <div id="mae-title" class="collapse in">
                    <div class="jumbotron">
                        <div class="container">
                            <h1>Area de Alumnos</h1>
                            <p>Bienvenido al area de Alumno</p>
                        </div>
                    </div>
                </div>

                <!--PERIODOS-->
                <div id="alm-historial" class="collapse">
                    <div  class="page-header">
                        <h1>Historial Academico</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel mae-inicio">Cancelar</button>
                        <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-accion="crear" data-target="#modalPonderaciones">Crear</button> -->
                    </div>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Clase</th>
                                <th>Seccion</th>
                                <th>Nota Acumulativo</th>
                                <th>Nota Examen</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                try {

                                    db.conectar();
                                    db.query.execute("SELECT clases.comentario, secciones.SECCION_ID, secciones.ACUMULATIVO, secciones.examen, secciones.MAESTRO_ID_FK FROM secciones INNER JOIN clases ON secciones.CLASE_ID_FK = clases.CLASE_ID AND secciones.MAESTRO_ID_FK = '"+ session.getAttribute("s_user") +"'");
                                    rs = db.query.getResultSet();

                                    while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td>
                                    <a type="button" data-accion="editar,<%= rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4) + ',' + rs.getString(5) %>" data-target="#modalPonderaciones" id="<%= rs.getString(1)%>"
                                       class="btn-editar-ponderacion" data-toggle="modal" href="#"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <!-- <a class="btn-delete-pclase" id="<%= rs.getString(1)%>"  href="#"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a> -->
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
                <div id="mae-alumnos" class="collapse">
                    <div  class="page-header">
                        <h1>Alumnos</h1>
                    </div>
                    <div class="btn-group pull-right" role="group" aria-label="...">
                        <button type="button" class="btn btn-primary btn-cancel mae-inicio">Cancelar</button>
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
                                    <a type="button" data-accion="editar,<%=  rs.getString(6) + ',' + rs.getString(1) + ',' + rs.getString(2) + ',' + rs.getString(3) + ',' + rs.getString(4) + ',' + rs.getString(5)%>" data-target="#modalUsuarios" id="<%= rs.getString(1)%>"
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

            </div>
        </div>

    </body>

    <script>
        // VARS
        var url = "http://localhost:9999/SistemaUniversitario";
        var reg_id = "";

        //OPEN LIST REGS
        $(".mae-inicio").click(function () {
            ShowView("title");
        });
        $("#mae-btn-notas").click(function () {
            ShowView("periodos");
        });
        $("#alm-btn-historial").click(function () {
            ShowView("ponderacion");
        });
        $("#mae-btn-reclamo").click(function () {
            ShowView("alumnos");
        });
        $("#reg-btn-maestros").click(function () {
            ShowView("maestros");
        });

        $("#reg-btn-reportes").click(function () {
            ShowView("reportes");
        });

        //MODALS

        // OPEN WINDOW FOR EDIT REG
        // CONTEXTS VIEWS (CONTEXTUALIZAR LOS MODALES, PARA SABER SI ES UN MODAL PARA CREAR, ACTUALIZAR, PERFIL USUARIO)

        $('#modalPonderaciones').on('show.bs.modal', function (event) {
            var modal = $(this);
            var button = $(event.relatedTarget) // Button that triggered the modal
            var accionName = "";
            var title = "Ponderacion de Clase";

            array = button.data('accion');
            array = array.split(",");
            switch (array[0]) {
                case "crear":
                    accionName = "Crear - ";
                    break;
                case "editar":
                    accionName = "Editar - ";
            }
            $("#ponderacion-clase").prop('disabled', true);
            $("#ponderacion-seccion").prop('disabled', true);
            $("#ponderacion-maestro").prop('disabled', true);
            modal.find('.modal-title').text(accionName + title); //ASIGNO TITULO SEGUN CONTEXTO
            modal.find("#ponderacion-clase").val(array[1]);
            modal.find("#ponderacion-seccion").val(array[2]);
            modal.find("#ponderacion-acumulativo").val(array[3]);
            modal.find("#ponderacion-examen").val(array[4]);
            modal.find("#ponderacion-maestro").val(array[5]);
        });



        // SAVE & UPDATE ACTIONS
        $(".btn-save-ponderacion").click(function () {
            $("#modalPonderaciones").modal('hide');
            $.post(url + "/controlers/save_update_maestro.jsp", {
                id          : "asignar-ponderacion",
                acumulativo : $("#ponderacion-acumulativo").val(),
                examen      : $("#ponderacion-examen").val(),
                seccion_id  : $("#ponderacion-seccion").val(),
                maestro     : $("#ponderacion-maestro").val()
            }).done(function (data, status) {
                messageActive(data, "Guardado todos los cambios.");
            });
            // location.reload();
        });
        
       
        //FUNCTIONS
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
            ponderacion = "hide";
            title = "hide";
            switch (view_id) {
                case "ponderacion":
                    ponderacion = "show";
                    break;
                case "title":
                    title = "show";
                    break;
            }
            $("#alm-historial").collapse(ponderacion);
            $("#mae-title").collapse(title);
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
