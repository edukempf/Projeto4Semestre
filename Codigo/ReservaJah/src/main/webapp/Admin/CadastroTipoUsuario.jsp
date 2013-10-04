<%-- 
    Document   : CadastroTipoUsuario
    Created on : 23/08/2013, 21:53:49
    Author     : Eduardo
--%>
<div id="div_mensagens" ></div>
<h5 class="title">Cadastrar Tipo de Usu&aacute;rio</h5>
<form id='form' action="../TipoUsuarioServlet" method="post">
    <div class="field">
        <input type="hidden" name="id" value="${tipoUsuarioEditar.id}"/>
        <label for="descricao">Descrição:</label>
        <input type="text" value="${tipoUsuarioEditar.descricao}" name="descricao"/><br />
        <p class="hint">Digite a descriç&amacr;o para sala</p>
    </div>
    <button type="button" onclick="voltarListarTipoUsuario('ListagemTipoUsuario.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="envia();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
        $(document).ready(function() {
            $("#form").validate({
//                errorLabelContainer: $('#div_mensagens'),
                rules: {
                    descricao: {required: true, minlength: 3, maxlength: 50}
                },
                messages: {
                    descricao: {required: "Digite uma descrição para o tipo de usuário. Ex: Professor", minlength: "A descrição deve ter no mínimo 3 dígitos", maxlength: "A descrição deve ter no máximo 50 dígitos"}
                },
                errorPlacement: function(error, element) {
                    error.insertAfter(element); // default function
                },
                submitHandler: function() {
                    cadastrarTipoUsuario();
                }

            });
        });
        function envia() {
            if ($('#form').valid()) {
                cadastrarTipoUsuario();
            }
        }
</script>