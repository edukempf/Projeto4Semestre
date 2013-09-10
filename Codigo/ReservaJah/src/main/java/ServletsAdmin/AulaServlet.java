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
import DAO.GenericDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.util.BuddhistCalendar;

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
        DiasSemana[] dias = DiasSemana.values();
        Horario[] horarios = Horario.values();
        if (param.equals("listar")) {
            session.setAttribute("idBloco", null);
            session.setAttribute("idHor", null);
            session.setAttribute("horaFim", null);
            session.setAttribute("diaSelecionado", null);
            session.setAttribute("idSala", null);
            daoD = new GenericDao<Disciplina>(Disciplina.class);
            ArrayList<Disciplina> listaD = (ArrayList<Disciplina>) daoD.list();
            daoA=new GenericDao<Aula>(Aula.class);
            ArrayList<Aula> listaA=(ArrayList<Aula>) daoA.list();
            session.setAttribute("listaAula", listaA);
            session.setAttribute("dias", dias);
            session.setAttribute("disciplinas", listaD);
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
            session.setAttribute("diaSelecionado", Integer.parseInt(request.getParameter("dia")));
        }
        if(param.equals("listaAulaSala")){
            session.setAttribute("idSala", Integer.parseInt(request.getParameter("id")));
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Aula aula=new Aula();
        Horario listaHorario[] = Horario.values();
        int idHorario = Integer.parseInt(request.getParameter("hInicio")) - 1;
        Horario horInicio = listaHorario[idHorario];
        aula.setInicio(horInicio);
        
        int numAula = Integer.parseInt(request.getParameter("horaFim"));
        for (int i = 1; i <= numAula; i++) {
            idHorario++;
        }
        Horario horaFim = listaHorario[idHorario];
        aula.setFim(horaFim);
        
        DiasSemana[] dias = DiasSemana.values();
        DiasSemana diaAula=dias[Integer.parseInt(request.getParameter("dia"))-1];
        aula.setDia(diaAula);
        
        Calendar diaInicio=Calendar.getInstance();
        String data=request.getParameter("diaInicio");
        String[] valoresData=data.split("/");
        diaInicio.set(Integer.parseInt(valoresData[2]), Integer.parseInt(valoresData[1]), Integer.parseInt(valoresData[0]));
        aula.setDataInicio(diaInicio);
        
        Calendar diaFim=Calendar.getInstance();
        String data2=request.getParameter("diaFim");
        String[] valoresData2=data2.split("/");
        diaFim.set(Integer.parseInt(valoresData2[2]), Integer.parseInt(valoresData2[1]), Integer.parseInt(valoresData2[0]));
        aula.setDataFim(diaFim);
        
        daoD=new GenericDao<Disciplina>(Disciplina.class);
        Disciplina disc=daoD.get(Long.parseLong(request.getParameter("disciplina")));
        aula.setDisciplina(disc);
        
        daoS=new GenericDao<Sala>(Sala.class);
        Sala sala=daoS.get(Long.parseLong(request.getParameter("sala")));
        aula.setSala(sala);
        
        aula.setStatus(true);
        
        daoA=new GenericDao<Aula>(Aula.class);
        daoA.insert(aula);
    }
}
