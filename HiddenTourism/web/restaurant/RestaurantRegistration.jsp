<%-- 
    Document   : restaurantJSP
    Created on : 26/05/2021, 13:17:32
    Author     : Sebastian Alvarez Los Angularios ESPE-DCCO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Registration</title>
    </head>
    <body>
        <h1>RESTAURANT REGISTRATION</h1>
        <form action = "saveRestaurant.jsp" method = "POST">
            <table style = "width: 50%">
                <tr>
                    <td>Restaurant Name</td>
                    <td><input type="text" name="restaurantName"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="restaurantAddress"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="restaurantDescription"></td>
                </tr>
                <tr>
                    <td>Restaurant Schedule</td>
                    <td>
                        <p>Opening time<input type="time" name="openingTime"></p>
                        <p>Closing time <input type="time" name="closingTime"></p>
                    </td>
                </tr>
                <tr>
                    <td>Type of consumption</td>
                    <td>
                        <input type="checkbox" name="toServeConsumption"/> To serve<br>
                        <input type="checkbox" name="toGoConsumption"/> To go<br>
                        <input type="checkbox" name="contactlessDeliveryConsumption"/> Contactless delivery<br>
                    </td>
                </tr>
            </table><br>
            <input type="submit" value="Save"/>
            <input type="reset" value="Reset"/>
        </form>
    </body> 
</html>
