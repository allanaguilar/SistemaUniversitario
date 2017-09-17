<%--
    Document   : guardar
    Created on : 09-12-2017, 10:13:32 AM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>

<%
    try {
      OracleConn db = new OracleConn();
      db.conectar();
      ResultSet rs;

      // CREAR PERIODOS CLASES
      if (request.getParameter("id").equals("crear-pclass")) {

        db.query.execute("SELECT periodo_id FROM periodosclases WHERE periodo_id='" + request.getParameter("per_id") + "'");
        rs = db.query.getResultSet();

        if (rs.next()) {
          db.query.executeUpdate("UPDATE periodosclases SET"
            + " comentario  = '" + request.getParameter("desc") + "',"
            + " anio        = '" + request.getParameter("anio") + "',"
            + " f_inicio    = '" + request.getParameter("frdate") + "',"
            + " f_fin       = '" + request.getParameter("todate") + "'"
            + " WHERE periodo_id = '" + request.getParameter("per_id") + "'");
        }else {
          db.query.executeUpdate("insert into periodosclases (periodo_id,comentario,anio,f_inicio,f_fin) values('"
            + request.getParameter("per_id") + "','"
            + request.getParameter("desc") + "','"
            + request.getParameter("anio") + "','"
            + request.getParameter("frdate") + "','"
            + request.getParameter("todate")
            + "')");
        }

        // out.print("result: " + rs.next());

        // UPDATE periodosclases SET comentario = 'tercer', anio = '2019', f_inicio = '123', f_fin = '321' WHERE periodo_id = ''


      }

      // CREAR ALUMNO, MAESTRO, ADMINISTRADORES
      if (request.getParameter("id").equals("crear-usuario")) {
        db.query.executeUpdate("insert into usuarios (usuario_id,nombre,fecha_nac,telefono,correo,perfil_id_fk) values('"
          + request.getParameter("usuario_id") + "','"
          + request.getParameter("nombre") + "','"
          + request.getParameter("fecha_nac") + "','"
          + request.getParameter("telefono") + "','"
          + request.getParameter("correo") + "','"
          + request.getParameter("perfil_id_fk")
          + "')");
      }

      // CREAR CARRERAS
      if (request.getParameter("id").equals("crear-carrera")) {
        db.query.executeUpdate("insert into carreras (carrera_id,comentario,fecha_fundacion,duracion) values('"
          + request.getParameter("carrera_id") + "','"
          + request.getParameter("comentario") + "','"
          + request.getParameter("fecha_fundacion") + "','"
          + request.getParameter("duracion")
          + "')");
      }

      // CREAR CLASES
      if (request.getParameter("id").equals("crear-clase")) {
        db.query.executeUpdate("insert into clases (clase_id,carrera_id_fk,comentario) values('"
          + request.getParameter("clase_id") + "','"
          + request.getParameter("carrera_id_fk") + "','"
          + request.getParameter("comentario")
          + "')");
      }

      // CREAR PRECIOS
      if (request.getParameter("id").equals("crear-precio")) {
        db.query.executeUpdate("insert into servicios (servicio_id,comentario,precio,cantidad) values('"
          + request.getParameter("servicio_id") + "','"
          + request.getParameter("comentario") + "','"
          + request.getParameter("precio") + "','"
          + request.getParameter("cantidad")
          + "')");
      }

      // CREAR RUTAS
      if (request.getParameter("id").equals("crear-ruta")) {
        db.query.executeUpdate("insert into rutas (ruta_id,comentario,origen,destino) values('"
          + request.getParameter("ruta_id") + "','"
          + request.getParameter("comentario") + "','"
          + request.getParameter("origen") + "','"
          + request.getParameter("destino")
          + "')");
      }

      out.print("ok"); //SI EL INSERT SE HIZO SIN PROBLEMA RETORNO UN OK
      db.desconectar();
    } catch (Exception e) {
      e.printStackTrace();
      out.print(e);
    }
%>
