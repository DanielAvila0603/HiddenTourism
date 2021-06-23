/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.webservices;

import ec.espe.edu.controller.RestaurantController;
import ec.espe.edu.model.Restaurant;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

/**
 * RestaurantREST Web Service
 *
 * @author WINDOWS-Sebastian
 */
@Path("generic")
public class RestaurantREST {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of GenericResource
     */
    public RestaurantREST() {
    }
  
    @GET
    @Path("/restaurant")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Restaurant> getRestaurants() throws ClassNotFoundException, SQLException {  
        RestaurantController rc = new RestaurantController();
        
        return rc.readDBRestaurant();
    }
    
    @GET
    @Path("/restaurant/{restaurantID}")
    @Produces(MediaType.APPLICATION_JSON)
    public Restaurant getRestaurantByID(@PathParam("restaurantID") String rID) throws ClassNotFoundException, SQLException {
        RestaurantController rc = new RestaurantController();
        
        for(Restaurant r : rc.readDBRestaurant()){
            if(r.getRestaurantID().equalsIgnoreCase(rID))
                return r;
        }
        
        return new Restaurant();
    }

    @GET
    @Path("/restaurantWorks")
    @Produces(MediaType.APPLICATION_JSON)
    public Restaurant getRestaurantThatWorksMore() throws ClassNotFoundException, SQLException {  
        RestaurantController rc = new RestaurantController();
        Restaurant restaurantThatWorksMore = new Restaurant();
        
        int thoursWorked = 0;
        int tminutesWorked = 0;
        
        int openingHoursCuttedTime,
                openingMinutesCuttedTime,
                closingHoursCuttedTime,
                closingMinutesCuttedTime,
                hoursWorked,
                minutesWorked;
        
        
        for(Restaurant r : rc.readDBRestaurant()){
            openingHoursCuttedTime = Integer.parseInt(r.getOpeningTime().split(":")[0]);
            openingMinutesCuttedTime = Integer.parseInt(r.getOpeningTime().split(":")[1]);

            closingHoursCuttedTime = Integer.parseInt(r.getClosingTime().split(":")[0]);
            closingMinutesCuttedTime = Integer.parseInt(r.getClosingTime().split(":")[1]);

            hoursWorked = closingHoursCuttedTime - openingHoursCuttedTime;
            minutesWorked = closingMinutesCuttedTime - openingMinutesCuttedTime;

            if(minutesWorked > 60){
                hoursWorked++;
                minutesWorked -= 60;
            }
            
            if(hoursWorked > thoursWorked){
                restaurantThatWorksMore = r;
                thoursWorked = hoursWorked;
                tminutesWorked = minutesWorked;
            } else if(hoursWorked == thoursWorked && minutesWorked > tminutesWorked){
                restaurantThatWorksMore = r;
                thoursWorked = hoursWorked;
                tminutesWorked = minutesWorked;
            }
        }
        
        return restaurantThatWorksMore;
    }

    /**
     * PUT method for updating or creating an instance of RestaurantREST
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }
}
