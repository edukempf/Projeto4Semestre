<%-- 
    Document   : CadastroTipoUsuario
    Created on : 23/08/2013, 21:53:49
    Author     : Eduardo
--%>
<form id='form' action="../TipoUsuarioServlet" method="post">
    <div class="field">
        <input type="hidden" name="id" value="${tipoUsuarioEditar.id}"/>
        <label for="descricao">Descrição:</label>
        <input type="text" value="${tipoUsuarioEditar.descricao}" name="descricao"/><br />
        <p class="hint">Digite a descriç&amacr;o para sala</p>
    </div>
    <button type="button" onclick="voltarListarTipoUsuario('ListagemTipoUsuario.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarTipoUsuario();" value="" class="btnConfirmar">Confirmar</button>
</form>