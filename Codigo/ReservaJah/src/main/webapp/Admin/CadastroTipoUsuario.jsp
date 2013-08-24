<%-- 
    Document   : CadastroTipoUsuario
    Created on : 23/08/2013, 21:53:49
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
        <form action="../TipoUsuarioServlet" method="post">
            <div>
                <label>Descrição:</label>
                <input type="text" name="descricao" min="3" max="50"/><br />
                <input type="submit" value="enviar"/>
            </div>
        </form>
    </body>
</html>
