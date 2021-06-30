/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.model;

import java.util.Date;

/**
 *
 * @author SEBASTIAN
 */
public class Tourist {
    private String IdTourist;
    private String FirstName;
    private String LastName;
    private String Location;
    private Date ResevationDate;
    private String PaymentType;

    public Tourist() {
    }

    public Tourist(String IdTourist, String FirstName, String LastName, String Location, Date ResevationDate, String PaymentType) {
        this.IdTourist = IdTourist;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Location = Location;
        this.ResevationDate = ResevationDate;
        this.PaymentType = PaymentType;
    }

    /**
     * @return the IdTourist
     */
    public String getIdTourist() {
        return IdTourist;
    }

    /**
     * @param IdTourist the IdTourist to set
     */
    public void setIdTourist(String IdTourist) {
        this.IdTourist = IdTourist;
    }

    /**
     * @return the FirstName
     */
    public String getFirstName() {
        return FirstName;
    }

    /**
     * @param FirstName the FirstName to set
     */
    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    /**
     * @return the LastName
     */
    public String getLastName() {
        return LastName;
    }

    /**
     * @param LastName the LastName to set
     */
    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    /**
     * @return the Location
     */
    public String getLocation() {
        return Location;
    }

    /**
     * @param Location the Location to set
     */
    public void setLocation(String Location) {
        this.Location = Location;
    }

    /**
     * @return the ResevationDate
     */
    public Date getResevationDate() {
        return ResevationDate;
    }

    /**
     * @param ResevationDate the ResevationDate to set
     */
    public void setResevationDate(Date ResevationDate) {
        this.ResevationDate = ResevationDate;
    }

    /**
     * @return the PaymentType
     */
    public String getPaymentType() {
        return PaymentType;
    }

    /**
     * @param PaymentType the PaymentType to set
     */
    public void setPaymentType(String PaymentType) {
        this.PaymentType = PaymentType;
    }
    
    
}
