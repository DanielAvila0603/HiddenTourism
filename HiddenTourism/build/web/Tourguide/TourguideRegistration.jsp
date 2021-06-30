<%-- 
    Document   : FormTourguide
    Created on : 22-jun-2021, 16:19:46
    Author     : SEBASTIAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <title>Tourguide</title>
    </head>
    <body>
        <h1>Tourguide</h1>
        <form action = "SaveTourguide.jsp" method ="POST">
            <table style="with: 50%">
                <tr>
                    <td>Ci:</td>
                    <td><input type="text" name="idTourguide"/></td>
                </tr>
                <tr>
                    <td>First Name </td>
                    <td><input type="text" name="firstName"/></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lastName"/></td>
                </tr>
            </table>
            <input type="submit" value="Save"/>
            <input type="reset" value="Empty Fields"/>
        </form>
    </body>
</html>
