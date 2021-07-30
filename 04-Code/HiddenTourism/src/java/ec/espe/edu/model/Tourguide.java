package ec.espe.edu.model;

/**
 *
 * @author SEBASTIAN
 */
public class Tourguide {
    private String idTourguide;
    private String firstName;
    private String lastName;

    public Tourguide() {
        this("", "", "");
    }

    public Tourguide(String idTourguide, String firstName, String lastName) {
        this.idTourguide = idTourguide;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    /**
     * @return the idTourguide
     */
    public String getIdTourguide() {
        return idTourguide;
    }

    /**
     * @param idTourguide the idTourguide to set
     */
    public void setIdTourguide(String idTourguide) {
        this.idTourguide = idTourguide;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    @Override
    public String toString() {
        return "Tourguide{" + "CI=" + idTourguide + ", First Name=" + firstName + ", Last Name=" + lastName + '}';
    }
    
    
}
