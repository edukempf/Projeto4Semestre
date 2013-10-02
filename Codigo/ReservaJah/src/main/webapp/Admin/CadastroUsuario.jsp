<%-- 
    Document   : CadastroUsuario
    Created on : 23/08/2013, 21:51:49
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language="javascript" src="../js/projeto.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<div id="div_mensagens" ></div>
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
            <option value="default">Selecione um tipo de usuário</option>
            <c:choose>
                <c:when test="${listaTipoUsuario.size()!=0}">
                    <c:forEach items="${listaTipoUsuario}" var="tipo">
                        <option value="${tipo.id}" ${usuarioEditar.tipo.id == tipo.id? "selected" :""}>${tipo.descricao}</option>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <option value="default">Cadastre um tipo de usuário antes</option>
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
    <button type="button" onclick="envia();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
        $.validator.addMethod("valueNotEquals", function(value, element, arg) {
            return arg != value;
        }, "Value must not equal arg.");
        $(document).ready(function() {
            $("#form").validate({
                errorLabelContainer: $('#div_mensagens'),
                rules: {
                    nome: {required: true, minlength: 3, maxlength: 50},
                    senha: {required: true, minlength: 6, maxlength: 12},
                    registro: {required: true, minlength: 6, maxlength: 50},
                    email: {required: true, email:true, minlength: 6, maxlength: 12},
                    tipo: {valueNotEquals: "default"}
                },
                messages: {
                    nome: {required: "Digite um nome para o Usuário. Ex: João da Silva", minlength: "O nome deve ter no mínimo 3 dígitos", maxlength: "O nome deve ter no máximo 50 dígitos"},
                    registro: {required: "Digite um registro para o Usuário. Ex: 123456", minlength: "O registro deve ter no mínimo 6 dígitos", maxlength: "O registro deve ter no máximo 50 dígitos"},
                    senha: {required: "Digite uma senha para o usuário. Ex: 123", minlength: "A senha deve ter no mínimo 6 dígitos", maxlength: "A senha deve ter no máximo 12 dígitos"},
                    email: {required: "Digite um email para o usuário. Ex: reservajah@gmail.com",email:"Digite um email válido!", minlength: "Participantes tem no mínimo 1 dígito", maxlength: "Participantes tem no máximo 3 dígito"},
                    tipo: {valueNotEquals: "Por favor selecione um tipo de usuário."}
                },
                submitHandler: function() {
                    cadastrarUsuario();
                }

            });
        });
        function envia() {
            if ($('#form').valid()) {
                cadastrarUsuario();
            }
        }
</script>