package ec.espe.edu.model;

/**
 *
 * @author WINDOWS-Sebastian
 */
public class Restaurant {
    private String restaurantID;
    private String restaurantName;
    private String restaurantAddress;
    private String restaurantDescription;
    private String openingTime;
    private String closingTime;
    private String consumptionType;

    public Restaurant
        (
            String restaurantID, 
            String restaurantName, 
            String restaurantAddress, 
            String restaurantDescription, 
            String openingTime, 
            String closingTime, 
            String consumptionType
        ) {
        this.restaurantID = restaurantID;
        this.restaurantName = restaurantName;
        this.restaurantAddress = restaurantAddress;
        this.restaurantDescription = restaurantDescription;
        this.openingTime = openingTime;
        this.closingTime = closingTime;
        this.consumptionType = consumptionType;
    }

    public Restaurant() {
        this.restaurantID = "";
        this.restaurantName = "";
        this.restaurantAddress = "";
        this.restaurantDescription = "";
        this.openingTime = "";
        this.closingTime = "";
        this.consumptionType = "";
    }

    public String getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(String restaurantID) {
        this.restaurantID = restaurantID;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getRestaurantAddress() {
        return restaurantAddress;
    }

    public void setRestaurantAddress(String restaurantAddress) {
        this.restaurantAddress = restaurantAddress;
    }

    public String getRestaurantDescription() {
        return restaurantDescription;
    }

    public void setRestaurantDescription(String restaurantDescription) {
        this.restaurantDescription = restaurantDescription;
    }

    public String getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(String openingTime) {
        this.openingTime = openingTime;
    }

    public String getClosingTime() {
        return closingTime;
    }

    public void setClosingTime(String closingTime) {
        this.closingTime = closingTime;
    }

    public String getConsumptionType() {
        return consumptionType;
    }

    public void setConsumptionType(String consumptionType) {
        this.consumptionType = consumptionType;
    }
}
