<%-- 
    Document   : ListagemSala
    Created on : 04/09/2013, 10:54:36
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Salas</h5>
<table id="lista">
    <tr>
        <th>Descrição</th>
        <th>Bloco</th>
        <th>Capacidade</th>
    </tr>
    <c:choose>
        <c:when test="${listaSala.size()!=0}">
            <c:forEach items="${listaSala}" var="sala">
                <tr>
                    <td><c:out value="${sala.nome}"/></td>
                    <td><c:out value="${sala.blocoPertencente.nome}"/></td>
                    <td><c:out value="${sala.capacidade}"/></td>
                    <td><a class="modificar" onclick="editarSala(<c:out value="${sala.id}"/>);"><img src="../img/editar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarSala(<c:out value="${sala.id}"/>);"><img src="../img/apagar.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhuma sala cadastrada</td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
<button type="button" onclick="telaCadastroSala();" value="" class="btnAdicionar">Adicionar</button>