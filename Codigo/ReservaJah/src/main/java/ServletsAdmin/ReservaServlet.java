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
import java.io.PrintWriter;
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
@WebServlet(name = "ReservaServlet", urlPatterns = {"/ReservaServlet"})
public class ReservaServlet extends HttpServlet {

    GenericDao<Bloco> daoB;
    GenericDao<Sala> daoS;
    GenericDao<Disciplina> daoD;
    GenericDao<Aula> daoA;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        daoA = new GenericDao<Aula>(Aula.class);
        String param = request.getParameter("op");
        HttpSession session = request.getSession();
        Horario[] horarios = Horario.values();
        if (param.equalsIgnoreCase("pegaDia")) {
            daoB = new GenericDao<Bloco>(Bloco.class);
            ArrayList<Bloco> bloco = (ArrayList<Bloco>) daoB.list();
            session.setAttribute("listaBloco", bloco);
            Calendar diaInicio = Calendar.getInstance();
            String data = request.getParameter("dia");
            String[] valoresData = data.split("/");
            diaInicio.set(Integer.parseInt(valoresData[2]), Integer.parseInt(valoresData[1]) - 1, Integer.parseInt(valoresData[0]));
            int dia = diaInicio.get(Calendar.DAY_OF_WEEK);
            DiasSemana[] dias = DiasSemana.values();
            ArrayList<DiasSemana> lista = new ArrayList<DiasSemana>();
            lista.add(dias[dia - 2]);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String dataInicio = dateFormat.format(diaInicio.getTime());
            session.setAttribute("dataInicio", dataInicio);
            session.setAttribute("dias", lista);
            session.setAttribute("horarios", horarios);
        }
        if (param.equals("listaHoraFim")) {
            int j = 0;
            ArrayList<Horario> ss = new ArrayList<Horario>();
            for (int i = Integer.parseInt(request.getParameter("id")) - 1; i < horarios.length; i++) {
                ss.add(horarios[i]);
            }
            session.setAttribute("horaFim", ss);
            session.setAttribute("idHor", Integer.parseInt(request.getParameter("id")));
        }
        if (param.equals("listaHoraFim")) {
            int j = 0;
            ArrayList<Horario> ss = new ArrayList<Horario>();
            for (int i = Integer.parseInt(request.getParameter("id")) - 1; i < horarios.length; i++) {
                ss.add(horarios[i]);
            }
            session.setAttribute("horaFim", ss);
            session.setAttribute("idHor", Integer.parseInt(request.getParameter("id")));
            session.setAttribute("idD", Integer.parseInt(request.getParameter("idD")));
        }
        if (param.equals("listaAulaSala")) {
            session.setAttribute("idSala", Integer.parseInt(request.getParameter("id")));
            Calendar diaInicio = Calendar.getInstance();
            String data = request.getParameter("data");
            String[] valoresData = data.split("/");
            daoD=new GenericDao<Disciplina>(Disciplina.class);
            ArrayList<Disciplina> disciplina = (ArrayList<Disciplina>) daoD.list();
            diaInicio.set(Integer.parseInt(valoresData[2]), Integer.parseInt(valoresData[1]) - 1, Integer.parseInt(valoresData[0]));
            ArrayList<Aula> lista = (ArrayList<Aula>) daoA.listAulasSalasData(Long.parseLong(request.getParameter("id")), diaInicio);
            session.setAttribute("listaAulaSala", lista);
            session.setAttribute("listaDisciplina", disciplina);
        }
        if (param.equals("listar")) {
            session.setAttribute("idBloco", null);
            session.setAttribute("idHor", null);
            session.setAttribute("horaFim", null);
            session.setAttribute("idD", null);
            session.setAttribute("idSala", null);
            session.setAttribute("listaAulaSala", null);
            session.setAttribute("dias", null);
            session.setAttribute("dataInicio", null);
            session.setAttribute("listaDisciplina", null);
            session.setAttribute("diaInicio", null);
            session.setAttribute("horarios", null);
            Usuario user = (Usuario) session.getAttribute("user");
            ArrayList<Aula> listaA = (ArrayList<Aula>) daoA.listReservasProfessor(user.getId(), Calendar.getInstance());
            session.setAttribute("listaAula", listaA);
        }
        if(param.equals("apagar")){
            daoA.remove(Long.parseLong(request.getParameter("id")));
        }
        response.sendRedirect("Professor/area_professor.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        Aula aula = new Aula();
        Horario listaHorario[] = Horario.values();
        int idHorario = Integer.parseInt(request.getParameter("hInicio")) - 1;
        Horario horInicio = listaHorario[idHorario];
        aula.setInicio(horInicio);

        int numAula = Integer.parseInt(request.getParameter("horaFim"));
        for (int i = 1; i <= numAula; i++) {
            idHorario++;
        }
        Horario horaFim = listaHorario[idHorario - 1];
        aula.setFim(horaFim);

        ArrayList<DiasSemana> dias = (ArrayList<DiasSemana>) (session.getAttribute("dias"));
        DiasSemana diaAula = dias.get(0);
        aula.setDia(diaAula);

        Calendar diaInicio = Calendar.getInstance();
        String data = request.getParameter("dataInicio");
        String[] valoresData = data.split("/");
        diaInicio.set(Integer.parseInt(valoresData[2]), Integer.parseInt(valoresData[1]) - 1, Integer.parseInt(valoresData[0]));
        aula.setDataInicio(diaInicio);
        aula.setDataFim(diaInicio);

        daoD = new GenericDao<Disciplina>(Disciplina.class);
        Disciplina disc = daoD.get(Long.parseLong(request.getParameter("disciplina")));
        aula.setDisciplina(disc);

        daoS = new GenericDao<Sala>(Sala.class);
        Sala sala = daoS.get(Long.parseLong(request.getParameter("sala")));
        aula.setSala(sala);


        aula.setUsuario((Usuario) session.getAttribute("user"));

        aula.setStatus(false);

        daoA = new GenericDao<Aula>(Aula.class);
        daoA.insert(aula);
        session.setAttribute("idBloco", null);
        session.setAttribute("idHor", null);
        session.setAttribute("horaFim", null);
        session.setAttribute("idD", null);
        session.setAttribute("idSala", null);
        session.setAttribute("listaAulaSala", null);
        session.setAttribute("dias", null);
        session.setAttribute("dataInicio", null);
        session.setAttribute("listaDisciplina", null);
        session.setAttribute("diaInicio", null);
        session.setAttribute("horarios", null);

    }
}
