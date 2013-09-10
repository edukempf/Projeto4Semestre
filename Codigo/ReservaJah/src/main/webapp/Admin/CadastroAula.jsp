<%-- 
    Document   : CadastroAula
    Created on : 05/09/2013, 11:08:03
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<form id="form">
    <h5 class="title">Gerenciar Aulas</h5>
    <div>
        <label>Bloco</label>
        <select id="bloco" name="bloco" onchange="listaSala();">
            <c:choose>
                <c:when test="${listaBloco.size()!=0}">
                    <option value="0">Selecione um bloco</option>
                    <c:forEach items="${listaBloco}" var="bloco">
                        <option value="${bloco.id}" ${idBloco == bloco.id? "selected" :""}>${bloco.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Cadastre um bloco antes</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <div>
        <label>Sala</label>
        <select id="sala" name="sala" onchange="listaAulasSala();">
            <c:choose>
                <c:when test="${listaSalaBloco.size()!=0}">
                    <option value="0">Selecione uma sala</option>
                    <c:forEach items="${listaSalaBloco}" var="sala">
                        <option value="${sala.id}" ${idSala == sala.id? "selected" :""}>${sala.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Cadastre uma sala neste bloco antes</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <div>
        <label>Disciplina:</label>
        <select id="disciplina" name="disciplina" onchange="">
        <c:choose>
                <c:when test="${disciplinas.size()!=0}">
                    <c:forEach items="${disciplinas}" var="disciplina" varStatus="aa">
                        <option value="${disciplina.id}">${disciplina.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Selecione o inicio</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <div>
        <label>Dia da semana da aula</label>
        <select id="dia" name="dia" onchange="setaColuna();">
            <c:forEach items="${dias}" var="dia" varStatus="aa">
                <option value="${aa.count}" ${diaSelecionado == aa.count? "selected" :""}><c:out value="${dia}"/></option>
            </c:forEach> 
        </select>
    </div>
    <div>
        <label>Hora inicio da aula</label>
        <select id="horaInicio" name="hInicio" onchange="listaNovoHorario();">
            <c:forEach items="${horarios}" var="horario" varStatus="aa">
                <option value="${aa.count}" ${idHor == aa.count? "selected" :""}><c:out value="${horario}"/></option>
            </c:forEach>
        </select>
    </div>
    <div>
        <label>Hora fim da aula</label>
        <select id="horaFim" name="horaFim" onchange="mudarCor();">
            <c:choose>
                <c:when test="${horaFim.size()!=0}">
                    <c:forEach items="${horaFim}" var="horario" varStatus="aa">
                        <option value="${aa.count}">${horario}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option>Selecione o inicio</option>
                </c:otherwise>
            </c:choose>
        </select>
    </div>
    <div>
        <label>Dia inicio aula</label>
        <input type="text" name="diaInicio"/>
    </div>
    <div>
        <label>Dia fim aula</label>
        <input type="text" name="diaFim"/>
    </div>
    <table>
        <c:forEach items="${horarios}" var="horario" varStatus="local">
            <c:if test="${local.count<2}">
                <tr>
                    <td></td>
                    <c:forEach items="${dias}" var="dia">
                        <td><c:out value="${dia}"/></td>
                    </c:forEach>
                </tr>
            </c:if>
            <tr>
                <td><c:out value="${horario}"/></td>
                <c:forEach items="${dias}" var="dia" varStatus="aa">
                    <td id="<c:out value="${local.count}"/><c:out value="${aa.count}"/>"></td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <button type="button" onclick="voltarListarAula('ListagemAula.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarAula();" value="" class="btnConfirmar">Confirmar</button>
</form>