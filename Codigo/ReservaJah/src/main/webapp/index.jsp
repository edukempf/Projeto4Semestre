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
        <div id="page">
            <div id="header" align="center">
                <form id="login" name="login" action="LoginServlet" method="post">
                    <label>
                        Login:
                        <input type="text" name="login" maxlength="45" value=""  />
                    </label>
                    <label>
                        Senha:
                        <input type="password" name="senha" maxlength="45" value=""  />
                    </label>
                    <input type="submit" value="login"/>
                </form>
                <br />

                <label><c:out value="${erro}"/></label>

            </div>
            <div id="content" align="center">
                <div id="conteudo" align="center"></div>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <a href="ConsultarSala.jsp"><img src="img/botaoHorarios.jpg" alt=""></a>
            </div>
        </div>
        <div id="rodape">
            <p><span>ReservaJAH.com</span>&copy 2013. Todos os direitos reservados</p>
        </div>
    </body>
</html>
