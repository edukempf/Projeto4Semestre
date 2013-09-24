 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Aula;
import Class.Bloco;
import Class.DiasSemana;
import Class.Horario;
import Class.Sala;
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
@WebServlet(name = "ConsultaServlet", urlPatterns = {"/ConsultaServlet"})
public class ConsultaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GenericDao<Aula> daoA = new GenericDao<Aula>(Aula.class);
        HttpSession session = request.getSession();
        String param = request.getParameter("op");
        GenericDao<Sala> daoS = new GenericDao<Sala>(Sala.class);
        GenericDao<Bloco> daoB = new GenericDao<Bloco>(Bloco.class);
        Horario[] horarios = Horario.values();

        if (param.equalsIgnoreCase("consulta")) {
            ArrayList<Aula> lista = new ArrayList<Aula>();
            ArrayList<Aula> lista2 = new ArrayList<Aula>();
            Long id = Long.parseLong(request.getParameter("id"));
            Calendar diaInicio = Calendar.getInstance();
            String data = request.getParameter("data");
            String[] valoresData = data.split("/");
            diaInicio.set(Integer.parseInt(valoresData[2]), Integer.parseInt(valoresData[1]) - 1, Integer.parseInt(valoresData[0]));
            lista = (ArrayList<Aula>) daoA.listAulasSalasData(id, diaInicio);
            for (Aula a : lista) {
                int posI = 0, posF = 0;
                for (int i = 0; i < horarios.length; i++) {
                    if (a.getInicio() == horarios[i]) {
                        posI = i;
                    }
                    if (a.getFim() == horarios[i]) {
                        posF = i;
                    }
                }
                for (int i = posI; i <= posF; i++) {
                    Aula aux = new Aula();
                    aux.setStatus(a.isStatus());
                    aux.setDisciplina(a.getDisciplina());
                    aux.setDataFim(a.getDataFim());
                    aux.setDataInicio(a.getDataInicio());
                    aux.setFim(a.getFim());
                    aux.setDia(a.getDia());
                    aux.setSala(a.getSala());
                    aux.setUsuario(a.getUsuario());
                    aux.setInicio(horarios[i]);
                    lista2.add(aux);
                }
            }
            session.setAttribute("listaAulaSala", lista2);
            session.setAttribute("idSala", id);
        }
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
        if (param.equals("listaSalasBloco")) {
            ArrayList<Sala> listaSalaBloco = (ArrayList<Sala>) daoS.listSalasBloco(Long.parseLong(request.getParameter("id")));
            session.setAttribute("idBloco", Long.parseLong(request.getParameter("id")));
            session.setAttribute("listaSalaBloco", listaSalaBloco);
        }
        response.sendRedirect("ConsultarSala.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
