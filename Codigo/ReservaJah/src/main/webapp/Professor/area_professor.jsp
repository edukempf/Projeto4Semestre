<%-- 
    Document   : area_professor
    Created on : 11/09/2013, 20:29:18
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/estilo01.css">
        <script language="javascript" src="../js/jquery-1.10.2.min.js"></script>
        <script language="javascript" src="../js/projeto.js"></script>
    </head>
    <body>
        <div id="menu-lateral">
            <ul id="menu">
                <li><a id="reservaSala" href="../TipoUsuarioServlet?op=listar"> Reservar Sala</a></li>
                <li><a id="minhasReservas" href="../UsuariosServlet?op=listar"> Gerenciar Usuários</a></li>
            </ul>
        </div>
        <div id="page">
            <div id="header"></div>

            <div id="content">
                <div id="conteudo">


                </div>

            </div>
            <div id="rodape">
                <p><span>ReserveJAH.com</span>&copy 2013. Todos os direitos reservados</p>
            </div>
        </div>
    </body>
</html>