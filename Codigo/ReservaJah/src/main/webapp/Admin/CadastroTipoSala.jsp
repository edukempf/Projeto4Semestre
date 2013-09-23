<%-- 
    Document   : CadastroTipoSala
    Created on : 30/08/2013, 21:58:27
    Author     : Eduardo
--%>
<form id='form' action="../TipoSalaServlet" method="post">
    <div class="field">
        <input type="hidden" name="id" value="${tipoSalaEditar.id}"/>
        <label for="descricao">Descrição:</label>
        <input type="text" value="${tipoSalaEditar.descricao}" name="descricao"/><br />
        <p class="hint">Digite a descrição para sala</p>
    </div>
    <button type="button" onclick="voltarListarTipoSala('ListagemTipoSala.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarTipoSala();" value="" class="btnConfirmar">Confirmar</button>
</form>