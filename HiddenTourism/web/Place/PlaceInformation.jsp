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
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            
            Connection connect = null; 
            Statement stm = null; 
            PreparedStatement preparedStatement;
            
            try{
                Class.forName("org.mariadb.jdbc.Driver");
                    
                connect=DriverManager.getConnection("jdbc:maria://localhost/hiddentourismdata"+
                        "?user=root&password=12345");

                preparedStatement = connect.prepareStatement("INSERT INTO places values(?,?,?,?,?,?,?)");
                preparedStatement.setString(1, request.getParameter("NULL"));
                preparedStatement.setString(2, request.getParameter("TourismName"));
                preparedStatement.setString(3, request.getParameter("Province"));
                preparedStatement.setString(4, request.getParameter("Canton"));
                preparedStatement.setString(5, request.getParameter("Address"));
                preparedStatement.setString(6, request.getParameter("Contact"));
                preparedStatement.setString(7, request.getParameter("Activities"));
                preparedStatement.executeUpdate();
                stm = connect.createStatement();
                
                String sql = "SELECT * FROM places ORDER BY TourismName";
                ResultSet rec= stm.executeQuery(sql);
         %>
         
         <table wifth="500" border="1">
             <tr><th width="90"><div align="center">ID Place</div></th>
                 <th width="90"><div align="center">Name of the Tourist Place</div></th>
                 <th width="90"><div align="center">Province</div></th>
                 <th width="90"><div align="center">Canton</div></th>
                 <th width="97"><div align="center">Address</div></th>
                 <th width="63"><div align="center">Phone Contact</div></th>
                 <th width="80"><div align="center">Activities you can Do </div></th>
             </tr>
             <%while((rec!=null)&&(rec.next())){%>
             <tr>
                 <td><div align="center"><%=rec.getString("PlacecId")%></div></td>
                 <td><div ><%=rec.getString("TourismName")%></div></td>
                 <td><div align="center"><%=rec.getString("Province")%></div></td>
                 <td><div align="center"><%=rec.getString("Canton")%></div></td>
                 <td><div align="center"><%=rec.getString("Address")%></div></td>
                 <td><div align="center"><%=rec.getString("Contact")%></div></td>
                 <td><div align="center"><%=rec.getString("Activities")%></div></td>                 
             </tr>
             <%}%>
         </table>
        <%
            }catch (Exception e){
                out.println(e.getMessage());
                out.println("stack in the catch = "+e.toString());
                e.printStackTrace();
            }
            
            try{
                if(stm != null){
                    stm.close();
                    connect.close();
                }
            }catch(SQLException e){
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>
