<%-- 
    Document   : CadastroBloco
    Created on : 30/08/2013, 22:04:24
    Author     : Eduardo
--%>
<script language="javascript" src="../js/projeto.js"></script>
<div id="div_mensagens" ></div>
<h5 class="title">Cadastrar Bloco</h5>
<form id="form">
    <div class="field">
        <input type="hidden" name="id" value="${blocoEditar.id}"/>
        <label for="nome">Nome:</label>
        <input type="text" value="${blocoEditar.nome}" name="nome"/><br />
        <p class="hint">Digite um Nome</p>
    </div>
    <button type="button" onclick="voltarListarBloco('ListagemBlocos.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="envia();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
    $(document).ready(function (){
        $("#form").validate({
            errorLabelContainer: $('#div_mensagens'),
            rules: {
                nome: {required: true, minlength: 6, maxlength: 50}
            },
            messages: {
                nome: {required: "Digite um nome para o bloco. Ex: Bloco X", minlength: "O nome deve ter no mínimo 6 dígitos", maxlength: "O nome deve ter no máximo 50 dígitos"}
            },
            submitHandler: function() {
                cadastrarBloco();
            }

        });
    });
    function envia(){
        if($('#form').valid()){
            cadastrarBloco();
        }
    }
</script>