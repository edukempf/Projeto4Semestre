<%-- 
    Document   : ListagemDisciplina
    Created on : 04/09/2013, 13:27:14
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Disciplinas</h5>
<table id="lista">
    <tr>
        <th>Nome</th>
        <th>Responsável</th>
        <th>Participantes</th>
    </tr>
    <c:choose>
        <c:when test="${listaDisciplina.size()!=0}">
            <c:forEach items="${listaDisciplina}" var="disciplina">
                <tr>
                    <td><c:out value="${disciplina.nome}"/></td>
                    <td><c:out value="${disciplina.responsavel.nome}"/></td>
                    <td><c:out value="${disciplina.numParticipantes}"/></td>
                    <td><a class="modificar" onclick="editarDisciplina(<c:out value="${disciplina.id}"/>);"><img src="../img/editar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarDisciplina(<c:out value="${disciplina.id}"/>);"><img src="../img/apagar.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhuma disciplina cadastrada</td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
<button type="button" onclick="telaCadastroDisciplina();" value="" class="btnAdicionar">Adicionar</button>
