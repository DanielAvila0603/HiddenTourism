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

        <h1>RoadMap Generation</h1>
        <br><br>
        <table style = "width: 50%">
            <tr>
                <td>User ID</td>
                <%out.println("<td>" + newT.getIdTourist() + "</td>");%>
            </tr>
            <tr>
                <td>First name</td>
                <%out.println("<td>" + newT.getFirstName() + "</td>");%>
            </tr>
            <tr>
                <td>Last name</td>
                <%out.println("<td>" + newT.getLastName() + "</td>");%>
            </tr>
            <tr>
                <td>Location</td>
                <%out.println("<td>" + newT.getLocation() + "</td>");%>
            </tr>
            <tr>
                <td>Reservation date</td>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    out.println("<td>" + sdf.format(newT.getResevationDate()) + "</td>");
                %>
            </tr>
            <tr>
                <td>Payment type</td>
                <%out.println("<td>" + newT.getPaymentType() + "</td>");%>
            </tr>
            <%
                TourguideController tgc = new TourguideController();
                List<Tourguide> list = tgc.readTourguide();

                Random randomGenerator = new Random();
                int indexT = randomGenerator.nextInt(list.size());
                Tourguide rand = list.get(indexT);
            %>
            <tr>
                <td>Guide's ID</td>
                <%out.println("<td>" + rand.getIdTourguide() + "</td>");%>
            </tr>
            <tr>
                <td>Guide's First name</td>
                <%out.println("<td>" + rand.getFirstName() + "</td>");%>
            </tr>
            <tr>
                <td>Guide's Last name</td>
                <%out.println("<td>" + rand.getLastName() + "</td>");%>
            </tr>
            <%
                RestaurantController rc = new RestaurantController();
                ArrayList<Restaurant> arr = rc.readDBRestaurant();
                Restaurant randR;
                do {
                    int indexR = randomGenerator.nextInt(arr.size());
                    randR = arr.get(indexR);
                } while (!randR.getRestaurantAddress().equalsIgnoreCase(newT.getLocation()));
            %>
            <tr>
                <td>Restaurant's Name</td>
                <%out.println("<td>" + randR.getRestaurantName() + "</td>");%>
            </tr>
            <tr>
                <td>Restaurant's description</td>
                <%out.println("<td>" + randR.getRestaurantDescription() + "</td>");%>
            </tr>
            <tr>
                <td>Restaurant's compsumption type</td>
                <%out.println("<td>" + randR.getConsumptionType() + "</td>");%>
            </tr>
            <%
                PlaceController pc = new PlaceController();
                List<Place> plist = pc.readPlace();
            %>
            <tr>
                <td>Places to visit</td>
                <td>
                    <ul>
                        <%
                            for (Place p : plist) {
                                if (p.getProvince().equalsIgnoreCase(newT.getLocation())) {
                                    out.println("<li>" + p.getCanton() + ": " + p.getTourismName() + "</li>");
                                }
                            }
                        %>
                    </ul>
                </td>
            </tr>
        </table>
        <button onclick="location.href = '/index.html'">Return</button>
    </body>
</html>
