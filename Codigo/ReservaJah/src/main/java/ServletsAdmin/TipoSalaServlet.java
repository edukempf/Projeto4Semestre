/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.TipoSala;
import DAO.GenericDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
@WebServlet(name = "TipoSalaServlet", urlPatterns = {"/TipoSalaServlet"})
public class TipoSalaServlet extends HttpServlet {

    GenericDao<TipoSala> dao; 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao = new GenericDao<TipoSala>(TipoSala.class);

        HttpSession session = request.getSession();
        session.setAttribute("tipoSalaEditar", null);
        String param = request.getParameter("op");
        if (param.equals("listar")) {
            ArrayList<TipoSala> lista = (ArrayList<TipoSala>) dao.list();
            session.setAttribute("listaTipoSala", lista);
        } else if (param.equals("editar")) {
            TipoSala tsala = dao.get(Long.parseLong(request.getParameter("id")));
            session.setAttribute("tipoSalaEditar", tsala);
        }else if(param.equals("apagar")){
            dao.remove(Long.parseLong(request.getParameter("id")));
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TipoSala tsala = new TipoSala();
        tsala.setDescricao(request.getParameter("descricao"));
        dao = new GenericDao<TipoSala>(TipoSala.class);
         if (!"".equals(request.getParameter("id"))) {
            tsala.setId(Long.parseLong(request.getParameter("id")));
            dao.edit(tsala);
        } else {
            dao.insert(tsala);
        }
    }
}
