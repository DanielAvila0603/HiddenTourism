<%-- 
    Document   : showTourism
    Created on : may 29, 2021, 4:25:58 p.m.
    Author     : Nayeli
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <title>Place Information</title>
    </head>
    <body>
        <%
        Connection connect = null;
        Statement s = null;
        
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" + "?user=root&password=12345");
            
            s = connect.createStatement();
            
            String SQL = "SELECT * FROM places ORDER BY TourismName ASC";
            ResultSet rec = s.executeQuery(SQL);
        %>
        <table width="600" border="1">
            <tr>
                <th><div align="center">Name of the Tourism</div></th>
                <th><div align="center">Province</div></th>
                <th><div align="center">Canton</div></th>
                <th><div align="center">Address</div></th>
                <th><div align="center">Contact</div></th> 
                <th><div align="center">Activities</div></th>
            </tr>
            <%while ((rec != null) && (rec.next())) {%>
            <tr>
                <td><div align="center"><%=rec.getString("TourismName")%></div></td>
                <td><div align="center"><%=rec.getString("Province")%></div></td>
                <td><div align="center"><%=rec.getString("Canton")%></div></td>
                <td><div align="center"><%=rec.getString("Address")%></div></td>
                <td><div align="center"><%=rec.getString("Contact")%></div></td>
                <td><div align="center"><%=rec.getString("Activities")%></div></td>
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
