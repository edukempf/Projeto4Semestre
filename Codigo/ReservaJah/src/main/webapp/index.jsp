<%-- 
    Document   : index
    Created on : 21/08/2013, 02:10:20
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <script language="javascript" src="../js/jquery-1.10.2.min.js"></script>
        <script language="javascript" src="../js/projeto.js"></script>
    </head>
    <body>
        <div>
            <form action="LoginServlet" method="post">
            <label>Login</label>
            <input type="text" name="login" />
            <label>Senha</label>
            <input type="text" name="senha" />
            <input type="submit" value="login"/>
            </form>
            <br />
            
            <label><c:out value="${erro}"/></label>
        </div>
    </body>
</html>
