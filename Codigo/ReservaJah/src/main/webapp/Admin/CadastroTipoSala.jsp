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
        <label for="descricao">Descri��o:</label>
        <input type="text" value="${tipoSalaEditar.descricao}" name="descricao"/><br />
        <p class="hint">Digite a descri��o para sala</p>
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
                    descricao: {required: "Digite uma descri��o para sala. Ex: Laborat�rio", minlength: "A descri��o deve ter no m�nimo 3 d�gitos", maxlength: "A descri��o deve ter no m�ximo 50 d�gitos"}
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