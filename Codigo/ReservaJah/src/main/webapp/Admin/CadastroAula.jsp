<%-- 
    Document   : CadastroAula
    Created on : 05/09/2013, 11:08:03
    Author     : eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<div id="div_mensagens" ></div>
<form id="form">
    <input type="hidden" name="idAula" value="${aulaEditar.id}"/>
    <h5 class="title">Gerenciar Aulas</h5>
    <div class="field">
        <label for="bloco">Bloco:</label>
        <select id="bloco" name="bloco" onchange="listaSala();">
            <c:choose>
                <c:when test="${listaBloco.size()!=0}">
                    <option value="default">Selecione um bloco</option>
                    <c:forEach items="${listaBloco}" var="bloco">
                        <option value="${bloco.id}" ${idBloco == bloco.id? "selected" :""} ${aulaEditar.sala.blocoPertencente.id == bloco.id? "selected" :""}>${bloco.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option value="default">Cadastre um bloco antes</option>
                </c:otherwise>
            </c:choose>
        </select>
        <p class="hint">Selecione um bloco como parametro da consulta</p>
    </div><br/>
    <div class="field">
        <label for="sala">Sala:</label>
        <select id="sala" name="sala" onchange="">
            <c:choose>
                <c:when test="${listaSalaBloco.size()!=0}">
                    <option value="default">Selecione uma sala</option>
                    <c:forEach items="${listaSalaBloco}" var="sala">
                        <option value="${sala.id}" ${idSala == sala.id? "selected" :""} ${aulaEditar.sala.id == sala.id? "selected" :""} >${sala.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option value="default">Cadastre uma sala neste bloco antes</option>
                </c:otherwise>
            </c:choose>
        </select>
        <p class="hint">Selecione uma sala como parametro da consulta</p>
    </div><br/>
    <div class="field">
        <label for="diaInicio">Data de inicio:</label>
        <input type="text" name="diaInicio"id="dataInicio" onchange="listaAulasSala();" value="<c:out value="${dataInicio==null?diaInicio : dataInicio}"/>"/>


        <label for="diaFim">Data de fim:</label>
        <input type="text" name="diaFim" id="dataFim" value="<c:out value="${dataFim==null?diaFim:dataFim}"/>"/>
    </div><br/>
    <div class="field">
        <label for="disciplina">Disciplina:</label>
        <select id="disciplina" name="disciplina" onchange="">
            <option value="default">Selecione uma disciplina</option>
            <c:choose>
                <c:when test="${disciplinas.size()!=0}">
                    <c:forEach items="${disciplinas}" var="disciplina" varStatus="aa">
                        <option value="${disciplina.id}" ${aulaEditar.disciplina.id == disciplina.id? "selected" :""} ${idDisciplina == disciplina.id? "selected" :""}>${disciplina.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option value="0">Cadastre uma disciplina antes.</option>
                </c:otherwise>
            </c:choose>
        </select>
        <p class="hint">Selecione uma disciplina como parametro da consulta</p>
    </div><br/>
    <div class="field">
        <label for="dia">Dia da semana:</label>
        <select id="dia" name="dia" onchange="setaColuna();">
            <c:forEach items="${dias}" var="dia" varStatus="aa">
                <option value="${aa.count}" ${aulaEditar.dia == dia? "selected" :""} ${diaSelecionado == aa.count? "selected" :""}><c:out value="${dia}"/></option>
            </c:forEach> 
        </select>
        <p class="hint">Selecione o dia da semana da aula</p>
    </div><br/>
    <div class="field">
        <label for="horaInicio">Hora inicio da aula:</label>
        <select id="horaInicio" name="hInicio" onchange="listaNovoHorario();">
            <option value="default">Selicione um Horário:</option>
            <c:forEach items="${horarios}" var="horario" varStatus="aa">
                <option value="${aa.count}" ${aulaEditar.inicio == horario? "selected" :""} ${idHor == aa.count? "selected" :""}><c:out value="${horario}"/></option>
            </c:forEach>
        </select>
        <p class="hint">Selecione um horario como parametro da consulta</p>
        <label for="horaFim">Hora fim da aula:</label>
        <select id="horaFim" name="horaFim" onchange="mudarCor();">
            <option value="default">Selicione um Horário</option>
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
        <p class="hint">Selecione um horario como parametro da consulta</p>
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
                                    <c:if test="${aula.status}">
                                        <input type="hidden" name="aula" value="inicio"/>
                                    </c:if>
                                    <c:if test="${!aula.status}">
                                        <input type="hidden" name="reserva" value="inicio"/>
                                    </c:if>
                                </c:if>
                            </c:if>
                            <c:if test="${aula.fim==horario}">
                                <c:if test="${aula.dia==dia}">
                                    <c:if test="${aula.status}">
                                        <input type="hidden" name="aula" value="fim"/>
                                    </c:if>
                                    <c:if test="${!aula.status}">
                                        <input type="hidden" name="reserva" value="fim"/>
                                    </c:if>
                                </c:if>
                            </c:if> 
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <table>
        <tr>
            <td>Aula fixa:</td>
            <td style="background-color: red;width: 15px"></td>
            <td>Reserva:</td>
            <td style="background-color: green; width: 15px"></td>
            <td>Horario Selecionado no momento:</td>
            <td style="background-color: blue;width: 15px"></td>
        </tr>
    </table>
    <button type="button" onclick="voltarListarAula('ListagemAula.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="envia();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
            $(function() {
                $.mask.definitions['~'] = "[+-]";
                $("#dataInicio").mask('99/99/9999');
                $("#dataFim").mask('99/99/9999');
            });
            $.validator.addMethod("valueNotEquals", function(value, element, arg) {
                return arg != value;
            }, "Value must not equal arg.");
            $(document).ready(function() {
                var att;
                for (var i = 1; i < 7; i++) {
                    for (var j = 1; j < 18; j++) {
                        att = "#" + j + i;
                        if ($(att).html().match("inicio")) {
                            var aux = j;
                            var cor = '';
                            if ($(att).html().match("aula"))
                                cor = 'red';
                            if ($(att).html().match("reserva"))
                                cor = 'green';
                            $(att).css('background-color', cor);
                            while (!$(att).html().match("fim")) {
                                aux++;
                                att = "#" + aux + i;
                                $(att).css('background-color', cor);
                                if ($(att).html().trim() !== "") {
                                    $(att).css('background-color', cor);
                                    break;
                                }
                            }
                        }
                    }
                }
                $("#form").validate({
//                    errorLabelContainer: $('#div_mensagens'),
                    rules: {
                        bloco: {valueNotEquals: "default"},
                        sala: {valueNotEquals: "default"},
                        disciplina: {valueNotEquals: "default"},
                        dia: {valueNotEquals: "default"},
                        horaFim: {valueNotEquals: "default"},
                        hInicio: {valueNotEquals: "default"},
                        diaInicio: {required: true},
                        diaFim: {required: true}
                    },
                    messages: {
                        bloco: {valueNotEquals: "Por favor selecione um Bloco"},
                        sala: {valueNotEquals: "Por favor selecione uma sala"},
                        disciplina: {valueNotEquals: "Por favor selecione uma disciplina"},
                        dia: {valueNotEquals: "Por favor selecione o dia da semana"},
                        horaFim: {valueNotEquals: "Por favor selecione o horario inicial"},
                        hInicio: {valueNotEquals: "Por favor selecione o horario final"},
                        diaInicio: {required: "Informe a data inicial."},
                        diaFim: {required: "Informe a data final."}
                    },
                    submitHandler: function() {
                        cadastrarAula();
                    }

                });
            });

            $(function() {
                $("#dataInicio").datepicker({dateFormat: 'dd/mm/yy'});
                $("#dataFim").datepicker({dateFormat: 'dd/mm/yy'});
            });
            function envia() {
                if ($('#form').valid()) {
                    cadastrarAula();
                }
            }
</script>