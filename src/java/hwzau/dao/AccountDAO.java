/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hwzau.dao;

import hwzau.dto.Account;
import hwzau.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author HwZau
 */
public class AccountDAO {

    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
     */
    /**
     *
     * @author user
     */
    //ham nay de lay tat ca cac record trong table Account
    //output: tra ve arrayList cac account 
    public static ArrayList<Account> getAccounts() throws SQLException {
        Connection cn = null;
        Account acc;
        ArrayList<Account> listAccounts = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT accID, email, password, fullname, phone, status, role from Accounts ";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs != null && rs.next()) {
                int AccID = rs.getInt("accID");
                String Email = rs.getString("email");
                String Password = rs.getString("password");
                String Fullname = rs.getString("fullname");
                String Phone = rs.getString("phone");
                int Status = rs.getInt("status");
                int Role = rs.getInt("role");
                acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
                listAccounts.add(acc);
            }

        } catch (Exception e) {
        } finally {
            if (cn != null) {
                cn.close();
            }
        }
        return listAccounts;
    }

    public static Account getAccount(String email, String password) {
//        ArrayList<Account> list=new ArrayList<>();
        Connection cn = null;
        Account acc = null;
        try {
            //buoc 1: mo ket noi
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //buoc 2: viet query va thuc thi
                String sql = "select accID,email,password,fullname,phone,status,role\n"
                        + "from Accounts\n"
                        + "where email = ? and password = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    //buoc 3: doc va xu li data
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
               
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
        return acc;
    }
    public static Account getAccountbyToken(String token) {
//        ArrayList<Account> list=new ArrayList<>();
        Connection cn = null;
        Account acc = null;
        try {
            //buoc 1: mo ket noi
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //buoc 2: viet query va thuc thi
                String sql = "select accID,email,password,fullname,phone,status,role\n"
                        + "from Accounts\n"
                        + "where token = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    //buoc 3: doc va xu li data
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        }
        return acc;
    }
    public static boolean changeProfile(String fullname, String phonenumber, String email) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDate Accounts SET fullname = ? , phone = ? \n"
                        + "  where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullname);
                pst.setString(2, phonenumber);
                pst.setString(3, email);
                ResultSet rs = pst.executeQuery();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }
    public static void updateAccountStatus(String email, int status) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "update Accounts SET status = ? where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setString(2, email);
            pst.executeQuery();
        } catch (Exception ee) {
            ee.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public static int deleteAccount(int accid){
        int result=0;
        try{
            //buoc 1: mo ket noi
            Connection cn=DBUtils.makeConnection();
            if(cn!=null){
                //buoc 2: viet query va thuc thi
                String sql = "delete Accounts\n"
                        + "where AccId=?";
                PreparedStatement pst=cn.prepareStatement(sql);
                pst.setInt(1, accid);
                result=pst.executeUpdate();
                cn.close();
            }
        }catch(Exception e){ e.printStackTrace();}
        return result;
    }
    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newSatus, int newRole) throws SQLException, Exception {

//        boolean result = false;
        Connection cn = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO Accounts (email, password, fullname, phone, status, role)"
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            cn = DBUtils.makeConnection();
            //buoc 1: mo ket noi
            if (cn != null) {
                //buoc 2: viet query va thuc thi
                pst = cn.prepareStatement(sql);
                pst.setString(1, newEmail);
                pst.setString(2, newPassword);
                pst.setString(3, newFullname);
                pst.setString(4, newPhone);
                pst.setInt(5, newSatus);
                pst.setInt(6, newRole);
                pst.executeUpdate();
                return true;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return false;
    }

    public static int updateToken(String token, String email) {
        Connection cn = null;
        int result = 0;
        try {
            //buoc 1: mo ket noi
            cn = DBUtils.makeConnection();
            if (cn != null) {
                //buoc 2: viet query va thuc thi
                String sql = "update Accounts\n"
                        + "set token=?\n"
                        + "where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                pst.setString(2, email);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
           
        }
        return result;
    }
    public static Account searchAccount(String fullName) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT accID, email, password, fullname, phone, status, role "
                    + "from Accounts where fullname = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, fullName);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int AccID = rs.getInt("accID");
                String Email = rs.getString("email");
                String Password = rs.getString("password");
                fullName = rs.getString("fullname");
                String Phone = rs.getString("phone");
                int Status = rs.getInt("status");
                int Role = rs.getInt("role");
                acc = new Account(AccID, Email, Password, fullName, Status, Phone, Role);
            }
        } catch (Exception e) {
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
            }
        }
        return acc;
    }

}
