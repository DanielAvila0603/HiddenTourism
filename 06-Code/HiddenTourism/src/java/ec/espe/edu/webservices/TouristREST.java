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
 * @author Daniel
 */
@Path("hiddentourism")
public class TouristREST {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of TouristREST
     */
    public TouristREST() {
    }

    /**
     * Retrieves representation of an instance of ec.espe.edu.webservices.TouristREST
     * @return an instance of java.lang.String
     
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getTourist() {
        //TODO return proper representation object
        throw new UnsupportedOperationException();
    }
    * 
    */
}