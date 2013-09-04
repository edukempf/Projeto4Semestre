<%-- 
    Document   : ListagemBlocos
    Created on : 03/09/2013, 09:10:25
    Author     : eduardo
--%>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<h5 class="title">Gerenciar Blocos</h5>
<table id="lista">
    <tr>
        <th>Nome</th>
    </tr>
    <c:choose>
        <c:when test="${listaBloco.size()!=0}">
            <c:forEach items="${listaBloco}" var="bloco">
                <tr>
                    <td><c:out value="${bloco.nome}"/></td>
                    <td><a class="modificar" onclick="editarBloco(<c:out value="${bloco.id}"/>);"><img src="../img/editar.png"/></a></td>
                    <td><a class="modificar" onclick="apagarBloco(<c:out value="${bloco.id}"/>);"><img src="../img/apagar.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhum bloco cadastrado</td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
<button type="button" onclick="telaCadastroBloco();" value="" class="btnAdicionar">Adicionar</button>

