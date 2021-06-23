<%-- 
    Document   : saveTourist
    Created on : 26/05/2021, 13:38:19
    Author     : Daniel
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TOURIST SAVING</title>
    </head>
    <body>
        <h1>TOURIST SAVING</h1>
        We are using the method-->
        <%=request.getMethod()%>
        <%
            String method = request.getMethod();
            out.println(method);
        %>

        <ul>
            <li><p><b>Id Tourist:</b><%=request.getParameter("IdTourist")%></p></li>
            <li><p><b>First Name:</b><%=request.getParameter("firstName")%></p></li>
            <li><p><b>Last Name:</b><%=request.getParameter("lastName")%></p></li>
            <li><p><b>Location:</b><%=request.getParameter("location")%></p></li>
            <li><p><b>Reservation Date:</b><%=request.getParameter("reservationDate")%></p></li>
            <li><p><b>Cash:</b><%= request.getParameter("Cash")%></p></li>
            <li><p><b>Credit Card:</b><%= request.getParameter("Credit Card")%></p></li>
            <li><p><b>Debit Card:</b><%= request.getParameter("Debit Card")%></p></li>
            
        </ul>
           
                <hr>
<h2>HTTP param requests, i.e., every value in the form</h2>
        <table border="1">
            <tr bgcolor="#909090">
                <th>Parameter Name</th>
                <th>Parameter Value(s)</th>
            </tr>
            <%
              Enumeration paramNames = request.getParameterNames();
              while(paramNames.hasMoreElements()){
                String paramName = (String)paramNames.nextElement();
                out.println("<tr><td>" + paramName + "</td>\n");
                String paramValue = request.getParameter(paramName);
                out.println("<td>" + paramValue + "</td></tr>");
              }
            %>
        </table>            
    </ul>    
    </body>
</html>
