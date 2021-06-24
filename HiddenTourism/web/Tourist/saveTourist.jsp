<%-- 
    Document   : saveTourist
    Created on : 26/05/2021, 13:38:19
    Author     : Daniel
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <title>TOURIST SAVING</title>
    </head>
    <body>
        <%
        Connection connect = null;
        Statement s = null;
        
        String idTourist = request.getParameter("idTourist");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String location = request.getParameter("location");
        String reservationDate = request.getParameter("reservationDate");
        String cash = request.getParameter("cash");
        String creditCard = request.getParameter("creditCard");
        String debitCard = request.getParameter("debitCard");
        
        String paymentType = "";
        
        if(cash != null){
            paymentType += "cash, ";
        }
        
        if(creditCard != null){
            paymentType += "credit card, ";
        }
        
        if(debitCard != null){
            paymentType += "debit card";
        }
        
        if(paymentType.endsWith(", ")){
            paymentType = paymentType.substring(0, paymentType.length()-2);
        }
            
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" + "?user=root&password=12345");
            
            s = connect.createStatement();
            
            String SQL = "INSERT INTO tourist VALUES ('" 
                    + idTourist + "', '"
                    + firstName + "', '"
                    + lastName + "', '"
                    + location + "', '"
                    + reservationDate + "', '"
                    + paymentType + "'"
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
