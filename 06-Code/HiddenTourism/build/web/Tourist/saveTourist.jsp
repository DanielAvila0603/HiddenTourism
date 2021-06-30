<%-- 
    Document   : saveTourist
    Created on : 26/05/2021, 13:38:19
    Author     : Daniel
--%>
<%@page import="ec.espe.edu.model.Place"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ec.espe.edu.controller.PlaceController"%>
<%@page import="ec.espe.edu.model.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ec.espe.edu.controller.RestaurantController"%>
<%@page import="ec.espe.edu.model.Tourguide"%>
<%@page import="java.util.List"%>
<%@page import="ec.espe.edu.controller.TourguideController"%>
<%@page import="ec.espe.edu.controller.TouristController"%>
<%@page import="ec.espe.edu.model.Tourist"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <title>TOURIST SAVING</title>
    </head>
    <body>
        <%
            String idTourist = request.getParameter("idTourist");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String location = request.getParameter("location");
            String reservationDate = request.getParameter("reservationDate");
            String cash = request.getParameter("cash");
            String creditCard = request.getParameter("creditCard");
            String debitCard = request.getParameter("debitCard");

            String paymentType = "";

            if (cash != null) {
                paymentType += "cash, ";
            }

            if (creditCard != null) {
                paymentType += "credit card, ";
            }

            if (debitCard != null) {
                paymentType += "debit card";
            }

            if (paymentType.endsWith(", ")) {
                paymentType = paymentType.substring(0, paymentType.length() - 2);
            }

            Tourist newT = new Tourist(
                    idTourist,
                    firstName,
                    lastName,
                    location,
                    new SimpleDateFormat("yyyy-MM-dd").parse(reservationDate),
                    paymentType
            );

            TouristController tc = new TouristController();
            tc.saveInDB(newT);
        %>

        <div class="alert alert-success" role="alert">
            <b>BIEN HECHO!</b> Los datos se guardaron exitosamente.
        </div>
        <button type="button" class="btn btn-primary" onclick="location.href = '/index.html'">Return</button>
    </body>
</html>