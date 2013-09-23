<%-- 
    Document   : CadastroBloco
    Created on : 30/08/2013, 22:04:24
    Author     : Eduardo
--%>
<script language="javascript" src="../js/projeto.js"></script>
<form id="form" action="../BlocoServlet" method="post">
    <div class="field">
        <input type="hidden" name="id" value="${blocoEditar.id}"/>
        <label for="nome">Nome:</label>
        <input type="text" value="${blocoEditar.nome}" name="nome"/><br />
        <p class="hint">Digite um Nome</p>
    </div>
    <button type="button" onclick="voltarListarBloco('ListagemBlocos.jsp');" value="" class="btnCancelar">Cancelar</button>
    <button type="button" onclick="cadastrarBloco();" value="" class="btnConfirmar">Confirmar</button>
</form>