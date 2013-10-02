<%-- 
    Document   : ListagemBlocos
    Created on : 03/09/2013, 09:10:25
    Author     : eduardo
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<h5 class="title">Gerenciar Blocos</h5>
<table id="listaElementos">
    <thead>
        <tr>
            <th>Nome</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </thead>
    <c:choose>
        <c:when test="${listaBloco.size()!=0}">
            <c:forEach items="${listaBloco}" var="bloco">
                <tr>
                    <td><c:out value="${bloco.nome}"/></td>
                    <td><a class="modificar" onclick="editarBloco(<c:out value="${bloco.id}"/>);"><img src="../img/alterar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarBloco(<c:out value="${bloco.id}"/>);"><img src="../img/delete.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhum bloco cadastrado</td>
                <td></td>
                <td></td>
            </tr>
        </c:otherwise>
    </c:choose>
    <tfoot>
        <tr>
            <th>Nome</th>
            <th>Editar</th>
            <th>Remover</th>
        </tr>
    </tfoot>
</table>
<button type="button" onclick="telaCadastroBloco();" value="" class="btnAdicionar">Adicionar</button>
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
        alert("Bloco excluido com sucesso.");
    </script>
    <c:remove var="sucessoExcluir"/>
</c:if>
<c:if test="${erroExcluir}">
    <script type="text/javascript">
        alert("Você não pode excluir este bloco, certifique-se que ele não está sendo utilizado por alguma outra tarefa do sistema.");
    </script>
    <c:remove var="erroExcluir"/>
</c:if>
