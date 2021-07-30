class Place{
    //constructor vacio
    constructor(){
        this.TourismName = "";
        this.Province = "";
        this.Canton = "";
        this.Address = "";
        this.Contact = "";
        this.Activities = "";
    }
    //constructor con parametros
    constructor(TourismName,Province,Canton,Address,Contact,Activities){
        this.TourismName =  TourismName;
        this.Province = Province;
        this.Canton = Canton;
        this.Address = Address;
        this.Contact = Contact;
        this.Activities = Activities;
    }

    get TourismName() {
        return TourismName;
    }

    set TourismName(TourismName) {
        this.TourismName = TourismName;
    }

    get Province() {
        return Province;
    }

    set Province(Province) {
        this.Province = Province;
    }

    get Canton() {
        return Canton;
    }

    set Canton(Canton) {
        this.Canton = Canton;
    }

    get Address() {
        return Address;
    }

    set Address(Address) {
        this.Address = Address;
    }

    get Contact() {
        return Contact;
    }

    set Contact(Contact) {
        this.Contact = Contact;
    }

    get Activities() {
        return Activities;
    }

    set Activities(Activities) {
        this.Activities = Activities;
    }
}