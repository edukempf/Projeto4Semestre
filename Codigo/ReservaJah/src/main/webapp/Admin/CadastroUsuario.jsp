<%-- 
    Document   : CadastroUsuario
    Created on : 23/08/2013, 21:51:49
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<form id="form" action="../UsuariosServlet" method="post">
    <input type="hidden" name="id" value="${usuarioEditar.id}"/>
    <div class="field">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" value="${usuarioEditar.nome}"/><br />
<p class="hint">Digite o nome</p>
    </div><br/>
    <div class="field">
        <label for="senha">Senha:</label>
        <input type="text" name="senha"/><br />
        <p class="hint">Digite a senha</p>
    </div><br/>
    <div class="field">
        <label for="email">Email:</label>
        <input type="text" name="email" value="${usuarioEditar.email}"/><br />
        <p class="hint">Digite o e-mail</p>
    </div><br/>
    <div class="field">
        <label for="TUsuario">Tipo de Usuário:</label>
        <select name="tipo">
            <c:choose>
                <c:when test="${listaTipoUsuario.size()!=0}">
                    <c:forEach items="${listaTipoUsuario}" var="tipo">
                        <option value="${tipo.id}" ${usuarioEditar.tipo.id == tipo.id? "selected" :""}>${tipo.descricao}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Cadastre um tipo de usuário antes</option>
                </c:otherwise>
            </c:choose>
        </select>
        <p class="hint">Selecione o tipo de Usu&aacute;rio</p>
    </div><br/>
    <div class="field">
        <label for="RA">Registro Acadêmico:</label>
        <input type="text" name="registro" value="${usuarioEditar.registro}"/><br />    
    <p class="hint">Digite o RA</p>
    </div>
    <button type="button" onclick="voltarListarUsuario('ListagemUsuario.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarUsuario();" value="" class="btnConfirmar">Confirmar</button>
</form>