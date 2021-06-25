<%-- 
    Document   : touristJSP
    Created on : 26/05/2021, 13:14:08
    Author     : Daniel Avila Los Angularios ESPE-DCCO
--%>

<%@page import="ec.edu.espe.places.model.Place"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ec.espe.edu.controller.PlaceController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <title>Tourist Registration</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body class="touristBody">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="well well-sm">
                        <form action="saveTourist.jsp" method="POST">
                            <br><br>
                            <fieldset>
                                <h1 class="text-center header">TOURIST REGISTRATION</h1>
                                <br>
                                <div class="form-group">
                                    <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                    <div class="col-md-8"><br>
                                        <input id="id" name="idTourist" type="number" placeholder="ID" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                    <div class="col-md-8"><br>
                                        <input id="fname" name="firstName" type="text" placeholder="First Name" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                    <div class="col-md-8"><br>
                                        <input id="lname" name="lastName" type="text" placeholder="Last Name" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-envelope-o bigicon"></i></span>
                                    <div class="col-md-8"><br>


                                        <select name="location" class="form-control">
                                            <option value="Select" selected>Select</option>
                                            <%
                                                PlaceController pc = new PlaceController();
                                                List<Place> list = pc.readPlace();
                                      
                                                for (Place place : list) {
                                                    out.println("<option value=\"" + place.getProvince() + "\">" + place.getProvince() + "</option>");
                                                }
                                            %>
                                        </select>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-phone-square bigicon"></i></span>
                                    <div class="col-md-8"><br>
                                        <input id="reservationDate" name="reservationDate" type="date" placeholder="Reservation Date" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
                                    <div class="col-md-8"><br><br>
                                        <p><b>Payment type</b></p>
                                        <p>
                                            <input type = "checkbox" name = "cash"/> Cash <br>
                                            <input type = "checkbox" name = "creditCard"/> Credit Card <br>
                                            <input type = "checkbox" name = "debitCard"/> Debit Card <br>
                                        </p>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-12 text-center"><br>
                                        <input type="submit" class="btn btn-success" value="Submit">
                                        <br><br>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body> 
</html>