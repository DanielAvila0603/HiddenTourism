/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.webservices;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author WINDOWS-Sebastian
 */
@Path("hiddentourism")
public class RestaurantREST {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of RestaurantREST
     */
    public RestaurantREST() {
    }

    /**
     * Retrieves representation of an instance of ec.espe.edu.controller.RestaurantREST
     * @return an instance of java.lang.String
     
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getRestaurant() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }*/
}
