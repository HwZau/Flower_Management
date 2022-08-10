/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hwzau.dto;

import hwzau.dao.AccountDAO;

/**
 *
 * @author HwZau
 */
public class TestConnection {
    public static void main(String[] args) {
    Account acc = AccountDAO.getAccount("ABC123", "test");
    if(acc!=null){
        if(acc.getRole()==1){
            System.out.println("I am admin");
        }else{
             System.out.println("I am user");
        }
            
    }else {
         System.out.println("Login fail");
    }
}
}
