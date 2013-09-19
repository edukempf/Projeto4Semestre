 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Aula;
import Class.Bloco;
import Class.DiasSemana;
import Class.Disciplina;
import Class.Horario;
import Class.Sala;
import Class.Usuario;
import DAO.GenericDao;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author eduardo
 */
@WebServlet(name = "AulaServlet", urlPatterns = {"/AulaServlet"})
public class AulaServlet extends HttpServlet {

    GenericDao<Bloco> daoB;
    GenericDao<Sala> daoS;
    GenericDao<Disciplina> daoD;
    GenericDao<Aula> daoA;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String param = request.getParameter("op");
        daoA = new GenericDao<Aula>(Aula.class);
        DiasSemana[] dias = DiasSemana.values();
        Horario[] horarios = Horario.values();
        if (param.equals("listar")) {
            session.setAttribute("idBloco", null);
            session.setAttribute("idHor", null);
            session.setAttribute("horaFim", null);
            session.setAttribute("diaSelecionado", null);
            session.setAttribute("idSala", null);
            session.setAttribute("listaAulaSala", null);
            session.setAttribute("aulaEditar",null);
            session.setAttribute("dataInicio", null);
            session.setAttribute("dataFim", null);
            session.setAttribute("diaInicio", null);
            session.setAttribute("diaFim", null);
            daoD = new GenericDao<Disciplina>(Disciplina.class);
            ArrayList<Disciplina> listaD = (ArrayList<Disciplina>) daoD.list();
            ArrayList<Aula> listaA = (ArrayList<Aula>) daoA.list();
            session.setAttribute("listaAula", listaA);
            session.setAttribute("dias", dias);
            session.setAttribute("horarios", horarios);
            session.setAttribute("disciplinas", listaD);
        }

        if (param.equals("listaHoraFim")) {
            int j = 0;
            ArrayList<Horario> ss = new ArrayList<Horario>();
            for (int i = Integer.parseInt(request.getParameter("id")) - 1; i < horarios.length; i++) {
                ss.add(horarios[i]);
            }
            if (session.getAttribute("aulaEditar") != null) {
                Aula dd = (Aula) session.getAttribute("aulaEditar");
                dd.setFim(null);
                dd.setInicio(null);
            }
            session.setAttribute("horaFim", ss);
            session.setAttribute("diaInicio", request.getParameter("diaInicio"));
            session.setAttribute("diaFim", request.getParameter("diaFim"));
            session.setAttribute("idHor", Integer.parseInt(request.getParameter("id")));
            session.setAttribute("diaSelecionado", Integer.parseInt(request.getParameter("dia")));
        }
        if (param.equals("listaAulaSala")) {
            session.setAttribute("idSala", Integer.parseInt(request.getParameter("id")));
            ArrayList<Aula> lista = (ArrayList<Aula>) daoA.listAulasSalas(Long.parseLong(request.getParameter("id")));
            session.setAttribute("listaAulaSala", lista);
        }
        if (param.equals("editar")) {
            Aula edt = daoA.get(Long.parseLong(request.getParameter("id")));
            session.setAttribute("dias", dias);
            session.setAttribute("horarios", horarios);
            ArrayList<Aula> lista = (ArrayList<Aula>) daoA.listAulasSalas(edt.getSala().getId());
            session.setAttribute("listaAulaSala", lista);
            daoB = new GenericDao<Bloco>(Bloco.class);
            ArrayList<Bloco> bloco = (ArrayList<Bloco>) daoB.list();
            session.setAttribute("listaBloco", bloco);
            daoS = new GenericDao<Sala>(Sala.class);
            ArrayList<Sala> listaS = (ArrayList<Sala>) daoS.listSalasBloco(edt.getSala().getBlocoPertencente().getId());
            session.setAttribute("listaSalaBloco", listaS);
            session.setAttribute("aulaEditar", edt);
            int aux = 0;
            for (int i = 0; i < horarios.length; i++) {
                if (horarios[i] == edt.getInicio()) {
                    aux = i;
                    break;
                }
            }
            ArrayList<Horario> fim = new ArrayList<Horario>();
            for (int i = aux; i < horarios.length; i++) {
                fim.add(horarios[i]);
            }
            session.setAttribute("horaFim", fim);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String dataInicio = dateFormat.format(edt.getDataInicio().getTime());
            String dataFim = dateFormat.format(edt.getDataFim().getTime());
            session.setAttribute("dataInicio", dataInicio);
            session.setAttribute("dataFim", dataFim);

        }
        if(param.equals("apagar")){
            daoA.remove(Long.parseLong(request.getParameter("id")));
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Aula aula = new Aula();
        Horario listaHorario[] = Horario.values();
        int idHorario = Integer.parseInt(request.getParameter("hInicio")) - 1;
        Horario horInicio = listaHorario[idHorario];
        aula.setInicio(horInicio);

        int numAula = Integer.parseInt(request.getParameter("horaFim"));
        for (int i = 1; i <= numAula; i++) {
            idHorario++;
        }
        Horario horaFim = listaHorario[idHorario-1];
        aula.setFim(horaFim);

        DiasSemana[] dias = DiasSemana.values();
        DiasSemana diaAula = dias[Integer.parseInt(request.getParameter("dia")) - 1];
        aula.setDia(diaAula);

        Calendar diaInicio = Calendar.getInstance();
        String data = request.getParameter("diaInicio");
        String[] valoresData = data.split("/");
        diaInicio.set(Integer.parseInt(valoresData[2]), Integer.parseInt(valoresData[1])-1, Integer.parseInt(valoresData[0]));
        aula.setDataInicio(diaInicio);

        Calendar diaFim = Calendar.getInstance();
        String data2 = request.getParameter("diaFim");
        String[] valoresData2 = data2.split("/");
        diaFim.set(Integer.parseInt(valoresData2[2]), Integer.parseInt(valoresData2[1])-1, Integer.parseInt(valoresData2[0]));
        aula.setDataFim(diaFim);

        daoD = new GenericDao<Disciplina>(Disciplina.class);
        Disciplina disc = daoD.get(Long.parseLong(request.getParameter("disciplina")));
        aula.setDisciplina(disc);

        daoS = new GenericDao<Sala>(Sala.class);
        Sala sala = daoS.get(Long.parseLong(request.getParameter("sala")));
        aula.setSala(sala);
        
        HttpSession session=request.getSession(false);
        
        aula.setUsuario((Usuario) session.getAttribute("user"));

        aula.setStatus(true);

        daoA = new GenericDao<Aula>(Aula.class);
        if (!"".equals(request.getParameter("idAula"))) {
            aula.setId(Long.parseLong(request.getParameter("idAula")));
            daoA.edit(aula);
        } else {
            daoA.insert(aula);
        }

    }
}
