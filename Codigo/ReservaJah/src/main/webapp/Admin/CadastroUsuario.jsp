<%-- 
    Document   : CadastroUsuario
    Created on : 23/08/2013, 21:51:49
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
        <form action="../UsuariosServlet" method="post">
            <div>
                <label>Nome:</label>
                <input type="text" name="nome"/><br />
            </div>
            <div>
                <label>Email:</label>
                <input type="text" name="email"/><br />
            </div>
            <div>
                <label>Tipo de Usuario</label>
                <select name="tipo">
                    <option value="1">Professor</option>
                </select>
            </div>
            <div>
                <label>Registro Acadêmico:</label>
                <input type="text" name="registro"/><br />
            </div>
                <input type="submit" value="enviar"/>
        </form>
    </body>
</html>
