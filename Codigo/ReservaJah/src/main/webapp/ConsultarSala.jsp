<%-- 
    Document   : ConsultarSalas
    Created on : 12/09/2013, 20:36:41
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta de Sala</title>
        <link rel="stylesheet" type="text/css" href="css/estilo01.css">
        <link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
        <script language="javascript" src="js/jquery-1.10.2.min.js"></script>
        <script language="javascript" src="js/jquery-ui.js"></script>
        <script language="javascript" src="js/projeto.js"></script>
        <script>
            $(function() {
                $.ajax({
                    url: 'ConsultaServlet?op=bloco',
                    type: 'GET',
                    beforeSend: function(ret) {
                        $('.modal').show();
                    },
                    success: function(ret) {
                        $('.modal').hide();
                    }
                });
            });
        </script>
    </head>
    <body>
        <div id="menu-lateral">
            <ul id="menu">
                <c:choose>
                    <c:when test="${user.tipo.descricao eq 'Professor'}">
                        <li><a href="Professor/area_professor.jsp"> Area administrativa</a></li>
                        <li><a href="#"> Consultar Salas</a></li>
                        <li><a id="sair" href="LoginServlet?op=sair"> Sair</a></li>
                    </c:when>
                    <c:when test="${user.tipo.descricao eq 'Admin'}">
                        <li><a href="Admin/area_administrativa.jsp"> Area administrativa</a></li>
                        <li><a href="#"> Consultar Salas</a></li>
                        <li><a id="sair" href="LoginServlet?op=sair"> Sair</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="index.jsp"> Fazer Login</a></li>
                        <li><a href="#"> Consultar Salas</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <div id="page">
            <div id="header"></div>

            <div id="content">
                <div id="conteudo">
                    <h5 class="title">Pesquisar</h5><br/>
                    <form id="form">
                        <div class="field">
                            <label for="data">Data da consulta</label>
                            <input type="text" name="dataInicio" id="dataInicio" value="<c:out value="${dataInicio == null ? diaInicio : dataInicio}"/>" onchange="pegaDia2();"/>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="bloco">Bloco:</label>
                            <select id="bloco" name="bloco" onchange="listaSala3();">
                                <c:choose>
                                    <c:when test="${listaBloco.size()!=0}">
                                        <option value="0">Selecione um bloco</option>
                                        <c:forEach items="${listaBloco}" var="bloco">
                                            <option value="${bloco.id}" ${idBloco == bloco.id? "selected" :""} ${aulaEditar.sala.blocoPertencente.id == bloco.id? "selected" :""}>${bloco.nome}</option>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <option>Selecione o dia antes</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <p class="hint">Escolha o Bloco de sua Prefer&ecirc;ia</p>
                        </div>
                        <br/>
                        <div class="field">
                            <label for="sala">Sala:</label>
                            <select id="sala" name="sala" onchange="listaAulasSala3();">
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
                            <p class="hint">Escolha a Sala</p>
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
                                                    <c:if test="${aula.status}">
                                                        <input type="hidden" name="aula" value="inicio"/>
                                                    </c:if>
                                                    <c:if test="${!aula.status}">
                                                        <input type="hidden" name="reserva" value="inicio"/>
                                                    </c:if>
                                                    <c:out value="${aula.disciplina.nome}" /> - <c:out value="${aula.disciplina.responsavel.nome}" />
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
                        </tr>
                    </table>
                    <script>
            $(document).ready(function() {
                var att;
                var i = 1;
                for (var j = 1; j < 18; j++) {
                    att = "#" + j + i;
                    if ($(att).html() != undefined) {
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
            });

            $(function() {
                $("#dataInicio").datepicker({dateFormat: 'dd/mm/yy'});
            });

                    </script>
                </div>
            </div>
        </div>
        <div id="rodape">
            <p><span>ReservaJAH.com</span>&copy 2013. Todos os direitos reservados</p>
        </div>
        <div class="modal"></div>s
    </body>
</html>
