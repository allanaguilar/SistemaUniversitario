<%-- 
    Document   : guardar
    Created on : 09-12-2017, 10:13:32 AM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Respuesta</title>
    </head>
    <body>

        <%
//            out.print("id : " + request.getParameter("id"));
            if (request.getParameter("id").equals("crear-pclass")) {
                try {
                    OracleConn db = new OracleConn();
                    db.conectar();
//                    db.query.executeUpdate("SELECT usuario_id, contrasena, nombre from usuarios");
                      db.query.executeUpdate("insert into periodosclases (periodo_id,comentario,anio,f_inicio,f_fin) values('" +
                                request.getParameter("per_id") + "','" + 
                                request.getParameter("desc") + "','" +
                                request.getParameter("anio") + "','" +
                                request.getParameter("frdate") + "','" + 
                                request.getParameter("todate") + "')");
                                            //insert into periodosclases (periodo_id, comentario, anio) values ('20', 'periodo 2', '2018')

                    ResultSet rs = db.query.getResultSet();
                    out.print("<div id='respuesta'> " + rs + "</div>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print(e);
                    out.print("<div id='respuesta'> " + e + "</div>");
                }
            }
        %>
    </body>

</html>

