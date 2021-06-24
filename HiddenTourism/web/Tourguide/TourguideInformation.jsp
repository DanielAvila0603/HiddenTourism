<%-- 
    Document   : ShowTourguide
    Created on : 22-jun-2021, 16:33:40
    Author     : SEBASTIAN
--%>

<%@page import="ec.espe.edu.controller.TourguideController"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <title>Tourguides Information</title>
    </head>
    <body>
        <%
            Connection connect = null;
            Statement sqlStatement = null;
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" + "?user=root&password=12345");
                sqlStatement = connect.createStatement();
                String sql = "SELECT * FROM tourguide";
                ResultSet rec = sqlStatement.executeQuery(sql);
        %>
        <table width="600" border="1">
            <tr>
                <th><div align="center">CI</div></th>
                <th><div align="center">First Name</div></th>
                <th><div align="center">Last Name</div></th>
            </tr>
            <%while ((rec != null) && (rec.next())) {%>
            <tr>
                <td><div align="center"><%=rec.getString("idTourguide")%></div></td>
                <td><div align="center"><%=rec.getString("firstName")%></div></td>
                <td><div align="center"><%=rec.getString("lastName")%></div></td>
          
            </tr>
            <%}%>
        </table>
        <%
            } catch (Exception e) {
                out.println(e.getMessage());
                out.println("Stack in the catch -> " + e.toString());
                e.printStackTrace();
            }
            try {
                if (sqlStatement != null) {
                    sqlStatement.close();
                }
            } 
            catch (SQLException e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
//           TourguideController tourguideController = new TourguideController();
//            out.println(patientController.calculateCostQuotes( request.getParameter("idPatient")));
        %>
    </body>
</html>
