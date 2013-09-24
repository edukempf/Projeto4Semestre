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
        <link href="../css/table_jui.css" rel="stylesheet" type="text/css" />
        <link href="../css/colorbox.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
        <script language="javascript" src="../js/jquery-1.10.2.min.js"></script>
        <script language="javascript" src="../js/jquery.min.js"></script>
        <script language="javascript" src="../js/jquery-ui.js"></script>
        <script language="javascript" src="../js/jQueryValidate.js"></script>
        <script language="javascript" src="../js/jquery.maskedinput.min.js"></script>
        <script language="javascript" src="../js/jquery.dataTables.min.js"></script>
        <script language="javascript" src="../js/jquery.colorbox-min.js"></script>
        <script language="javascript" src="../js/projeto.js"></script>
    </head>
    <body>
        <div id="menu-lateral">
            <ul id="menu">
                <li><a id="reservaSala" href="ReservarSala.jsp"> Reservar Sala</a></li>
                <li><a id="minhasReservas" href="../ReservaServlet?op=listar"> Minhas Reservas</a></li>
                <li><a id="consultar" href=""> Consultar Salas</a></li>
                <li><a id="sair" href="../LoginServlet?op=sair"> Sair</a></li>
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
        <div class="modal"></div>
    </body>
</html>