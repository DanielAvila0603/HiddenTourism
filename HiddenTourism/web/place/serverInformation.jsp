<%-- 
    Document   : serverInformation
    Created on : may 28, 2021, 1:02:44 p.m.
    Author     : Nayeli
--%>


<%@page import="ec.edu.espe.controller.TourismController"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HTTP request headers</title>
    </head>
    <body>
        <h1>HTTP Request Headers</h1>
        <hr>
        <table border = "1">
            <tr bgcolor = "#949494">
                <th>Header Key</th>
                <th>Header Value</th>
            </tr>
            <tr>
                <%
                    TourismController tourism=new TourismController();
                    Map map = tourism.getHeadersInfo(request);

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
