<%-- 
    Document   : CadastroAula
    Created on : 05/09/2013, 11:08:03
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<form id="form">
    <input type="hidden" name="idAula" value="${aulaEditar.id}"/>
    <h5 class="title">Gerenciar Aulas</h5>
    <div>
        <label>Bloco</label>
        <select id="bloco" name="bloco" onchange="listaSala();">
            <c:choose>
                <c:when test="${listaBloco.size()!=0}">
                    <option value="0">Selecione um bloco</option>
                    <c:forEach items="${listaBloco}" var="bloco">
                        <option value="${bloco.id}" ${idBloco == bloco.id? "selected" :""} ${aulaEditar.sala.blocoPertencente.id == bloco.id? "selected" :""}>${bloco.nome}</option>
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
                        <option value="${sala.id}" ${idSala == sala.id? "selected" :""} ${aulaEditar.sala.id == sala.id? "selected" :""} >${sala.nome}</option>
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
                        <option value="${disciplina.id}" ${aulaEditar.disciplina.id == disciplina.id? "selected" :""}>${disciplina.nome}</option>
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
                <option value="${aa.count}" ${aulaEditar.dia == dia? "selected" :""} ${diaSelecionado == aa.count? "selected" :""}><c:out value="${dia}"/></option>
            </c:forEach> 
        </select>
    </div>

    <div>
        <label>Data de inicio</label>
        <input type="text" name="diaInicio"id="dataInicio" value="<c:out value="${dataInicio==null?diaInicio : dataInicio}"/>"/>

        <label>Data de fim</label>
        <input type="text" name="diaFim" id="dataFim" value="<c:out value="${dataFim==null?diaFim:dataFim}"/>"/>
    </div>
    <div>
        <label>Hora inicio da aula</label>
        <select id="horaInicio" name="hInicio" onchange="listaNovoHorario();">
            <option value="0">Selicione um Horário</option>
            <c:forEach items="${horarios}" var="horario" varStatus="aa">
                <option value="${aa.count}" ${aulaEditar.inicio == horario? "selected" :""} ${idHor == aa.count? "selected" :""}><c:out value="${horario}"/></option>
            </c:forEach>
        </select>
        <label>Hora fim da aula</label>
        <select id="horaFim" name="horaFim" onchange="mudarCor();">
            <option value="0">Selicione um Horário</option>
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
    <button type="button" onclick="voltarListarAula('ListagemAula.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarAula();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
            $(document).ready(function() {
                var att;
                for (var i = 1; i < 7; i++) {
                    for (var j = 1; j < 18; j++) {
                        att = "#" + j + i;
                        if ($(att).html().trim()) {
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
                $("#dataFim").datepicker({dateFormat: 'dd/mm/yy'});
            });
</script>