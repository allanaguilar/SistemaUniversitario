// // VARS
// var url = "http://localhost:9999/SistemaUniversitario";
//
// //OPEN REGS
// $("#reg-info-gen").click(function () {
//   ShowView("confi_sis");
// });
// $("#reg-inicio").click(function () {
//   ShowView("title");
// });
// $("#reg-btn-periodos").click(function () {
//   ShowView("periodos");
// });
// $("#reg-btn-alumnos").click(function () {
//   ShowView("alumnos");
// });
// $("#reg-btn-maestros").click(function () {
//   ShowView("maestros");
// });
// $("#reg-btn-admin").click(function () {
//   ShowView("admin");
// });
// $("#reg-btn-carreras").click(function () {
//   ShowView("carreras");
// });
// $("#reg-btn-clases").click(function () {
//   ShowView("clases");
// });
// $("#reg-btn-precios").click(function () {
//   ShowView("precios");
// });
// $("#reg-btn-rutas").click(function () {
//   ShowView("rutas");
// });
//
// //MODALS
// $('#modalPeriodoClases').on('show.bs.modal', function (event) {
//   var modal = $(this);
//   // modal.find('.modal-title').text('New message to ' + recipient)
//   // modal.find('.modal-body input').val(recipient)
//   // $("#pclase-code").val("MAT02");
//   // $("#pclase-name").val("ALGEGRA");
// });
//
// $('#modalUsuarios').on('show.bs.modal', function (event) {
//   var modal = $(this);
//   var button = $(event.relatedTarget) // Button that triggered the modal
//   var perfil = "";
//
//   switch (button.data('perfil')){
//     case "ALM":
//     perfil = "Alumno";
//     break;
//     case "MAE":
//     perfil = "Profesor";
//     break;
//     case "REG":
//     perfil = "Administrador";
//   }
//
//   modal.find('.modal-title').text(perfil);
//   modal.find('#usuario-perfil').val(button.data('perfil')); //ASIGNA VALOR AL CAMPO PERFIL
// });
//
// $(".btn-save-pclase").click(function () {
//   $("#modalPeriodoClases").modal('hide');
//   // var array = $(this).attr('id');
//   // array = array.split(",");
//   // Stop form from submitting normally
//   event.preventDefault();
//   $.post(url + "/controlers/crear.jsp", {
//     id      : "crear-pclass",
//     per_id  : $("#pclase-code").val(),
//     desc    : $("#pclase-name").val(),
//     anio    : $("#pclase-anio").val(),
//     frdate  : $("#pclase-frdate").val(),
//     todate  : $("#pclase-todate").val()
//   }).done(function (data, status) {
//     messageActive(data);
//   });
//   // location.reload();
// });
//
// $(".btn-save-usuario").click(function () {
//   $("#modalUsuario").modal('hide');
//   event.preventDefault();
//   $.post(url + "/controlers/crear.jsp", {
//     id          : "crear-usuario",
//     usuario_id  : $("#usuario-id").val(),
//     nombre      : $("#usuario-name").val(),
//     fecha_nac   : $("#usuario-fnac").val(),
//     telefono    : $("#usuario-telefono").val(),
//     correo      : $("#usuario-correo").val(),
//     perfil_id_fk: $("#usuario-perfil").val()
//   }).done(function (data, status) {
//     messageActive(data);
//   });
// });
//
// $(".btn-save-carrera").click(function () {
//   $("#modalCarrera").modal('hide');
//   event.preventDefault();
//   $.post(url + "/controlers/crear.jsp", {
//     id              : "crear-carrera",
//     carrera_id      : $("#carrera-id").val(),
//     comentario      : $("#carrera-comentario").val(),
//     fecha_fundacion : $("#carrera-fecha").val(),
//     duracion        : $("#carrera-duracion").val(),
//   }).done(function (data, status) {
//     messageActive(data);
//   });
// });
//
// $(".btn-save-clase").click(function () {
//   $("#modalClase").modal('hide');
//   event.preventDefault();
//   $.post(url + "/controlers/crear.jsp", {
//     id            : "crear-clase",
//     clase_id      : $("#clase-id").val(),
//     carrera_id_fk : $("#clase-carrera").val(),
//     comentario    : $("#clase-comentario").val()
//   }).done(function (data, status) {
//     messageActive(data);
//   });
// });
//
// $(".btn-save-precio").click(function () {
//   $("#modalPrecio").modal('hide');
//   event.preventDefault();
//   $.post(url + "/controlers/crear.jsp", {
//     id          : "crear-precio",
//     servicio_id : $("#precio-id").val(),
//     comentario  : $("#precio-comentario").val(),
//     precio      : $("#precio-precio").val(),
//     cantidad    : $("#precio-cantidad").val()
//   }).done(function (data, status) {
//     messageActive(data);
//   });
// });
//
// $(".btn-save-ruta").click(function () {
//   $("#modalRuta").modal('hide');
//   event.preventDefault();
//   $.post(url + "/controlers/crear.jsp", {
//     id        : "crear-ruta",
//     ruta_id   : $("#ruta-id").val(),
//     comentario: $("#ruta-comentario").val(),
//     origen    : $("#ruta-origen").val(),
//     destino   : $("#ruta-destino").val()
//   }).done(function (data, status) {
//     messageActive(data);
//   });
// });
//
// //FUNCTIONS
// function messageActive(data){
//   if (data.indexOf("ok") >= 0) {
//     $("#error-message").collapse("show");
//     $(".alert").removeClass("alert-danger").addClass("alert-success");
//     $("#error-message-text").html("<center>El registro ha sido guardado.</center>");
//   } else {
//     $("#error-message").collapse("show");
//     $(".alert").removeClass("alert-success").addClass("alert-danger");
//     $("#error-message-text").html(data.toString());
//   }
//   console.log(data);
// }
//
// function ShowView(view_id) {
//   title = "hide";
//   confi_sis = "hide";
//   periodos = "hide";
//   alumnos = "hide";
//   maestros = "hide";
//   carreras = "hide";
//   clases = "hide";
//   precios = "hide";
//   rutas = "hide";
//   admin = "hide";
//   reportes = "hide";
//   switch (view_id) {
//     case "title":
//     title = "show";
//     break;
//     case "confi_sis":
//     confi_sis = "show";
//     break;
//     case "periodos":
//     periodos = "show";
//     break;
//     case "alumnos":
//     alumnos = "show";
//     break;
//     case "maestros":
//     maestros = "show";
//     break;
//     case "admin":
//     admin = "show";
//     break;
//     case "carreras":
//     carreras = "show";
//     break;
//     case "clases":
//     clases = "show";
//     break;
//     case "precios":
//     precios = "show";
//     break;
//     case "rutas":
//     rutas = "show";
//     break;
//     case "reportes":
//     reportes = "show";
//     break;
//
//   }
//   $("#reg-title").collapse(title);
//   $("#reg-confi-sis").collapse(confi_sis);
//   $("#reg-periodos").collapse(periodos);
//   $("#reg-alumnos").collapse(alumnos);
//   $("#reg-maestros").collapse(maestros);
//   $("#reg-admin").collapse(admin);
//   $("#reg-carreras").collapse(carreras);
//   $("#reg-clases").collapse(clases);
//   $("#reg-precios").collapse(precios);
//   $("#reg-rutas").collapse(rutas);
//   $("#reg-reportes").collapse(reportes);
//   $("#error-message").collapse("hide");
// }
