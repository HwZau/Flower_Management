/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hwzau.dao;

import hwzau.dto.Order;
import hwzau.dto.OrderDetail;
import hwzau.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author HwZau
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> listOrders = new ArrayList<Order>();

        Connection cn = null;
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT  OrderID, OrdDate, shipdate, Orders.status, Orders.AccID\n"
                        + "  From Orders, Accounts\n"
                        + "  WHERE email = ? and Orders.AccID = Accounts.accID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();

                while (rs != null && rs.next()) {
                    int _orderID = rs.getInt("OrderID");
                    String _OrderDate = rs.getString("OrdDate");
                    System.out.println(rs.getDate("OrdDate"));
                    String _shipDate = rs.getString("shipdate");
                    int _status = rs.getInt("status");
                    int _accID = rs.getInt("AccID");
                    order = new Order(_orderID, _OrderDate, _shipDate, _status, _accID);
                    listOrders.add(order);
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
        return listOrders;
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        Connection cn = null;
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select DetailID, OrderID, PID, PName,price,imgPath, quantity\n"
                        + "from OrderDetails, Plants\n"
                        + "where OrderID = ? and OrderDetails.FID = Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int detailID = rs.getInt("DetailID");
                        int PlantID = rs.getInt("PID");
                        String PlantName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderdetail = new OrderDetail(detailID, orderID, PlantID, PlantName, price, imgPath, quantity);
                        list.add(orderdetail);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            System.out.println(email);
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false);//off autocommit
                String sql = "select accID from Accounts where Accounts.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }
                //insert a new order
                System.out.println("Account ID: " + accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("Order Date: " + d);
                sql = "insert Orders(OrdDate, status, AccID) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                //get order id that is the lagest number
                sql = "select top 1 OrderID from Orders order by orderId desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("OrderID");
                }
                //insert order detail
                System.out.println("Order ID: " + orderid);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetails values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("Order can't be insert!");
            }

        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static ArrayList<Order> searchDate(String accId, String dateFrom, String dateTo) {
        Order od;
        ArrayList<Order> listDate = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT OrderID, OrdDate, shipdate,Orders.status,AccID FROM Orders \n"
                    + "                   WHERE AccID =? AND OrdDate between ? AND ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, accId);
            pst.setString(2, dateFrom);
            pst.setString(3, dateTo);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int orderID = rs.getInt("OrderID");
                String orderDate = rs.getString("OrdDate");
                String shipDate = rs.getString("shipdate");
                int status = rs.getInt("status");
                int _accId = rs.getInt("AccID");
                od = new Order(orderID, orderDate, shipDate, status, _accId);
                listDate.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                }
            }
        }
        return listDate;
    }

    public static void canceledOrders(int orderid) {
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();
            String sql = " Update Orders set status = 3 where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderid);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException exception) {
                exception.printStackTrace();
            }
        }
    }

    public static void orderAgain(int orderid) {
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();
            String sql = " Update Orders set status = 1 where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderid);
            pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException exception) {
                exception.printStackTrace();
            }
        }
    }

    public static ArrayList<Order> manageOrder() {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> listOrders = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT OrderID, OrdDate, shipdate, status, AccID\n"
                    + "  FROM Orders";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs != null && rs.next()) {
                int _orderID = rs.getInt("OrderID");
                String _OrderDate = rs.getString("OrdDate");
                System.out.println(rs.getDate("OrdDate"));
                String _shipDate = rs.getString("shipdate");
                int _status = rs.getInt("status");
                int _accID = rs.getInt("AccID");
                order = new Order(_orderID, _OrderDate, _shipDate, _status, _accID);
                listOrders.add(order);
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
        return listOrders;
    }

    public static boolean saveShipDate(String shipDate, int orderID) {

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "UPDATE Orders \n"
                    + "SET shipdate =? WHERE orderid = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, shipDate);
            pst.setInt(2, orderID);
            pst.executeQuery();
        } catch (Exception e) {
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
            }
        }
        return true;
    }

    public static ArrayList<Order> searchDateOrders(String dateFrom, String dateTo) {
        Order od;
        ArrayList<Order> listDate = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT OrderID, OrdDate, shipdate,Orders.status,AccID FROM Orders \n"
                    + "                 WHERE OrdDate between ? AND ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, dateFrom);
            pst.setString(2, dateTo);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int orderID = rs.getInt("OrderID");
                String orderDate = rs.getString("OrdDate");
                String shipDate = rs.getString("shipdate");
                int status = rs.getInt("status");
                int _accId = rs.getInt("AccID");
                od = new Order(orderID, orderDate, shipDate, status, _accId);
                listDate.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                }
            }
        }
        return listDate;
    }
}
