<%-- 
    Document   : ListagemTipoUsuario
    Created on : 04/09/2013, 09:32:46
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Tipos de Sala</h5>
<table id="listaElementos">
    <thead>
        <tr>
            <th>Descrição</th>
            <th>Editar</th>
                        <th>Remover</th>
        </tr>
    </thead>
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
                <td></td>
                <td></td>
            </tr>
        </c:otherwise>
    </c:choose>
    <tfoot>
        <tr>
            <th>Descrição</th>
            <th>Editar</th>
                        <th>Remover</th>
        </tr>
    </tfoot>
</table>
<button type="button" onclick="telaCadastroTipoUsuario();" value="" class="btnAdicionar">Adicionar</button>
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
        alert("Tipo de usuário excluido com sucesso.");
    </script>
    <c:remove var="sucessoExcluir"/>
</c:if>
<c:if test="${erroExcluir}">
    <script type="text/javascript">
        alert("Você não pode excluir este tipo de usuário, certifique-se que ele não está sendo utilizado por alguma outra tarefa do sistema.");
    </script>
    <c:remove var="erroExcluir"/>
</c:if>