<%-- 
    Document   : ListagemDisciplina
    Created on : 04/09/2013, 13:27:14
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Disciplinas</h5>
<table id="listaElementos">
    <thead>
        <tr>
            <th>Nome</th>
            <th>Responsável</th>
            <th>Participantes</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </thead>
    <c:choose>
        <c:when test="${listaDisciplina.size()!=0}">
            <c:forEach items="${listaDisciplina}" var="disciplina">
                <tr>
                    <td><c:out value="${disciplina.nome}"/></td>
                    <td><c:out value="${disciplina.responsavel.nome}"/></td>
                    <td><c:out value="${disciplina.numParticipantes}"/></td>
                    <td><a class="modificar" onclick="editarDisciplina(<c:out value="${disciplina.id}"/>);"><img src="../img/alterar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarDisciplina(<c:out value="${disciplina.id}"/>);"><img src="../img/delete.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhuma disciplina cadastrada</td>
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
            <th>Responsável</th>
            <th>Participantes</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </tfoot>
</table>
<button type="button" onclick="telaCadastroDisciplina();" value="" class="btnAdicionar">Adicionar</button>
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
        alert("Disciplina excluida com sucesso.");
    </script>
    <c:remove var="sucessoExcluir"/>
</c:if>
<c:if test="${erroExcluir}">
    <script type="text/javascript">
        alert("Você não pode excluir está disciplina, certifique-se que ela não está sendo utilizada por alguma outra tarefa do sistema.");
    </script>
    <c:remove var="erroExcluir"/>
</c:if>