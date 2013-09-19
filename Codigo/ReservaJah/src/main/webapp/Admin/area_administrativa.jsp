<%-- 
    Document   : area_administrativa
    Created on : 03/09/2013, 09:06:23
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/estilo01.css">
        <link rel="stylesheet" type="text/css" href="../css/jquery-ui.css">
        <script language="javascript" src="../js/jquery-1.10.2.min.js"></script>
        <script language="javascript" src="../js/jquery-ui.js"></script>
        <script language="javascript" src="../js/projeto.js"></script>
    </head>
    <body>
        <div id="menu-lateral">
            <ul id="menu">
                <li><a id="listaAula" href="../AulaServlet?op=listar"> Gerenciar Aulas</a></li>
                <li><a id="listaBlocos" href="../BlocoServlet?op=listar"> Gerenciar Blocos</a></li>
                <li><a id="listaDisciplina" href="../DisciplinaServlet?op=listar"> Gerenciar Disciplinas</a></li>
                <li><a id="listaSala" href="../SalaServlet?op=listar"> Gerenciar Salas</a></li>
                <li><a id="listaTipoSala" href="../TipoSalaServlet?op=listar"> Gerenciar Tipos de Sala</a></li>
                <li><a id="listaTipoUsuario" href="../TipoUsuarioServlet?op=listar"> Gerenciar Tipos de Usuários</a></li>
                <li><a id="listaUsuario" href="../UsuariosServlet?op=listar"> Gerenciar Usuários</a></li>
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