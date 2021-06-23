<%-- 
    Document   : serverInformation
    Created on : 28/05/2021, 12:57:00
    Author     : WINDOWS-Sebastian
--%>

<%@page import="ec.edu.espe.controller.RestaurantController"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Server Information</title>
    </head>
    <body>
         <h2>HTTP Request Headers</h2>
        <hr>
        <table border = "1">
            <tr bgcolor = "#949494">
                <th>Header Key</th>
                <th>Header Value</th>
            </tr>
                <%
                    RestaurantController restaurantController = new RestaurantController();
                    Map map = restaurantController.getHeadersInfo(request);

                    Iterator<Integer> itrk = map.keySet().iterator();
                    Iterator<String> itrva = map.values().iterator();
                    while (itrk.hasNext()) {

                        out.println("<tr>");
                        out.println("<td>");
                        out.println(itrk.next());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(itrva.next());
                        out.println("</td>");
                        out.println("</tr>");
                    }
                %>
        </table>
    </body>
</html>
