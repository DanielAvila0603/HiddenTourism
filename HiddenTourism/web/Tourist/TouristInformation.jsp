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
        <title>Reading Patient JSP</title>
    </head>
    <body>
        <%
            Connection connect = null;
            Statement sqlStatement = null;

            try {
              Class.forName("com.mysql.jdbc.Driver");

                connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/hiddentourism" + "?user=root&password=mayonesa23");

                sqlStatement = connect.createStatement();
                String sql = "SELECT * FROM tourist";

                ResultSet rec = sqlStatement.executeQuery(sql);
        %>
        <table width="800" border="1">
            <tr>
                <th width="91"><div align="center">ID Tourist</div></th>
                <th width="91"><div align="center">First Name</div></th>
                <th width="91"><div align="center">Last Name</div></th>
                <th width="91"><div align="center">Location</div></th>
                <th width="91"><div align="center">Reservation Date</div></th>
                <th width="91"><div align="center">Payment Type</div></th>
            </tr>
            
            <%while ((rec != null) && (rec.next())) {%>
            <tr>
                <td><div align="center"><%=rec.getString("IdTourist")%></div></td>
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
