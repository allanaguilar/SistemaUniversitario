<%-- 
    Document   : guardar
    Created on : 09-12-2017, 10:13:32 AM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>

<%
//            out.print("id : " + request.getParameter("id"));
    if (request.getParameter("id").equals("crear-pclass")) {
        try {
            OracleConn db = new OracleConn();
            db.conectar();
//                    db.query.executeUpdate("SELECT usuario_id, contrasena, nombre from usuarios");
            db.query.executeUpdate("insert into periodosclases (periodo_id,comentario,anio,f_inicio,f_fin) values('"
                    + request.getParameter("per_id") + "','"
                    + request.getParameter("desc") + "','"
                    + request.getParameter("anio") + "','"
                    + request.getParameter("frdate") + "','"
                    + request.getParameter("todate") + "')");
            //insert into periodosclases (periodo_id, comentario, anio) values ('20', 'periodo 2', '2018')

            out.print("ok");
        } catch (Exception e) {
            e.printStackTrace();
            out.print(e);
//                    out.print(e.printStackTrace());
//                    out.print("<div id='respuesta'> " + e + "</div>");
        }
    }
%>


