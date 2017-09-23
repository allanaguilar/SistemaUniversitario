<%--
    Document   : guardar - registro
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


      // ACTUALIZAR PONDERACION DE CLASES
      if (request.getParameter("id").equals("asignar-ponderacion")) {
          db.query.executeUpdate("UPDATE ponderacion_clases SET"
            + " acumulativo       = '" + request.getParameter("acumulativo") + "',"
            + " examen            = '" + request.getParameter("examen") + "'"
            + " WHERE clase_id_fk = '" + request.getParameter("clase_id_fk")  + "'"
            + " AND maestro_id_fk = '" + request.getParameter("maestro")  + "'");
      }

      out.print("ok"); //SI EL INSERT SE HIZO SIN PROBLEMA RETORNO UN OK
      db.desconectar();
    } catch (Exception e) {
      e.printStackTrace();
      out.print(e);
    }
%>
