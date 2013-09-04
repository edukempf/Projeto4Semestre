<%-- 
    Document   : CadastroDisciplina
    Created on : 30/08/2013, 22:18:28
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<form id="form" action="../DisciplinaServlet" method="post">
    <input type="hidden" name="id" value="${disciplinaEditar.id}"/>
    <div>
        <label>Nome:</label>
        <input type="text" name="nome" value="${disciplinaEditar.nome}"/><br />
    </div>
    <div>
        <label>Abreviatura</label>
        <input type="text" name="abreviatura" value="${disciplinaEditar.abreviatura}" /><br />
    </div>
    <div>
        <label>Número de participantes</label>
        <input type="text" name="participantes" value="${disciplinaEditar.numParticipantes}"/><br />
    </div>
    <div>
        <label>Professor Responsável</label>
        <select name="responsavel">
            <c:choose>
                <c:when test="${listaProfessores.size()!=0}">
                    <c:forEach items="${listaProfessores}" var="user">
                        <option value="${user.id}" ${disciplinaEditar.responsavel.id == user.id? "selected" :""}>${user.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Cadastre um professor antes</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <button type="button" onclick="voltarListarDisciplina('ListagemDisciplina.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarDisciplina();" value="" class="btnConfirmar">Confirmar</button>
</form>