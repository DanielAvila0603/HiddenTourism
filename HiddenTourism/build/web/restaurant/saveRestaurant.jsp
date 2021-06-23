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
        <title>Restaurant Saving</title>
    </head>
    <body>
        <h1>RESTAURANT SAVING</h1>
        Method --> 
        <%
            String method = request.getMethod();
            out.println(method);
        %>   
        <hr>
        <ul>
            <li><p><b>Restaurant Name: </b><%=request.getParameter("restaurantName")%></p></li>
            <li><p><b>Address: </b><%=request.getParameter("restaurantAddress")%></p></li>
            <li><p><b>Description: </b><%=request.getParameter("restaurantDescription")%></p></li>
            <li>
                <p><b>Schedule: </b></p>
                <p>Opening Time: <%=request.getParameter("openingTime")%></p>
                <p>Closing Time: <%=request.getParameter("closingTime")%></p>
            </li>
            <li><p><b>Consumption Type: </b></p>
                <p>To serve: <%=request.getParameter("toServeConsumption")%></p>
                <p>To go: <%=request.getParameter("toGoConsumption")%></p>
                <p>Contactless Delivery: <%=request.getParameter("contactlessDeliveryConsumption")%></p>
            </li>
        </ul>
            
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
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdb" + "?user=root&password=56793640");
            
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
            out.println("<br><hr><p><b>PROCESSED SQL: </b>" + SQL + "</p>");
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
    </body>
</html>

