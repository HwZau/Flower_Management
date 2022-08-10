/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hwzau.dto;

/**
 *
 * @author HwZau
 */
public class Order {
    private int OrderID;
    private String orderDate;
    private String shipDate;   
    private int status;
    private int accID;

    public Order() {
    }

    public Order(int OrderID, String orderDate, String shipDate, int status, int accID) {
        this.OrderID = OrderID;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.status = status;
        this.accID = accID;
    }

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }
    
}
