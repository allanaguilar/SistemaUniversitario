/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dba;

/**
 *
 * @author aguilar
 */


import java.sql.*;
import oracle.jdbc.*;

public class OracleConn {
        
    private Connection conn; 
    public Statement query;
    
   public void conectar() throws SQLException{
       
       
    DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());

    conn = DriverManager.getConnection
          ("jdbc:oracle:thin:@localhost:1521:XE","ceutec", "ceutec");
         
          query = conn.createStatement();
    Statement stmt = conn.createStatement();
    stmt.close();
   
   }
   
   public void desconectar() {
        try {
            query.close();
            conn.close();
        } catch (SQLException e) {
        }
    }
}
