<%-- 
    Document   : showRestaurants
    Created on : 28/05/2021, 13:36:43
    Author     : WINDOWS-Sebastian
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reading Restaurants JSP</title>
    </head>
    <body>
        <%
        Connection connect = null;
        Statement s = null;
        
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" + "?user=root&password=12345");
            
            s = connect.createStatement();
            
            String SQL = "SELECT * FROM restaurant ORDER BY restaurantID ASC";
            ResultSet rec = s.executeQuery(SQL);
        %>
        <table width="600" border="1">
            <tr>
                <th><div align="center">Restaurant ID</div></th>
                <th><div align="center">Restaurant Name</div></th>
                <th><div align="center">Address</div></th>
                <th><div align="center">Description</div></th>
                <th><div align="center">Opening Time</div></th> 
                <th><div align="center">Closing Time</div></th>
                <th><div align="center">Consumption Type</div></th>
            </tr>
            <%while ((rec != null) && (rec.next())) {%>
            <tr>
                <td><div align="center"><%=rec.getString("restaurantID")%></div></td>
                <td><div align="center"><%=rec.getString("restaurantName")%></div></td>
                <td><div align="center"><%=rec.getString("restaurantAddress")%></div></td>
                <td><div align="center"><%=rec.getString("restaurantDescription")%></div></td>
                <td><div align="center"><%=rec.getString("openingTime")%></div></td>
                <td><div align="center"><%=rec.getString("closingTime")%></div></td>
                <td><div align="center"><%=rec.getString("consumptionType")%></div></td>
            </tr>
            <%}%>
        </table>
        <%
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
