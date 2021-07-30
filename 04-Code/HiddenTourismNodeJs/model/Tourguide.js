class Tourguide {
    constructor(){
        this.idTourguide ="";
        this.firstName="";
        this.lastName="";

    }

    constructor(idTourguide, firstName, lastName){
        this.idTourguide=idTourguide;
        this.firstName=firstName;
        this.lastName=lastName;    
    }

    get idTourguide(){
        return this.idTourguide;
    }

    set idTourguide(nidTourguide){
        this.idTourguide=nidTourguide;
    }

    get firstName(){
        return this.firstName;
    }

    set firstName(nfirstName){
        this.firstName=nfirstName;
    }

    get lastName(){
        return this.lastName;
    }

    set lastName(nlastName){
        this.lastName=nlastName;
    }
}