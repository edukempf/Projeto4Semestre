/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Bloco;
import Class.Sala;
import Class.TipoSala;
import Class.TipoUsuario;
import DAO.GenericDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "SalaServlet", urlPatterns = {"/SalaServlet"})
public class SalaServlet extends HttpServlet {

    GenericDao<Sala> daoS;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        daoS=new GenericDao<Sala>(Sala.class);
        
        HttpSession session = request.getSession();
        session.setAttribute("salaEditar", null);
        String param = request.getParameter("op");
        
        if (param.equals("listar")) {
            ArrayList<Sala> lista = (ArrayList<Sala>) daoS.list();
            session.setAttribute("listaSala", lista);
        } else if (param.equals("editar")) {
            Sala sala = daoS.get(Long.parseLong(request.getParameter("id")));
            session.setAttribute("salaEditar", sala);
        }else if(param.equals("apagar")){
            daoS.remove(Long.parseLong(request.getParameter("id")));
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Sala sala = new Sala();
        sala.setNome(request.getParameter("nome"));
        sala.setCapacidade(Integer.parseInt(request.getParameter("capacidade")));

        GenericDao<Bloco> daoB = new GenericDao<Bloco>(Bloco.class);
        Bloco bloco = daoB.get(Long.parseLong(request.getParameter("bloco")));
        sala.setBlocoPertencente(bloco);

        GenericDao<TipoSala> daoT = new GenericDao<TipoSala>(TipoSala.class);
        TipoSala tipoSala = daoT.get(Long.parseLong(request.getParameter("tipo")));
        sala.setTipoSala(tipoSala);
        
        daoS=new GenericDao<Sala>(Sala.class);
        if (!"".equals(request.getParameter("id"))) {
            sala.setId(Long.parseLong(request.getParameter("id")));
            daoS.edit(sala);
        } else {
            daoS.insert(sala);
        }

    }
}
