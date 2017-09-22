<%--
    Document   : test
    Created on : 09-15-2017, 08:59:41 PM
    Author     : aguilar
--%>
<%@page import = "Dba.OracleConn"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.io.*,java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
                OracleConn db = new OracleConn();
                db.conectar();
                db.query.execute("SELECT * FROM periodosclases WHERE periodo_id='1'");
                ResultSet rs = db.query.getResultSet();

                rs.next();
        %>

        <%=rs.getString(1)%>
        <%=rs.getString(2)%>
        <%=rs.getString(3)%>
        <%=rs.getString(4)%>
                 
        <%db.desconectar();%>
    </body>
</html>
