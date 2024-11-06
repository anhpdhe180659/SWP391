/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */


public class policy {

    public policy() {
    }

    public policy(int aInt, String string, String string1) {
    }

    
    private int policyId;
    private String policyTitle;
    private String policyContext;

    // Getters and Setters
    public int getPolicyId() {
        return policyId;
    }

    public void setPolicyId(int policyId) {
        this.policyId = policyId;
    }

    public String getPolicyTitle() {
        return policyTitle;
    }

    public void setPolicyTitle(String policyTitle) {
        this.policyTitle = policyTitle;
    }

    public String getPolicyContext() {
        return policyContext;
    }

    public void setPolicyContext(String policyContext) {
        this.policyContext = policyContext;

  }
}