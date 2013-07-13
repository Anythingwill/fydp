/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package fydp;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date; 
/**
 *
 * @author Ethan
 */
public class MysqlQuery {
    
    public static final String url = "jdbc:mysql://sql3.freemysqlhosting.net:3306/";
    public static final String user = "sql313628";
    public static final String pwd = "vR2%tL2*";
    
    
    public static Connection comeon()
            throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, pwd);
        Statement stmt = null;
        try {
            con.createStatement();
            stmt = con.createStatement();
            stmt.execute("USE sql313628");
            String a = "test";
        } finally {
            if (stmt != null) {
                stmt.close();
            }
        }
        return con;
    }
    
    public static ArrayList<Sensor> query1()
    throws ClassNotFoundException, SQLException 
    {
        Connection con = null;
        Statement stmt = null;
        ArrayList<Sensor> result = null;
        try {
            con = comeon();
            stmt = con.createStatement();
            ResultSet resultSet = stmt.executeQuery("SELECT * FROM Sensor1 ORDER BY sensTime;");
            result = new ArrayList<Sensor>();
            while (resultSet.next()) {
                Date test = new Date();
                test =  resultSet.getTimestamp("sensTime");
                Sensor s = new Sensor(
                        resultSet.getInt("flow"),
                        resultSet.getTimestamp("sensTime"));
                result.add(s);
            }
            return result;
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
