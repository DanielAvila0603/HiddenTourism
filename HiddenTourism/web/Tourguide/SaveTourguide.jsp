<%-- 
    Document   : SaveTourguide
    Created on : 22-jun-2021, 16:32:25
    Author     : SEBASTIAN
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="ec.espe.edu.model.Tourguide"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Save Tourguide</title>
    </head>
    <body>
        <h1>Save Tourguide!</h1>
         <%
            Tourguide tourguide = new Tourguide();
            Connection connect = null;
            Statement sqlStatement = null;
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
                connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/hiddentourism" + "?user=root&password=12345");
                String consult = "INSERT INTO tourguide (idTourguide,firstName,lastName) VALUES (?,?,?)";
                
                tourguide.setIdTourguide(request.getParameter("idTourguide")) ;
                tourguide.setFirstName(request.getParameter("firstName"));
                tourguide.setLastName(request.getParameter("lastName"));
                PreparedStatement sentencia= connect.prepareStatement(consult);
             
                sentencia.setString(1, tourguide.getIdTourguide());
                sentencia.setString(2, tourguide.getFirstName());
                sentencia.setString(3, tourguide.getLastName());
                

                sentencia.executeUpdate();
                
            } catch (Exception e) {
                out.println(e.getMessage());
                out.println("Stack in the catch -> " + e.toString());
                e.printStackTrace();
            }
        %>
        <a href="ShowTourguide.jsp">View Data</a>
    </body>
</html>
