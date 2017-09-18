<%--
    Document   : eliminar
    Created on : 09-12-2017, 10:13:59 AM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>
<%
  try {
    OracleConn db = new OracleConn();
    db.conectar();
    int rowAfected;

    if (request.getParameter("id").equals("borrar-pclase")) {
      rowAfected = db.query.executeUpdate("DELETE FROM periodosclases WHERE periodo_id='" + request.getParameter("reg_id") + "'");
    }

    if (request.getParameter("id").equals("borrar-usuario")) {
      rowAfected = db.query.executeUpdate("DELETE FROM usuarios WHERE usuario_id='" + request.getParameter("reg_id") + "'");
    }

    if (request.getParameter("id").equals("borrar-carrera")) {
      rowAfected = db.query.executeUpdate("DELETE FROM carreras WHERE carrera_id='" + request.getParameter("reg_id") + "'");
    }

    if (request.getParameter("id").equals("borrar-clase")) {
      rowAfected = db.query.executeUpdate("DELETE FROM clases WHERE clase_id='" + request.getParameter("reg_id") + "'");
    }

    if (request.getParameter("id").equals("borrar-precio")) {
      rowAfected = db.query.executeUpdate("DELETE FROM servicios WHERE servicio_id='" + request.getParameter("reg_id") + "'");
    }

    if (request.getParameter("id").equals("borrar-ruta")) {
      rowAfected = db.query.executeUpdate("DELETE FROM rutas WHERE ruta_id='" + request.getParameter("reg_id") + "'");
    }

    if (request.getParameter("id").equals("borrar-seccion")) {
      rowAfected = db.query.executeUpdate("DELETE FROM secciones WHERE seccion_id='" + request.getParameter("reg_id") + "'");
    }

    out.print("ok"); //SI EL INSERT SE HIZO SIN PROBLEMA RETORNO UN OK
    db.desconectar();
  } catch (Exception e) {
    e.printStackTrace();
    out.print(e);
  }
%>
