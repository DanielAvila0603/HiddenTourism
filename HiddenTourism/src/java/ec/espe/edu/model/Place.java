/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.edu.espe.places.model;

/**
 *
 * @author Nayeli
 */
public class Place {
    String tourismName;
    String province;
    String canton;
    String address;
    String contact;
    String activities; 

    public Place(String tourismName, String province, String canton, String address, String contact, String activities) {
        
        this.tourismName = tourismName;
        this.province = province;
        this.canton = canton;
        this.address = address;
        this.contact = contact;
        this.activities = activities;
    }

    public Place(){
        
    }
    
    @Override
    public String toString(){
        return "Place{"+"tourismName="+tourismName+"province="+province+"canton="+canton+"address="+address+"contact="+contact+"activities="+activities+'}';
    }
    
    public String getTourismName() {
        return tourismName;
    }

    public void setTourismName(String tourismName) {
        this.tourismName = tourismName;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCanton() {
        return canton;
    }

    public void setCanton(String canton) {
        this.canton = canton;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getActivities() {
        return activities;
    }

    public void setActivities(String activities) {
        this.activities = activities;
    }

        
}
