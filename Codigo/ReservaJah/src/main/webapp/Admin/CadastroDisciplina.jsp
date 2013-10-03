<%-- 
    Document   : CadastroDisciplina
    Created on : 30/08/2013, 22:18:28
    Author     : Eduardo
--%>

<div id="div_mensagens" ></div>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h5 class="title">Cadastrar Disciplina</h5>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<form id="form" action="../DisciplinaServlet" method="post">
    <input type="hidden" name="id" value="${disciplinaEditar.id}"/>
    <div class="field">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" value="${disciplinaEditar.nome}"/><br />
        <p class="hint">Digite um Nome</p>
    </div><br/>
    <div class="field">
        <label for="abr">Abreviatura:</label>
        <input type="text" name="abreviatura" value="${disciplinaEditar.abreviatura}" /><br />
        <p class="hint">Digite a abreviatura da disciplina</p>
    </div><br/>
    <div class="field">
        <label for="participantes">Número de participantes:</label>
        <input type="text" id="participantes" name="participantes" value="${disciplinaEditar.numParticipantes}"/><br />
        <p class="hint">Digite o número de participantes</p>
    </div><br/><br/>
    <div class="field">
        <label for="professor">Professor Responsável:</label>
        <select name="responsavel">
            <option value="default">Selecione um bloco</option>
            <c:choose>
                <c:when test="${listaProfessores.size()!=0}">
                    <c:forEach items="${listaProfessores}" var="user">
                        <option value="${user.id}" ${disciplinaEditar.responsavel.id == user.id? "selected" :""}>${user.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option value="default">Cadastre um professor antes</option>
                </c:otherwise>
            </c:choose>
        </select>
        <p class="hint">Selecione um professor</p>
    </div><br/>
    <button type="button" onclick="voltarListarDisciplina('ListagemDisciplina.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="envia();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
        $.validator.addMethod("valueNotEquals", function(value, element, arg) {
            return arg != value;
        }, "Value must not equal arg.");
        $(function() {
            $.mask.definitions['~'] = "[+-]";
            $("#participantes").mask("?999");
        });
        $(document).ready(function() {
            $("#form").validate({
                errorLabelContainer: $('#div_mensagens'),
                rules: {
                    nome: {required: true, minlength: 3, maxlength: 50},
                    abreviatura: {required: true, minlength: 2, maxlength: 10},
                    participantes: {required: true, minlength: 1, maxlength: 4},
                    responsavel: {valueNotEquals: "default"}
                },
                messages: {
                    nome: {required: "Digite um nome para a disciplina. Ex: Linguagem de Programação", minlength: "O nome deve ter no mínimo 3 dígitos", maxlength: "O nome deve ter no máximo 50 dígitos"},
                    abreviatura: {required: "Digite uma abreviatura nome para a disciplina. Ex: LP", minlength: "O abreviatura deve ter no mínimo 2 dígitos", maxlength: "O abreviatura deve ter no máximo 10 dígitos"},
                    participantes: {required: "Digite o número de participantes da sala. Ex: 20", minlength: "Participantes tem no mínimo 1 dígito", maxlength: "Participantes tem no máximo 3 dígito"},
                    responsavel: {valueNotEquals: "Por favor selecione um responsável pela disciplina."}
                },
                submitHandler: function() {
                    cadastrarDisciplina();
                }

            });
        });
        function envia() {
            if ($('#form').valid()) {
                cadastrarDisciplina();
            }
        }
</script>