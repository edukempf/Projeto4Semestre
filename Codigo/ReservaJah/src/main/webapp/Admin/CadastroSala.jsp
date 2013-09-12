<%-- 
    Document   : CadastroSala
    Created on : 02/09/2013, 09:32:13
    Author     : eduardo
--%>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<form id='form' action="../SalaServlet" method="post">
    <input type="hidden" name="id" value="${salaEditar.id}"/>
    <div>
        <label>Nome:</label>
        <input type="text" name="nome" value="${salaEditar.nome}"/><br />
    </div>
    <div>
        <label>Capacidade:</label>
        <input type="text" name="capacidade" value="${salaEditar.capacidade}"/><br />
    </div>
    <div>
        <label>Tipo de Sala</label>
        <select name="tipo">
            <c:choose>
                <c:when test="${listaTipoSala.size()!=0}">
                    <c:forEach items="${listaTipoSala}" var="tipo">
                        <option value="${tipo.id}" ${salaEditar.tipoSala.id == tipo.id? "selected" :""}>${tipo.descricao}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Cadastre um tipo de sala antes</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <div>
        <label>Bloco</label>
        <select name="bloco">
            <c:choose>
                <c:when test="${listaBloco.size()!=0}">
                    <c:forEach items="${listaBloco}" var="bloco">
                        <option value="${bloco.id}" ${salaEditar.blocoPertencente.id == bloco.id? "selected" :""}>${bloco.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Cadastre um bloco antes</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <button type="button" onclick="voltarListarSala('ListagemSala.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarSala();" value="" class="btnConfirmar">Confirmar</button>
</form>