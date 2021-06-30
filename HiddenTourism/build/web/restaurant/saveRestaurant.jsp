<%-- 
    Document   : saveRestaurant
    Created on : 26/05/2021, 13:38:19
    Author     : Sebastian Alvarez Los Angularios ESPE-DCCO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <title>Restaurant Saving</title>
    </head>
    <body> 
        <%
        Connection connect = null;
        Statement s = null;
        
        String restaurantName = request.getParameter("restaurantName");
        String restaurantAddress = request.getParameter("restaurantAddress");
        String restaurantDescription = request.getParameter("restaurantDescription");
        String openingTime = request.getParameter("openingTime");
        String closingTime = request.getParameter("closingTime");
        String toServe = request.getParameter("toServeConsumption");
        String toGo = request.getParameter("toGoConsumption");
        String contactlessDelivery = request.getParameter("contactlessDeliveryConsumption");
        
        String consumptionType = "";
        
        if(toServe != null){
            consumptionType += "to serve, ";
        }
        
        if(toGo != null){
            consumptionType += "to go, ";
        }
        
        if(contactlessDelivery != null){
            consumptionType += "contactless delivery";
        }
        
        if(consumptionType.endsWith(", ")){
            consumptionType = consumptionType.substring(0, consumptionType.length()-2);
        }
            
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" + "?user=root&password=12345");
            
            s = connect.createStatement();
            
            String getMAXSQL = "SELECT MAX(restaurantID) FROM restaurant";
            
            ResultSet rec = s.executeQuery(getMAXSQL);
            rec.next();
            int maxID = Integer.parseInt(rec.getString("MAX(restaurantID)"));
            String nrestaurantID;
            
            if(maxID+1 <= 9){
                nrestaurantID = "000" + (maxID+1);
            } else if(maxID+1 <= 99){
                nrestaurantID = "00" + (maxID+1);
            } else {
                nrestaurantID = "0" + (maxID+1);
            }
            
            String SQL = "INSERT INTO restaurant VALUES ('" 
                    + nrestaurantID + "', '"
                    + restaurantName + "', '"
                    + restaurantAddress + "', '"
                    + restaurantDescription + "', '"
                    + openingTime + "', '"
                    + closingTime + "', '"
                    + consumptionType + "'"
                    + ")";
            
            SQL = SQL.replaceAll("'", "\"");
            s.executeQuery(SQL);
            
            }catch(Exception e){
                out.println(e.getMessage());
                out.println("Stack in the catch --> "+e.toString());
                e.printStackTrace();
            }
            
            try {
                if (s != null) {
                    s.close();
                    connect.close();
                }
            } catch (SQLException e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
        <h1>Ingresado con exito!</h1>
        <button onclick="location.href='/index.html'">Regresar</button>
    </body>
</html>

