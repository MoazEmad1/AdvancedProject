<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="backNoWork.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- this code clears the cache of your browser and also kills the session -->
        <%
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Expires", "0");
            response.setDateHeader("Expires", -1);
            session.invalidate();
        %>
        You Successfully logged out , close the page or return to <a href="HomePage.jsp">Home Page</a>
    </body>
</html>