<%-- 
    Document   : ListagemTipoUsuario
    Created on : 04/09/2013, 09:32:46
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Tipos de Sala</h5>
<table id="lista">
    <tr>
        <th>Descrição</th>
    </tr>
    <c:choose>
        <c:when test="${listaTipoUsuario.size()!=0}">
            <c:forEach items="${listaTipoUsuario}" var="tipo">
                <tr>
                    <td><c:out value="${tipo.descricao}"/></td>
                    <td><a class="modificar" onclick="editarTipoUsuario(<c:out value="${tipo.id}"/>);"><img src="../img/alterar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarTipoUsuario(<c:out value="${tipo.id}"/>);"><img src="../img/delete.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhum tipo de usuário cadastrado</td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
<button type="button" onclick="telaCadastroTipoUsuario();" value="" class="btnAdicionar">Adicionar</button>
