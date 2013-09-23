<%-- 
    Document   : ReservarSala
    Created on : 12/09/2013, 20:37:06
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<form id="form">
    <input type="hidden" name="idAula" value="${aulaEditar.id}"/>
    <h5 class="title">Gerenciar Aulas</h5>
    <form id="form">
        <div class="field">
            <label for="data">Data da reserva</label>
            <input type="text" name="dataInicio" id="dataInicio" value="<c:out value="${dataInicio == null ? diaInicio : dataInicio}"/>" onchange="pegaDia();"/>
            <p class="hint">Selecione uma data como parametro</p>
        </div>
        <br/>
        <div class="field">
            <label for="bloco">Bloco</label>
            <select id="bloco" name="bloco" onchange="listaSala2();">
                <c:choose>
                    <c:when test="${listaBloco.size()!=0}">
                        <option value="0">Selecione um bloco</option>
                        <c:forEach items="${listaBloco}" var="bloco">
                            <option value="${bloco.id}" ${idBloco == bloco.id? "selected" :""} >${bloco.nome}</option>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <option>Selecione o dia antes</option>
                    </c:otherwise>
                </c:choose>
            </select>
            <p class="hint">Selecione um bloco como parametro</p>
        </div>
        <br/>
        <div class="field">
            <label for="sala">Sala:</label>
            <select id="sala" name="sala" onchange="listaAulasSala2();">
                <c:choose>
                    <c:when test="${listaSalaBloco.size()!=0}">
                        <option value="0">Selecione uma sala</option>
                        <c:forEach items="${listaSalaBloco}" var="sala">
                            <option value="${sala.id}" ${idSala == sala.id? "selected" :""} >${sala.nome}</option>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <option>Cadastre uma sala neste bloco antes</option>
                    </c:otherwise>
                </c:choose>
            </select>            
            <p class="hint">Selecione uma sala como parametro</p>
        </div>
        <br/>
        <div class="field">
            <label for="disciiplina">Disciplina:</label>
            <select id="disciplina" name="disciplina" onchange="">
                <c:choose>
                    <c:when test="${listaDisciplina.size()!=0}">
                        <option value="0">Selecione uma disciplina</option>
                        <c:forEach items="${listaDisciplina}" var="disciplina" varStatus="aa">
                            <option value="${disciplina.id}" ${idD == disciplina.id? "selected" :""}>${disciplina.nome}</option>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <option>Selecione o inicio</option>
                    </c:otherwise>
                </c:choose>
            </select>
        </div>
        <div class="field">
            <label for="horaInicio">Hora inicio da reserva:</label>
            <select id="horaInicio" name="hInicio" onchange="listaNovoHorario2();">
                <c:forEach items="${horarios}" var="horario" varStatus="aa">
                    <option value="${aa.count}" ${aulaEditar.inicio == horario? "selected" :""} ${idHor == aa.count? "selected" :""}><c:out value="${horario}"/></option>
                </c:forEach>
            </select>
        </div>
        <div class="field">
            <label for="horaFim">Hora fim da reserva</label>
            <select id="horaFim" name="horaFim" onchange="mudarCor();">
                <c:choose>
                    <c:when test="${horaFim.size()!=0}">
                        <c:forEach items="${horaFim}" var="horario" varStatus="aa">
                            <option value="${aa.count}" ${aulaEditar.fim == horario? "selected" :""} ><c:out value="${horario}"/></option>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <option>Selecione o inicio</option>
                    </c:otherwise>
                </c:choose>
            </select>
        </div>
    </form>
    <table id="tabela">
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
                    <td id="<c:out value="${local.count}"/><c:out value="${aa.count}"/>">
                        <c:forEach items="${listaAulaSala}" var="aula">
                            <c:if test="${aula.inicio==horario}">
                                <c:if test="${aula.dia==dia}">
                                    <input type="hidden" name="aula" value="inicio"/>
                                </c:if>
                            </c:if>
                            <c:if test="${aula.fim==horario}">
                                <c:if test="${aula.dia==dia}">
                                    <input type="hidden" name="aula" value="fim"/>
                                </c:if>
                            </c:if> 
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <button type="button" onclick="" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarReserva();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
    $(document).ready(function() {
        var att;
        var i = 1;
        for (var j = 1; j < 18; j++) {
            att = "#" + j + i;
            if ($(att).html() != undefined) {
                if ($(att).html().match("inicio")) {
                    var aux = j;
                    $(att).css('background-color', 'red');
                    while (!$(att).html().match("fim")) {
                        aux++;
                        att = "#" + aux + i;
                        $(att).css('background-color', 'red');
                        if ($(att).html().trim() !== "") {
                            $(att).css('background-color', 'red');
                            break;
                        }
                    }
                }
            }
        }
    });

    $(function() {
        $("#dataInicio").datepicker({dateFormat: 'dd/mm/yy'});
    });

</script>
