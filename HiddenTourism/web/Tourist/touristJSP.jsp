<%-- 
    Document   : touristJSP
    Created on : 26/05/2021, 13:14:08
    Author     : Daniel Avila Los Angularios ESPE-DCCO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tourist Registration</title>
    </head>
    <body>
        <h1>TOURIST REGISTER</h1>
        <form action = "saveTourist.jsp" method = "GET">
            <table style = "width: 50%">
                <tr>
                    <td>Id Tourist</td>
                    <td><input type = "text" name = "IdTourist"/></td>
                </tr>               
                <tr>
                    <td>First Name</td>
                    <td><input type = "text" name = "firstName"/></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type = "text" name = "lastName"/></td>
                </tr>
                <tr>
                    <td>Location</td>
                    <td><input type = "text" name = "location"/></td>
                </tr>
                
                <tr>
                    <td>Reservation Date</td>
                    <td><input type="date" name="reservationDate" min="2021-01-01" max="2021-12-31"/></td>
                </tr>
                
                <tr>
                    <td>Payment type</td>
                    <td>
                        <input type = "checkbox" name = "cash" check = "checked"/> Cash <br>
                        <input type = "checkbox" name = "creditCard" check = "checked"/> Credit Card <br>
                        <input type = "checkbox" name = "debitCard" check = "checked"/> Debit Card <br>
                    </td>
                </tr>
            </table>
            <input type = "submit" value = "Save"/>
            <input type = "reset" value = "Empty Fields"/>
        </form>
    </body> 
</html>
