/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var coluna = 1;
var linhaI = 0;
var linhaF = 0;
$(document).ready(function() {
    $('#listaBlocos').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            success: function(ret) {
                $('#conteudo').load('ListagemBlocos.jsp');
            }
        });
    });
    $('#listaTipoSala').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            success: function(ret) {
                $('#conteudo').load('ListagemTipoSala.jsp');
            }
        });
    });
    $('#listaTipoUsuario').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            success: function(ret) {
                $('#conteudo').load('ListagemTipoUsuario.jsp');
            }
        });
    });
    $('#listaSala').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            success: function(ret) {
                $('#conteudo').load('ListagemSala.jsp');
            }
        });
    });
    $('#listaUsuario').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            success: function(ret) {
                $('#conteudo').load('ListagemUsuario.jsp');
            }
        });
    });
    $('#listaDisciplina').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            success: function(ret) {
                $('#conteudo').load('ListagemDisciplina.jsp');
            }
        });
    });
    $('#listaAula').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            success: function(ret) {
                $('#conteudo').load('ListagemAula.jsp');
            }
        });
    });
});
function telaCadastroBloco() {
    $('#conteudo').load('CadastroBloco.jsp');
}
function telaCadastroTipoSala() {
    $('#conteudo').load('CadastroTipoSala.jsp');
}
function telaCadastroTipoUsuario() {
    $('#conteudo').load('CadastroTipoUsuario.jsp');
}
function telaCadastroSala() {
    $.ajax({
        url: '../BlocoServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $.ajax({
                url: '../TipoSalaServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('CadastroSala.jsp');
                }
            });
        }
    });
}
function telaCadastroUsuario() {
    $.ajax({
        url: '../TipoUsuarioServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load('CadastroUsuario.jsp');
        }
    });
}
function telaCadastroDisciplina() {
    $.ajax({
        url: '../UsuariosServlet?op=listar_professores',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load('CadastroDisciplina.jsp');
        }
    });
}
function telaCadastroAula() {
    $.ajax({
        url: '../BlocoServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load('CadastroAula.jsp');
        }
    });
}
function cadastrarBloco() {
    $.ajax({
        url: '../BlocoServlet',
        data: $('#form').serialize(),
        type: 'POST',
        success: function(ret) {
            $.ajax({
                url: '../BlocoServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('ListagemBlocos.jsp');
                }
            });
        }
    });
}
function cadastrarTipoSala() {
    $.ajax({
        url: '../TipoSalaServlet',
        data: $('#form').serialize(),
        type: 'POST',
        success: function(ret) {
            $.ajax({
                url: '../TipoSalaServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('ListagemTipoSala.jsp');
                }
            });
        }
    });
}
function cadastrarTipoUsuario() {
    $.ajax({
        url: '../TipoUsuarioServlet',
        data: $('#form').serialize(),
        type: 'POST',
        success: function(ret) {
            $.ajax({
                url: '../TipoUsuarioServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('ListagemTipoUsuario.jsp');
                }
            });
        }
    });
}
function cadastrarSala() {
    $.ajax({
        url: '../SalaServlet',
        data: $('#form').serialize(),
        type: 'POST',
        success: function(ret) {
            $.ajax({
                url: '../SalaServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('ListagemSala.jsp');
                }
            });
        }
    });
}
function cadastrarUsuario() {
    $.ajax({
        url: '../UsuariosServlet',
        data: $('#form').serialize(),
        type: 'POST',
        success: function(ret) {
            $.ajax({
                url: '../UsuariosServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('ListagemUsuario.jsp');
                }
            });
        }
    });
}
function cadastrarDisciplina() {
    $.ajax({
        url: '../DisciplinaServlet',
        data: $('#form').serialize(),
        type: 'POST',
        success: function(ret) {
            $.ajax({
                url: '../DisciplinaServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('ListagemDisciplina.jsp');
                }
            });
        }
    });
}
function cadastrarAula() {
    $.ajax({
        url: '../AulaServlet',
        data: $('#form').serialize(),
        type: 'POST',
        success: function(ret) {
            $.ajax({
                url: '../AulaServlet?op=listar',
                type: 'GET',
                success: function(ret) {
                    $('#conteudo').load('ListagemAula.jsp');
                }
            });
        }
    });
}
function voltarListarBloco(caminho) {
    $.ajax({
        url: '../BlocoServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarTipoSala(caminho) {
    $.ajax({
        url: '../TipoSalaServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarTipoUsuario(caminho) {
    $.ajax({
        url: '../TipoUsuarioServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarSala(caminho) {
    $.ajax({
        url: '../SalaServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarUsuario(caminho) {
    $.ajax({
        url: '../UsuariosServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarDisciplina(caminho) {
    $.ajax({
        url: '../DisciplinaServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarAula(caminho) {
    $.ajax({
        url: '../AulaServlet?op=listar',
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load(caminho);
        }
    });
}
function editarBloco(id) {
    $.ajax({
        url: '../BlocoServlet?op=editar&id=' + id,
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load('CadastroBloco.jsp');
        }
    });
}
function editarTipoSala(id) {
    $.ajax({
        url: '../TipoSalaServlet?op=editar&id=' + id,
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load('CadastroTipoSala.jsp');
        }
    });
}
function editarTipoUsuario(id) {
    $.ajax({
        url: '../TipoUsuarioServlet?op=editar&id=' + id,
        type: 'GET',
        success: function(ret) {
            $('#conteudo').load('CadastroTipoUsuario.jsp');
        }
    });
}
function editarSala(id) {
    $.ajax({
        url: '../SalaServlet?op=editar&id=' + id,
        type: 'GET',
        success: function(ret) {
            telaCadastroSala();
        }
    });
}
function editarUsuario(id) {
    $.ajax({
        url: '../UsuariosServlet?op=editar&id=' + id,
        type: 'GET',
        success: function(ret) {
            telaCadastroUsuario();
        }
    });
}
function editarDisciplina(id) {
    $.ajax({
        url: '../DisciplinaServlet?op=editar&id=' + id,
        type: 'GET',
        success: function(ret) {
            telaCadastroDisciplina();
        }
    });
}
function editarAula(id) {
    $.ajax({
        url: '../AulaServlet?op=editar&id=' + id,
        type: 'GET',
        success: function(ret) {
            telaCadastroAula();
        }
    });
}
function apagarBloco(id) {
    $.ajax({
        url: '../BlocoServlet?op=apagar&id=' + id,
        type: 'GET',
        success: function(ret) {
            voltarListarBloco('ListagemBlocos.jsp');
        }
    });
}
function apagarTipoSala(id) {
    $.ajax({
        url: '../TipoSalaServlet?op=apagar&id=' + id,
        type: 'GET',
        success: function(ret) {
            voltarListarTipoSala('ListagemTipoSala.jsp');
        }
    });
}
function apagarTipoUsuario(id) {
    $.ajax({
        url: '../TipoUsuarioServlet?op=apagar&id=' + id,
        type: 'GET',
        success: function(ret) {
            voltarListarTipoUsuario('ListagemTipoUsuario.jsp');
        }
    });
}
function apagarSala(id) {
    $.ajax({
        url: '../SalaServlet?op=apagar&id=' + id,
        type: 'GET',
        success: function(ret) {
            voltarListarSala('ListagemSala.jsp');
        }
    });
}
function apagarUsuario(id) {
    $.ajax({
        url: '../UsuariosServlet?op=apagar&id=' + id,
        type: 'GET',
        success: function(ret) {
            voltarListarUsuario('ListagemUsuario.jsp');
        }
    });
}
function apagarDisciplina(id) {
    $.ajax({
        url: '../DisciplinaServlet?op=apagar&id=' + id,
        type: 'GET',
        success: function(ret) {
            voltarListarDisciplina('ListagemDisciplina.jsp');
        }
    });
}
function apagarAula(id) {
    $.ajax({
        url: '../AulaServlet?op=apagar&id=' + id,
        type: 'GET',
        success: function(ret) {
            voltarListarAula('ListagemAula.jsp');
        }
    });
}
function listaSala() {
    $.ajax({
        url: '../SalaServlet?op=listaSalasBloco&id=' + $('#bloco').val(),
        type: 'GET',
        success: function(ret) {
            voltarListarDisciplina('CadastroAula.jsp');
        }
    });
}

function listaNovoHorario() {
    $.ajax({
        url: '../AulaServlet?dia=' + $('#dia').val() + '&op=listaHoraFim&id=' + $('#horaInicio').val()+'&diaFim='+$('#dataFim').val()+'&diaInicio='+$('#dataInicio').val(),
        type: 'GET',
        success: function(ret) {
            voltarListarDisciplina('CadastroAula.jsp');
            linhaI = $('#horaInicio').val();
            
        }
    });
}
function setaColuna() {
    coluna = $('#dia').val();
}
function mudarCor() {
    var aux=linhaI;
    for (var i = 1; i <= linhaF; i++) {
        var att = "#" + aux + coluna;
        $(att).css('background-color', 'white');
        aux++;
    }
    linhaF = $('#horaFim').val();
    var aux=linhaI;
    for (var i = 1; i <= linhaF; i++) {
        var att = "#" + aux + coluna;
        $(att).css('background-color', 'blue');
        aux++;
    }
}

function listaAulasSala() {
    $.ajax({
        url: '../AulaServlet?op=listaAulaSala&id=' + $('#sala').val(),
        type: 'GET',
        success: function(ret) {
            voltarListarDisciplina('CadastroAula.jsp');
        }
    });
}