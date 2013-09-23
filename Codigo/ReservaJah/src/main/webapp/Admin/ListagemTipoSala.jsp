<%-- 
    Document   : ListagemTipoSala
    Created on : 04/09/2013, 09:32:28
    Author     : eduardo
--%>
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
        <c:when test="${listaTipoSala.size()!=0}">
            <c:forEach items="${listaTipoSala}" var="tipo">
                <tr>
                    <td><c:out value="${tipo.descricao}"/></td>
                    <td><a class="modificar" onclick="editarTipoSala(<c:out value="${tipo.id}"/>);"><img src="../img/alterar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarTipoSala(<c:out value="${tipo.id}"/>);"><img src="../img/delete.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhum tipo de sala cadastrado</td>
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
<button type="button" onclick="telaCadastroTipoSala();" value="" class="btnAdicionar">Adicionar</button>
<script type="text/javascript">
                        $(document).ready(function() {
                            $('#listaElementos').dataTable({
                                "bScrollCollapse": true,
                                "bPaginate": true,
                                "bJQueryUI": true
                            });
                        });
</script>