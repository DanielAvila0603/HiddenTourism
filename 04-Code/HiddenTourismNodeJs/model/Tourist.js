class Tourist{
    constructor(){
        this.IdTourist = "";
        this.FirstName = "";
        this.LastName = "";
        this.Location = "";
        this.ReservationDate = new Date();
        this.PaymentType = "";
    }

    constructor(IdTourist, FirstName, LastName, Location, ReservationDate, PaymentType){
        this.IdTourist = IdTourist;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Location = Location
        this.ReservationDate = ReservationDate;
        this.PaymentType = PaymentType;
    }

    get IdTourist(){
        return this.IdTourist;
    }

    set IdTourist(nIdTourist){
        this.IdTourist = nIdTourist;
    }

    get FirstName(){
        return this.FirstName;
    }

    set FirstName(nFirstName){
        this.FirstName = nFirstName;
    }

    get LastName(){
        return this.LastName;
    }

    set LastName(nLastName){
        this.LastName = nLastName;
    }

    get Location(){
        return this.Location;
    }

    set Location(nLocation){
        this.Location = nLocation;
    }

    get ReservationDate(){
        return this.ReservationDate;
    }

    set ReservationDate(nReservationDate){
        this.ReservationDate = nReservationDate;
    }

    get PaymentType(){
        return this.PaymentType;
    }

    set PaymentType(nPaymentType){
        this.PaymentType = nPaymentType;
    }
}
