/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class DBContext {
    public Connection getConnection() throws Exception{
        String url = "jdbc:sqlserver://"+servername+":"+portNumber+";databaseName="+dbname;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
}
    
    private final String servername = "localhost";
    private final String dbname = "SE1502_Assignment_Group04_test3";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123456789";
}
