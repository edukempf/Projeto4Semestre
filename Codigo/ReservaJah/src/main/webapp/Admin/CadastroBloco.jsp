<%-- 
    Document   : CadastroBloco
    Created on : 30/08/2013, 22:04:24
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../BlocoServlet" method="post">
            <div>
                <label>Nome:</label>
                <input type="text" name="nome"/><br />
            </div>
            <input type="submit" value="enviar"/>
        </form>
    </body>
</html>
