<%--
    Document   : guardar
    Created on : 09-12-2017, 10:13:32 AM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>

<%
    // CREAR PERIODOS CLASES
    if (request.getParameter("id").equals("crear-pclass")) {
        try {
            OracleConn db = new OracleConn();
            db.conectar();
            db.query.executeUpdate("insert into periodosclases (periodo_id,comentario,anio,f_inicio,f_fin) values('"
                    + request.getParameter("per_id") + "','"
                    + request.getParameter("desc") + "','"
                    + request.getParameter("anio") + "','"
                    + request.getParameter("frdate") + "','"
                    + request.getParameter("todate") + "')");
            db.desconectar();
            out.print("ok");
        } catch (Exception e) {
            e.printStackTrace();
            out.print(e);
        }
    }

    // CREAR ALUMNO, MAESTRO, ADMINISTRADORES
    if (request.getParameter("id").equals("crear-usuario")) {
        try {
            OracleConn db = new OracleConn();
            db.conectar();
            db.query.executeUpdate("insert into usuarios (usuario_id,nombre,fecha_nac,telefono,correo,perfil_id_fk) values('"
                    + request.getParameter("usuario_id") + "','"
                    + request.getParameter("nombre") + "','"
                    + request.getParameter("fecha_nac") + "','"
                    + request.getParameter("telefono") + "','"
                    + request.getParameter("correo") + "','"
                    + request.getParameter("perfil_id_fk")
                    + "')");
            out.print("ok");
        } catch (Exception e) {
            e.printStackTrace();
            out.print(e);
        }
    }


%>
