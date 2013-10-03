<%-- 
    Document   : CadastroTipoSala
    Created on : 30/08/2013, 21:58:27
    Author     : Eduardo
--%>
<div id="div_mensagens" ></div>
<h5 class="title">Cadastrar Tipo de Sala</h5>
<form id='form' action="../TipoSalaServlet" method="post">
    <div class="field">
        <input type="hidden" name="id" value="${tipoSalaEditar.id}"/>
        <label for="descricao">Descrição:</label>
        <input type="text" value="${tipoSalaEditar.descricao}" name="descricao"/><br />
        <p class="hint">Digite a descrição para sala</p>
    </div>
    <button type="button" onclick="voltarListarTipoSala('ListagemTipoSala.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="envia();" value="" class="btnConfirmar">Confirmar</button>
</form>
<script>
        $(document).ready(function() {
            $("#form").validate({
                errorLabelContainer: $('#div_mensagens'),
                rules: {
                    descricao: {required: true, minlength: 3, maxlength: 50}
                },
                messages: {
                    descricao: {required: "Digite uma descrição para sala. Ex: Laboratório", minlength: "A descrição deve ter no mínimo 3 dígitos", maxlength: "A descrição deve ter no máximo 50 dígitos"}
                },
                submitHandler: function() {
                    cadastrarTipoSala();
                }

            });
        });
        function envia() {
            if ($('#form').valid()) {
                cadastrarTipoSala()();
            }
        }
</script>