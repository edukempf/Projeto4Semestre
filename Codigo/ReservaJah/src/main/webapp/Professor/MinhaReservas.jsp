<%-- 
    Document   : MinhaReservas
    Created on : 12/09/2013, 20:39:46
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<h5 class="title">Gerenciar Aula</h5>
<table id="listaElementos">
    <thead>
        <tr>
            <th>Disciplina</th>
            <th>Sala</th>
            <th>Bloco</th>
            <th>Inicio</th>
            <th>Fim</th>
            <th>Cancelar</th>
        </tr>
    </thead>
    <c:choose>
        <c:when test="${listaAula.size()!=0}">
            <c:forEach items="${listaAula}" var="aula">
                <tr>
                    <td><c:out value="${aula.disciplina.nome}"/></td>
                    <td><c:out value="${aula.sala.nome}"/></td>
                    <td><c:out value="${aula.sala.blocoPertencente.nome}"/></td>
                    <td><c:out value="${aula.inicio}"/></td>
                    <td><c:out value="${aula.fim}"/></td>
                    <td><a class="modificar" onclick="cancelarReserva(<c:out value="${aula.id}"/>);"><img src="../img/delete.png"/></a></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td>Nenhuma reserva feita</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </c:otherwise>
    </c:choose>
    <tfoot>
        <tr>
            <th>Disciplina</th>
            <th>Sala</th>
            <th>Bloco</th>
            <th>Inicio</th>
            <th>Fim</th>
            <th>Cancelar</th>
        </tr>
    </tfoot>
</table>
<button type="button" onclick="telaCadastroAula2();" value="" class="btnAdicionar">Fazer nova reserva</button>
<script type="text/javascript">
                        $(document).ready(function() {
                            $('#listaElementos').dataTable({
                                "bScrollCollapse": true,
                                "bPaginate": true,
                                "bJQueryUI": true
                            });
                        });
</script>

