<%-- 
    Document   : placesRegistration
    Created on : may 26, 2021, 1:09:21 p.m.
    Author     : Nayeli Arellano The Angularians ESPE-DCCO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Touristic Registration</title>
    </head>
    <body>
        <h1>Registration of the Tourist Place</h1>
        <form action="savePlaces.jsp" method="POST">
            <table style="with: 50%">
                <tr>
                    <td>Name of the Tourist Place</td>
                    <td><input type="text" name="tourismName"/></td>
                </tr>
                <tr>
                    <td>Name of the Province where it is Located</td>
                    <td><input type="text" name="province"/></td>
                </tr>
                <tr>
                    <td>Name of the Canton where it is Located</td>
                    <td><input type="text" name="canton"/></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address"/></td>
                </tr>
                <tr>
                    <td>Contact Number</td>
                    <td><input type="text" name="contact"/></td>
                </tr>
                <tr>
                    <td>Activities you Can Do</td>
                    <td>
                        <input type="checkbox" name="fishing" checked=""/>Fishing<br>
                        <input type="checkbox" name="swim" checked=""/>Swim<br>
                        <input type="checkbox" name="climbing" checked=""/>Climbing<br>
                    </td>
                </tr>
            </table> 
            <input type="submit" values="Save"/>
            <input type="reset" values="Empty Fields"/>
        </form>    
    </body>
</html>
