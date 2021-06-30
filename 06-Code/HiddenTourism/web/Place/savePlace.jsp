<%-- 
    Document   : savePlaces.jsp
    Created on : may 26, 2021, 1:38:19 p.m.
    Author     : Nayeli
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <title>savePlace</title>
    </head>
    <body>
        <h1>SAVING TOURIST PLACE</h1>
        
        We are using the method-> POST POST
        
        <%
            String method = request.getMethod();
        %>
        
        <ul>
            <li>
                <p><b>Name of the Tourist Place: </b>
                    <%=request.getParameter("tourismName")%>
                </p>
            </li>
            <li>
                <p><b>Name of the Province where it is Located: </b>
                    <%=request.getParameter("province")%>
                </p>
            </li>
            <li>
                <p><b>Name of the Canton where it is Located: </b>
                    <%=request.getParameter("canton")%>
                </p>
            </li>
            <li>
                <p><b>Address: </b>
                    <%=request.getParameter("address")%>
                </p>
            </li>
            <li>
                <p><b>Contact Number: </b>
                    <%=request.getParameter("contact")%>
                </p>
            </li>
            <li>
                <p><b>Fishing: </b>
                    <%=request.getParameter("fishing")%>
                </p>
            </li>
            <li>
                <p><b>Swim: </b>
                    <%=request.getParameter("swim")%>
                </p>
            </li>
            <li>
                <p><b>Climbing: </b>
                    <%=request.getParameter("climbing")%>
                </p>
            </li>
        </ul>
       
        <hr>
        <h2>HTTP param requests, i.e., every value in the form</h2>
        <table width="100%" border="1">
            <tr bcolor="909090">
                <th> Parameter Name</th>
                <th>Parameter Value(s)</th>
            </tr>
            <%
                Enumeration paramNames = request.getParameterNames(); 
                while(paramNames.hasMoreElements()){
                    String paramName = (String) paramNames.nextElement();
                    out.println("<tr><td>" + paramName + "</td>" );
                    String paramValue = (String) request.getParameter(paramName);
                    out.println("<td>" + paramValue + "</td></tr>" );
                }
            %>
        </table>
        <br>
              
    </body>
</html>
