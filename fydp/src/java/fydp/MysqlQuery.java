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
    
    private static void importSQL()
            throws ClassNotFoundException, SQLException
    {
        Connection con = null;
        Statement stmt = null;
        String query;
        try {
            con = comeon();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
//            query = "LOAD DATA INFILE '"+filename+"' INTO TABLE testtable  FIELDS TERMINATED BY ',' (text,price)";           
//            stmt.executeUpdate(query);
            
        } finally {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public static ArrayList<Sensor> query1(String start, String end, String startHour, String startMinute, String endHour, String endMinute)
    throws ClassNotFoundException, SQLException 
    {
       // importSQL();
        Connection con = null;
        Statement stmt = null;
        ArrayList<Sensor> result = null;
        try {
            con = comeon();
            stmt = con.createStatement();
             ResultSet resultSet;
            if (!start.isEmpty() && start != null){
                if (!end.isEmpty() && end != null){
                    String hg = "SELECT * FROM Sensor1 WHERE sensTime >= STR_TO_DATE('"+start+" "+startHour+":"+startMinute+"', '%m/%d/%Y %H:%i') AND sensTime <= STR_TO_DATE('"+end+" "+endHour+":"+endMinute+"', '%m/%d/%Y %H:%i') ORDER BY sensTime;";
                    resultSet = stmt.executeQuery(hg);
                }
                else{
                    resultSet = stmt.executeQuery("SELECT * FROM Sensor1 WHERE sensTime >= STR_TO_DATE('"+start+" "+startHour+":"+startMinute+"', '%m/%d/%Y %H:%i') ORDER BY sensTime;");
                }
            }
            else if (!end.isEmpty() && end != null){
                resultSet = stmt.executeQuery("SELECT * FROM Sensor1 WHERE sensTime <= STR_TO_DATE('"+end+" "+endHour+":"+endMinute+"', '%m/%d/%Y %H:%i') ORDER BY sensTime;");
            }
            else{
                resultSet = stmt.executeQuery("SELECT * FROM Sensor1 ORDER BY sensTime;");
            }
            result = new ArrayList<Sensor>();
            while (resultSet.next()) {
                Date test = new Date();
                test =  resultSet.getTimestamp("sensTime");
                Sensor s = new Sensor(
                        resultSet.getDouble("flow"),
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
