<%-- 
    Document   : autenticacion
    Created on : 09-10-2017, 04:09:00 PM
    Author     : aguilar
--%>

<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>
<%

//    Connection con = null;
//    Statement st = null;
    try {

        OracleConn db = new OracleConn();
        db.conectar();
        String login_name = "";
        String perfil = "";
        db.query.execute("SELECT * from usuarios");
        ResultSet rs = db.query.getResultSet();
        String centinela = "n";
        while (rs.next()) {
            if (request.getParameter("user").equals(rs.getString("usuario_id")) && request.getParameter("pass").equals(rs.getString("contrasena"))) {
                centinela = "s";
                login_name = rs.getString("nombre");
                perfil = rs.getString("perfil_id_fk");
                out.print(rs.getString("usuario_id"));
            }
        }

        if (centinela.equals("s")) {
            //guardar variables de session
            session.setAttribute("s_user", request.getParameter("user"));
            session.setAttribute("s_pass", request.getParameter("pass"));
            session.setAttribute("s_nombre", login_name);
            session.setAttribute("s_perfil", perfil);
            //llamar jsp correspondiete desde linea de comando
            String site = "";
            if (perfil.equals("REG")) {
                site = "http://localhost:9999/SistemaUniversitario/views/registro.jsp";
            }
            if (perfil.equals("ALM")) {
                site = "http://localhost:9999/SistemaUniversitario/views/alumnos.jsp";
            }
            if (perfil.equals("MAE")) {
                site = "http://localhost:9999/SistemaUniversitario/views/maestros.jsp";
            }
            
            //String site = new String("http://localhost:9999/SistemaUniversitario/views/registro.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

            out.print("<div>ok</div>");
//            request.getRequestDispatcher("principal.jsp").forward(request, response);
        } else {
//            out.print("<script>alert('el usuario no existe')</script>");
            out.print("<div>error</div>");
            // New location to be redirected
            String site = new String("http://localhost:9999/SistemaUniversitario/index.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

            session.setAttribute("s_user", null);
            session.setAttribute("s_pass", null);
//            request.getRequestDispatcher("http://localhost:9999/index.jsp").forward(request, response);
        }
        db.desconectar();
    } catch (Exception e) {
        e.printStackTrace();
        out.print(e);
    }
%>

