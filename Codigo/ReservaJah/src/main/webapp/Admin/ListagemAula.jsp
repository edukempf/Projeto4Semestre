<%-- 
    Document   : ListagemAula
    Created on : 05/09/2013, 10:12:11
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<h5 class="title">Gerenciar Aula</h5>
<table id="lista">
    <tr>
        <th>Disciplina</th>
        <th>Sala</th>
        <th>Bloco</th>
        <th>Inicio</th>
        <th>Fim</th>
    </tr>
    <c:choose>
        <c:when test="${listaAula.size()!=0}">
            <c:forEach items="${listaAula}" var="aula">
                <tr>
                    <td><c:out value="${aula.disciplina.nome}"/></td>
                    <td><c:out value="${aula.sala.nome}"/></td>
                    <td><c:out value="${aula.sala.blocoPertencente.nome}"/></td>
                    <td><c:out value="${aula.inicio}"/></td>
                    <td><c:out value="${aula.fim}"/></td>
                    <td><a class="modificar" onclick="editarAula(<c:out value="${aula.id}"/>);"><img src="../img/editar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarAula(<c:out value="${aula.id}"/>);"><img src="../img/apagar.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhuma aula cadastrada</td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
<button type="button" onclick="telaCadastroAula();" value="" class="btnAdicionar">Adicionar</button>