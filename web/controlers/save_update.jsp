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
      String sql;

      // CREAR/ACTUALIZAR PERIODOS CLASES
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
      }

      // CREAR ALUMNO, MAESTRO, ADMINISTRADORES
      if (request.getParameter("id").equals("crear-usuario")) {
        db.query.execute("SELECT usuario_id FROM usuarios WHERE usuario_id='" + request.getParameter("usuario_id") + "'");
        rs = db.query.getResultSet();
        if (rs.next()) {
          db.query.executeUpdate("UPDATE usuarios SET"
            + " nombre    = '" + request.getParameter("nombre") + "',"
            + " fecha_nac = '" + request.getParameter("fecha_nac") + "',"
            + " telefono  = '" + request.getParameter("telefono") + "',"
            + " correo    = '" + request.getParameter("correo") + "'"
            + " WHERE usuario_id = '" + request.getParameter("usuario_id") + "'");
        }else {
          db.query.executeUpdate("insert into usuarios (usuario_id,nombre,fecha_nac,telefono,correo,perfil_id_fk) values('"
            + request.getParameter("usuario_id") + "','"
            + request.getParameter("nombre") + "','"
            + request.getParameter("fecha_nac") + "','"
            + request.getParameter("telefono") + "','"
            + request.getParameter("correo") + "','"
            + request.getParameter("perfil_id_fk")
            + "')");
        }
      }

      // CREAR CARRERAS
      if (request.getParameter("id").equals("crear-carrera")) {
        db.query.execute("SELECT carrera_id FROM carreras WHERE carrera_id='" + request.getParameter("carrera_id") + "'");
        rs = db.query.getResultSet();
        if (rs.next()) {
          db.query.executeUpdate("UPDATE carreras SET"
            + " comentario      = '" + request.getParameter("comentario") + "',"
            + " fecha_fundacion = '" + request.getParameter("fecha_fundacion") + "',"
            + " duracion        = '" + request.getParameter("duracion") + "'"
            + " WHERE carrera_id = '" + request.getParameter("carrera_id") + "'");
        }else {
          db.query.executeUpdate("insert into carreras (carrera_id,comentario,fecha_fundacion,duracion) values('"
            + request.getParameter("carrera_id") + "','"
            + request.getParameter("comentario") + "','"
            + request.getParameter("fecha_fundacion") + "','"
            + request.getParameter("duracion")
            + "')");
        }
      }

      // CREAR CLASES
      if (request.getParameter("id").equals("crear-clase")) {
        db.query.execute("SELECT clase_id FROM clases WHERE clase_id='" + request.getParameter("clase_id") + "'");
        rs = db.query.getResultSet();
        if (rs.next()) {
          sql = "UPDATE clases SET"
            + " carrera_id_fk = '" + request.getParameter("carrera_id_fk") + "',"
            + " comentario    = '" + request.getParameter("comentario") + "'"
            + " WHERE clase_id = '" + request.getParameter("clase_id") + "'";
            out.print("  " + sql);
          db.query.executeUpdate(sql);
        }else {
          db.query.executeUpdate("insert into clases (clase_id,carrera_id_fk,comentario) values('"
            + request.getParameter("clase_id") + "','"
            + request.getParameter("carrera_id_fk") + "','"
            + request.getParameter("comentario")
            + "')");
        }
      }

      // CREAR PRECIOS
      if (request.getParameter("id").equals("crear-precio")) {
        db.query.execute("SELECT servicio_id FROM servicios WHERE servicio_id='" + request.getParameter("servicio_id") + "'");
        rs = db.query.getResultSet();
        if (rs.next()) {
          db.query.executeUpdate("UPDATE servicios SET"
            + " comentario  = '" + request.getParameter("comentario ") + "',"
            + " precio      = '" + request.getParameter("precio") + "',"
            + " cantidad    = '" + request.getParameter("cantidad") + "'"
            + " WHERE servicio_id = '" + request.getParameter("servicio_id") + "'");
        }else {
          db.query.executeUpdate("insert into servicios (servicio_id,comentario,precio,cantidad) values('"
            + request.getParameter("servicio_id") + "','"
            + request.getParameter("comentario") + "','"
            + request.getParameter("precio") + "','"
            + request.getParameter("cantidad")
            + "')");
        }
      }

      // CREAR RUTAS
      if (request.getParameter("id").equals("crear-ruta")) {
        db.query.execute("SELECT ruta_id FROM rutas WHERE ruta_id='" + request.getParameter("ruta_id") + "'");
        rs = db.query.getResultSet();
        if (rs.next()) {
          db.query.executeUpdate("UPDATE rutas SET"
            + " comentario  = '" + request.getParameter("comentario ") + "',"
            + " origen      = '" + request.getParameter("origen") + "',"
            + " destino     = '" + request.getParameter("destino") + "'"
            + " WHERE ruta_id = '" + request.getParameter("ruta_id") + "'");
        }else {
          db.query.executeUpdate("insert into rutas (ruta_id,comentario,origen,destino) values('"
            + request.getParameter("ruta_id") + "','"
            + request.getParameter("comentario") + "','"
            + request.getParameter("origen") + "','"
            + request.getParameter("destino")
            + "')");
        }
      }

      out.print("ok"); //SI EL INSERT SE HIZO SIN PROBLEMA RETORNO UN OK
      db.desconectar();
    } catch (Exception e) {
      e.printStackTrace();
      out.print(e);
    }
%>
