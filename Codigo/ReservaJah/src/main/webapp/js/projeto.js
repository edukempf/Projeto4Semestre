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
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ListagemBlocos.jsp');
            }
        });
    });
    $('#listaTipoSala').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ListagemTipoSala.jsp');
            }
        });
    });
    $('#listaTipoUsuario').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ListagemTipoUsuario.jsp');
            }
        });
    });
    $('#listaSala').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ListagemSala.jsp');
            }
        });
    });
    $('#listaUsuario').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ListagemUsuario.jsp');
            }
        });
    });
    $('#listaDisciplina').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ListagemDisciplina.jsp');
            }
        });
    });
    $('#listaAula').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ListagemAula.jsp');
            }
        });
    });
    $('#reservaSala').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('ReservarSala.jsp');
            }
        });
    });
    $('#minhasReservas').click(function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('href'),
            type: 'GET',
            beforeSend: function(ret) {
                $('.modal').show();
            },
            success: function(ret) {
                $('.modal').hide();
                $('#conteudo').load('MinhaReservas.jsp');
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
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
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('CadastroUsuario.jsp');
        }
    });
}
function telaCadastroDisciplina() {
    $.ajax({
        url: '../UsuariosServlet?op=listar_professores',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('CadastroDisciplina.jsp');
        }
    });
}
function telaCadastroAula() {
    $.ajax({
        url: '../BlocoServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('CadastroAula.jsp');
        }
    });
}
function telaCadastroAula2() {
    $.ajax({
        url: '../BlocoServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('ReservarSala.jsp');
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
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
                beforeSend: function(ret) {
                    $('.modal').show();
                },
                success: function(ret) {
                    $('.modal').hide();
                    $('#conteudo').load('ListagemAula.jsp');
                }
            });
        }
    });
}
function cadastrarReserva() {
    $.ajax({
        url: '../ReservaServlet',
        data: $('#form').serialize(),
        type: 'POST',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarReserva('MinhaReserva.jsp');
        }
    });
}
function voltarListarBloco(caminho) {
    $.ajax({
        url: '../BlocoServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarTipoSala(caminho) {
    $.ajax({
        url: '../TipoSalaServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarTipoUsuario(caminho) {
    $.ajax({
        url: '../TipoUsuarioServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarSala(caminho) {
    $.ajax({
        url: '../SalaServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarUsuario(caminho) {
    $.ajax({
        url: '../UsuariosServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarDisciplina(caminho) {
    $.ajax({
        url: '../DisciplinaServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarAula(caminho) {
    $.ajax({
        url: '../AulaServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function voltarListarReserva(caminho) {
    $.ajax({
        url: '../ReservaServlet?op=listar',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load(caminho);
        }
    });
}
function editarBloco(id) {
    $.ajax({
        url: '../BlocoServlet?op=editar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('CadastroBloco.jsp');
        }
    });
}
function editarTipoSala(id) {
    $.ajax({
        url: '../TipoSalaServlet?op=editar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('CadastroTipoSala.jsp');
        }
    });
}
function editarTipoUsuario(id) {
    $.ajax({
        url: '../TipoUsuarioServlet?op=editar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('CadastroTipoUsuario.jsp');
        }
    });
}
function editarSala(id) {
    $.ajax({
        url: '../SalaServlet?op=editar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            telaCadastroSala();
        }
    });
}
function editarUsuario(id) {
    $.ajax({
        url: '../UsuariosServlet?op=editar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            telaCadastroUsuario();
        }
    });
}
function editarDisciplina(id) {
    $.ajax({
        url: '../DisciplinaServlet?op=editar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            telaCadastroDisciplina();
        }
    });
}
function editarAula(id) {
    $.ajax({
        url: '../AulaServlet?op=editar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            telaCadastroAula();
        }
    });
}
function apagarBloco(id) {
    $.ajax({
        url: '../BlocoServlet?op=apagar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarBloco('ListagemBlocos.jsp');
        }
    });
}
function apagarTipoSala(id) {
    $.ajax({
        url: '../TipoSalaServlet?op=apagar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarTipoSala('ListagemTipoSala.jsp');
        }
    });
}
function apagarTipoUsuario(id) {
    $.ajax({
        url: '../TipoUsuarioServlet?op=apagar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarTipoUsuario('ListagemTipoUsuario.jsp');
        }
    });
}
function apagarSala(id) {
    $.ajax({
        url: '../SalaServlet?op=apagar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarSala('ListagemSala.jsp');
        }
    });
}
function apagarUsuario(id) {
    $.ajax({
        url: '../UsuariosServlet?op=apagar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarUsuario('ListagemUsuario.jsp');
        }
    });
}
function apagarDisciplina(id) {
    $.ajax({
        url: '../DisciplinaServlet?op=apagar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarDisciplina('ListagemDisciplina.jsp');
        }
    });
}
function apagarAula(id) {
    $.ajax({
        url: '../AulaServlet?op=apagar&id=' + id,
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarAula('ListagemAula.jsp');
        }
    });
}
function listaSala() {
    $.ajax({
        url: '../SalaServlet?op=listaSalasBloco&id=' + $('#bloco').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarDisciplina('CadastroAula.jsp');
        }
    });
}
function listaSala2() {
    $.ajax({
        url: '../SalaServlet?op=listaSalasBloco&id=' + $('#bloco').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
        }
    });
}
function listaSala3() {
    $.ajax({
        url: 'ConsultaServlet?op=listaSalasBloco&id=' + $('#bloco').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
        }
    });
}
function listaNovoHorario() {
    $.ajax({
        url: '../AulaServlet?dia=' + $('#dia').val() + '&op=listaHoraFim&id=' + $('#horaInicio').val() + '&diaFim=' + $('#dataFim').val() + '&diaInicio=' + $('#dataInicio').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarDisciplina('CadastroAula.jsp');
            linhaI = $('#horaInicio').val();

        }
    });
}
function listaNovoHorario2() {
    $.ajax({
        url: '../ReservaServlet?op=listaHoraFim&id=' + $('#horaInicio').val() + '&idD=' + $('#disciplina').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarTelaCadastro();
            linhaI = $('#horaInicio').val();

        }
    });
}
function setaColuna() {
    coluna = $('#dia').val();
}
function mudarCor() {
    var aux = linhaI;
    for (var i = 1; i <= linhaF; i++) {
        var att = "#" + aux + coluna;
        $(att).css('background-color', 'white');
        aux++;
    }
    linhaF = $('#horaFim').val();
    var aux = linhaI;
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
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarListarDisciplina('CadastroAula.jsp');
        }
    });
}
function listaAulasSala2() {
    $.ajax({
        url: '../ReservaServlet?op=listaAulaSala&id=' + $('#sala').val() + '&data=' + $('#dataInicio').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarTelaCadastro();
        }
    });
}
function listaAulasSala3() {
    $.ajax({
        url: 'ConsultaServlet?op=consulta&id=' + $('#sala').val() + '&data=' + $('#dataInicio').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            location.reload();
        }
    });
}
function pegaDia() {
    $.ajax({
        url: '../ReservaServlet?op=pegaDia&dia=' + $('#dataInicio').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            voltarTelaCadastro();
        }
    });
}
function pegaDia2() {
    $.ajax({
        url: 'ConsultaServlet?op=pegaDia&dia=' + $('#dataInicio').val(),
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            location.reload();
        }
    });
}
function voltarTelaCadastro() {
    $.ajax({
        url: '../Professor/area_professor.jsp',
        type: 'GET',
        beforeSend: function(ret) {
            $('.modal').show();
        },
        success: function(ret) {
            $('.modal').hide();
            $('#conteudo').load('ReservarSala.jsp');
        }
    });
}

function pinta() {
    var att;
    var i = 1;
    for (var j = 1; j < 18; j++) {
        att = "#" + j + i;
        if ($(att).html().match("inicio")) {
            var aux = j;
            alert('ham')
            $(att).css('background-color', 'red');
            while (!$(att).html().match("fim")) {
                aux++;
                att = "#" + aux + i;
                $(att).css('background-color', 'red');
                if ($(att).html().trim() !== "") {
                    $(att).css('background-color', 'red');
                    break;
                }
            }
        }
    }
}