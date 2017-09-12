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
        db.query.execute("SELECT usuario_id, contrasena, nombre from usuarios");
        ResultSet rs = db.query.getResultSet();
        String centinela = "n";
        while (rs.next()) {
            if (request.getParameter("user").equals(rs.getString(1))
                    && request.getParameter("pass").equals(rs.getString(2))) {
                centinela = "s";
                login_name = rs.getString(3);
                out.print(rs.getString(1));
            }
        }

        if (centinela.equals("s")) {
            //guardar variables de session
            session.setAttribute("s_user", request.getParameter("user"));
            session.setAttribute("s_pass", request.getParameter("pass"));
            session.setAttribute("s_nombre", login_name);
            //llamar jsp correspondiete desde linea de comando
            out.print("<script>alert('bienvenido!')</script>");
            String site = new String("http://localhost:9999/SistemaUniversitario/views/menu_principal.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
//            request.getRequestDispatcher("principal.jsp").forward(request, response);
        } else {
            out.print("<script>alert('el usuario no existe')</script>");
            // New location to be redirected
            String site = new String("http://localhost:9999/SistemaUniversitario/index.html");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
//            request.getRequestDispatcher("http://localhost:9999/index.jsp").forward(request, response);
        }
        db.desconectar();
    } //    
    catch (Exception e) {
        e.printStackTrace();
    }
%>

