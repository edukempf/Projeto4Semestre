<%-- 
    Document   : ListagemUsuario
    Created on : 04/09/2013, 11:21:54
    Author     : eduardo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Usuários</h5>
<table id="listaElementos">
    <thead>
        <tr>
            <th>Nome</th>
            <th>Tipo</th>
            <th>email</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </thead>
    <c:choose>
        <c:when test="${listaUsuario.size()!=0}">
            <c:forEach items="${listaUsuario}" var="user">
                <tr>
                    <td><c:out value="${user.nome}"/></td>
                    <td><c:out value="${user.tipo.descricao}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><a class="modificar" onclick="editarUsuario(<c:out value="${user.id}"/>);"><img src="../img/alterar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarUsuario(<c:out value="${user.id}"/>);"><img src="../img/delete.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhuma sala cadastrada</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </c:otherwise>
    </c:choose>
    <tfoot>
        <tr>
            <th>Nome</th>
            <th>Tipo</th>
            <th>email</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </tfoot>
</table>
<button type="button" onclick="telaCadastroUsuario();" value="" class="btnAdicionar">Adicionar</button>
<script type="text/javascript">
    $(document).ready(function() {
        $('#listaElementos').dataTable({
            "bScrollCollapse": true,
            "bPaginate": true,
            "bJQueryUI": true
        });
    });
</script>
<c:if test="${sucessoExcluir}">
    <script type="text/javascript">
        alert("Usuário excluido com sucesso.");
    </script>
    <c:remove var="sucessoExcluir"/>
</c:if>
<c:if test="${erroExcluir}">
    <script type="text/javascript">
        alert("Você não pode excluir este usuário, certifique-se que ele não está sendo utilizado por alguma outra tarefa do sistema.");
    </script>
    <c:remove var="erroExcluir"/>
</c:if>