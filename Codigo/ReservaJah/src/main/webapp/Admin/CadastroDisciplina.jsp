<%-- 
    Document   : CadastroDisciplina
    Created on : 30/08/2013, 22:18:28
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
        <form action="../DisciplinaServlet" method="post">
            <div>
                <label>Nome:</label>
                <input type="text" name="nome"/><br />
            </div>
            <div>
                <label>Abreviatura</label>
                <input type="text" name="abreviatura"/><br />
            </div>
            <div>
                <label>Professor Responsável</label>
                <select name="responsavel">
                    <option value="1">Professor</option>
                </select>
            </div>
            <input type="submit" value="enviar"/>
        </form>
    </body>
</html>
