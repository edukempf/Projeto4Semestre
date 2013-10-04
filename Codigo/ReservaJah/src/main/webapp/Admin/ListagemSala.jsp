<%-- 
    Document   : ListagemSala
    Created on : 04/09/2013, 10:54:36
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Salas</h5>
<table id="listaElementos">
    <thead>
        <tr>
            <th>Descrição</th>
            <th>Bloco</th>
            <th>Capacidade</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </thead>
    <c:choose>
        <c:when test="${listaSala.size()!=0}">
            <c:forEach items="${listaSala}" var="sala">
                <tr>
                    <td><c:out value="${sala.nome}"/></td>
                    <td><c:out value="${sala.blocoPertencente.nome}"/></td>
                    <td><c:out value="${sala.capacidade}"/></td>
                    <td><a class="modificar" onclick="editarSala(<c:out value="${sala.id}"/>);"><img src="../img/alterar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarSala(<c:out value="${sala.id}"/>);"><img src="../img/delete.png"/></a></td>
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
            <th>Descrição</th>
            <th>Bloco</th>
            <th>Capacidade</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </tfoot>
</table>
<button type="button" onclick="telaCadastroSala();" value="" class="btnAdicionar">Adicionar</button>
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
        alert("Sala excluida com sucesso.");
    </script>
    <c:remove var="sucessoExcluir"/>
</c:if>
<c:if test="${erroExcluir}">
    <script type="text/javascript">
        alert("Você não pode excluir está sala, certifique-se que ela não está sendo utilizada por alguma outra tarefa do sistema.");
    </script>
    <c:remove var="erroExcluir"/>
</c:if>