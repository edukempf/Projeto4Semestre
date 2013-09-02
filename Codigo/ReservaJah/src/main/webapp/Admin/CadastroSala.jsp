<%-- 
    Document   : CadastroSala
    Created on : 02/09/2013, 09:32:13
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../SalaServlet" method="post">
            <div>
                <label>Nome:</label>
                <input type="text" name="nome"/><br />
            </div>
            <div>
                <label>Capacidade:</label>
                <input type="text" name="capacidade"/><br />
            </div>
            <div>
                <label>Tipo de Sala</label>
                <select name="tipo">
                    <option value="1">Didatica</option>
                </select>
            </div>
            <div>
                <label>Bloco</label>
                <select name="bloco">
                    <option value="1">Bloco E</option>
                </select>
            </div>
            <input type="submit" value="enviar"/>
        </form>
    </body>
</html>
