<%-- 
    Document   : TouristInformation
    Created on : 29/05/2021, 0:18:19
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Tourist Information</title>
    </head>
    <body>
        <%
            Connection connect = null;
            Statement sqlStatement = null;

            try {
                Class.forName("org.mariadb.jdbc.Driver");

                connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" 
                        + "?user=root&password=12345");

                sqlStatement = connect.createStatement();
                String sql = "SELECT * FROM tourist";

                ResultSet rec = sqlStatement.executeQuery(sql);
        %>
        <h1>Tourist Information</h1>
        <table class="table table-hover table-dark">
            <thread>
                <tr>
                    <th scope="col"><div align="center">ID Tourist</div></th>
                    <th scope="col"><div align="center">First Name</div></th>
                    <th scope="col"><div align="center">Last Name</div></th>
                    <th scope="col"><div align="center">Location</div></th>
                    <th scope="col"><div align="center">Reservation Date</div></th>
                    <th scope="col"><div align="center">Payment Type</div></th>
                </tr>
            </tread>
            <%while ((rec != null) && (rec.next())) {%>
            <tr>
                <td scope="row"><div align="center"><%=rec.getString("IdTourist")%></div></td>
                <td><div align="center"><%=rec.getString("FirstName")%></div></td>
                <td><div align="center"><%=rec.getString("LastName")%></div></td>
                <td><div align="center"><%=rec.getString("Location")%></div></td>
                <td><div align="center"><%=rec.getString("ReservationDate")%></div></td>
                <td><div align="center"><%=rec.getString("PaymentType")%></div></td>
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
            } catch (SQLException e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>
