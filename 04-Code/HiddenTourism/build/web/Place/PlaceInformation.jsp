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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Place Information</title>
    </head>
    <body>
        <%
        Connection connect = null;
        Statement s = null;
        
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" 
                    + "?user=root&password=12345");
            
            s = connect.createStatement();
            
            String SQL = "SELECT * FROM places ORDER BY TourismName ASC";
            ResultSet rec = s.executeQuery(SQL);
        %>
        <h1>Place Information</h1>
        <table class="table table-hover table-dark">
            <thread>
                <tr>
                    <th scope="col"><div align="center">Name of the Tourism</div></th>
                    <th scope="col"><div align="center">Province</div></th>
                    <th scope="col"><div align="center">Canton</div></th>
                    <th scope="col"><div align="center">Address</div></th>
                    <th scope="col"><div align="center">Contact</div></th> 
                    <th scope="col"><div align="center">Activities</div></th>
                </tr>
            </thread>
            <%while ((rec != null) && (rec.next())) {%>
            <tr>
                <td scope="row"><div align="center"><%=rec.getString("TourismName")%></div></td>
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
