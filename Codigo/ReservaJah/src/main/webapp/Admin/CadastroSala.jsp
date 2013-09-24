<%-- 
    Document   : CadastroSala
    Created on : 02/09/2013, 09:32:13
    Author     : eduardo
--%>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<form id='form' action="../SalaServlet" method="post">
    <input type="hidden" name="id" value="${salaEditar.id}"/>
    <div class="field">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" value="${salaEditar.nome}"/><br />
        <p class="hint">Digite o nome</p>
    </div><br/>
    <div class="field">
        <label for="capacidade">Capacidade:</label>
        <input type="text" id="capacidade" name="capacidade" value="${salaEditar.capacidade}"/><br />
        <p class="hint">Digite a capacidade
    </div><br/>
    <div class="field">
        <label for="tSala">Tipo de Sala:</label>
        <select name="tipo">
            <c:choose>
                <c:when test="${listaTipoSala.size()!=0}">
                    <option value="default">Selecione um tipo de sala</option>
                    <c:forEach items="${listaTipoSala}" var="tipo">
                        <option value="${tipo.id}" ${salaEditar.tipoSala.id == tipo.id? "selected" :""}>${tipo.descricao}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option value="default">Cadastre um tipo de sala antes</option>
                </c:otherwise>
            </c:choose>
        </select>
        <p class="hint">Selecione o tipo de sala</p>
    </div><br/>
    <div class="field">
        <label for="bloco">Bloco:</label>
        <select name="bloco">
            <c:choose>
                <c:when test="${listaBloco.size()!=0}">
                    <option value="default">Selecione um bloco</option>
                    <c:forEach items="${listaBloco}" var="bloco">
                        <option value="${bloco.id}" ${salaEditar.blocoPertencente.id == bloco.id? "selected" :""}>${bloco.nome}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option value="default">Cadastre um bloco antes</option>
                </c:otherwise>
            </c:choose>
        </select>
        <p class="hint">Selecione um bloco</p>
    </div><br/>
    <button type="button" onclick="voltarListarSala('ListagemSala.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="envia();" value="" class="btnConfirmar">Confirmar</button>
</form>
<div id="div_mensagens" ></div>
<script>
        $.validator.addMethod("valueNotEquals", function(value, element, arg) {
            return arg != value;
        }, "Value must not equal arg.");
        $(function() {
            $.mask.definitions['~'] = "[+-]";
            $("#capacidade").mask("?9999");
        });
        $(document).ready(function() {
            $("#form").validate({
                errorLabelContainer: $('#div_mensagens'),
                rules: {
                    nome: {required: true, minlength: 3, maxlength: 50},
                    capacidade: {required: true, minlength: 1, maxlength: 4},
                    bloco: {valueNotEquals: "default"},
                    tipo: {valueNotEquals: "default"}
                },
                messages: {
                    nome: {required: "Digite um nome para a sala. Ex: 001", minlength: "O nome deve ter no mínimo 3 dígitos", maxlength: "O nome deve ter no máximo 50 dígitos"},
                    capacidade: {required: "Digite a capacidade da sala. Ex: 20", minlength: "A capacidade tem no mínimo 1 dígito", maxlength: "A capacidade tem no máximo 4 dígito"},
                    bloco: {valueNotEquals: "Por favor selecione um bloco."},
                    tipo: {valueNotEquals: "Por favor selecione um tipo de sala."}
                },
                submitHandler: function() {
                    cadastrarSala();
                }

            });
        });
        function envia() {
            if ($('#form').valid()) {
                cadastrarSala();
            }
        }
</script>
