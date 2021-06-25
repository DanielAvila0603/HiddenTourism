/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.webservices;

import ec.espe.edu.controller.TourguideController;
import ec.espe.edu.model.Tourguide;
import java.sql.SQLException;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Daniel
 */
@Path("hiddentourism")
public class TourguideREST {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of TourguideREST
     */
    public TourguideREST() {
    }

    @GET
    @Path("/tourguide/list")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Tourguide> getDataTourguide(){
        TourguideController tourguideController = new TourguideController();
        
        return tourguideController.readTourguide();
    }
    
    @GET
    @Path("/tourguide/{tourguideId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Tourguide getRestaurantByID(@PathParam("tourguideId") String rID) throws ClassNotFoundException, SQLException {
        TourguideController tc = new TourguideController();
        
        for(Tourguide t : tc.readTourguide()){
            if(t.getIdTourguide().equalsIgnoreCase(rID))
                return t;
        }
        
        return new Tourguide();
    }
}