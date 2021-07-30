class Restaurant{
    constructor(){
        this. restaurantID = "";
        this. restaurantName = "";
        this. restaurantAddress = "";
        this. restaurantDescription = "";
        this. openingTime = "";
        this. closingTime = "";
        this. consumptionType = "";
    }

    constructor(restaurantID, restaurantName,restaurantAddress,restaurantDescription,openingTime,closingTime,consumptionType){
        this. restaurantID = restaurantID;
        this. restaurantName = restaurantName;
        this. restaurantAddress = restaurantAddress;
        this. restaurantDescription = restaurantDescription;
        this. openingTime = openingTime;
        this. closingTime = closingTime;
        this. consumptionType = consumptionType;
    }

    get restaurantID(){
        return this.restaurantID;
    }

    set restaurantID(nrestaurantID){
        this.restaurantID=nrestaurantID;
    }
    
    get restaurantName(){
        return this. restaurantName;
    }
    set restaurantName(nrestaurantName){
        this. restaurantName = nrestaurantName;
    }

    get restaurantAddress(){
        return this. restaurantAddress;
    }
    
    set restaurantAddress(nrestaurantAddress)  {
        this. restaurantAddress = nrestaurantAddress;
    }
        
    get restaurantDescription(){
        return this. restaurantDescription;
    }
    
    set restaurantDescription(nrestaurantDescription){
        this. restaurantDescription = nrestaurantDescription;
    } 
                
    get openingTime(){
        return this. openingTime;
    }
    
    set openingTime(nopeningTime){
        this. openingTime = nopeningTime;
    }
        
    get closingTime(){
        return this. closingTime;
    }
    
    set closingTime(nclosingTime){
        this. closingTime = nclosingTime;
    } 
    
    get consumptionType(){
        return this. consumptionType;
    }

    set consumptionType(nconsumptionType){
        this. consumptionType = nconsumptionType
    }
        
}