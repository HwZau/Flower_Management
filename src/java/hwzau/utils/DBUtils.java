/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hwzau.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author HwZau
 */
public class DBUtils {
//       static String localhost = "1433";
//      static String username = "sa";
//        static String password = "123456";
    public static Connection makeConnection() throws Exception{
        Connection cn= null;
        String IP="localhost";
        String instanceName="MSSQLSERVER";
        String port="1433";
        String uid="sa";
        String pwd="123456";
        String db="PlantShop";
        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url="jdbc:sqlserver://" +IP+"\\"+ instanceName+":"+port
                 +";databasename="+db+";user="+uid+";password="+pwd;
        Class.forName(driver);
        cn=DriverManager.getConnection(url);
        return cn;
//         try{
//             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//             String url="jbdc:sqlserver://localhost:"+ localhost + ";databaseName=PlantShop";
//             Connection con = DriverManager.getConnection(url, username, password);
//             return con;
//         } catch (ClassNotFoundException e){
//             e.printStackTrace();
//         } catch(SQLException e){
//             e.printStackTrace();
//         }
//           return null;
    
    }
}
