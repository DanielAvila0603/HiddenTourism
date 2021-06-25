/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.webservices;

import ec.espe.edu.model.Place;
import ec.espe.edu.controller.PlaceController;

import java.util.List;
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
 * REST Web Service
 *
 * @author Daniel
 */
@Path("hiddentourism")
public class PlaceREST {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of PlaceRest
     */
    public PlaceREST() {
    }

    //Only one place
    @GET
    @Path("/places/{placeName}")
    @Produces(MediaType.APPLICATION_JSON)
    public Place getPlace(@PathParam("placeName") String placeName) {
        Place place=new Place("Panecillo","Pichincha","Quito","CentroHistorico","0995112125","Recorrido en musep");
        
        //place-> Json//Serialization
        if(placeName.equals(place.getTourismName())){
            return place;
        }else{
            place=new Place("Ronda","","","","","");
            return place;
        }      
    }
    
    @GET
    @Path("/places/list")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Place> getPlaceList() {
        PlaceController controller=new PlaceController();
        
        return controller.readPlace();
    }

    @GET
    @Path("/places/totalplace")
    @Produces(MediaType.APPLICATION_JSON)
    public int totalPlace(){
        PlaceController controller=new PlaceController();

        return controller.totalPlace();
    }
    
    @PUT
    @Consumes(MediaType.TEXT_PLAIN)
    public void putJson(Place content) {
        System.out.println("...Updating...");
    }
}

