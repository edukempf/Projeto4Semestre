/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

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
 * @author Eduardo
 */
@WebServlet(name = "TipoUsuarioServlet", urlPatterns = {"/TipoUsuarioServlet"})
public class TipoUsuarioServlet extends HttpServlet {

    GenericDao<TipoUsuario> dao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao = new GenericDao<TipoUsuario>(TipoUsuario.class);

        HttpSession session = request.getSession();
        session.setAttribute("tipoUsuarioEditar", null);
        String param = request.getParameter("op");
        if (param.equals("listar")) {
            ArrayList<TipoUsuario> lista = (ArrayList<TipoUsuario>) dao.list();
            session.setAttribute("listaTipoUsuario", lista);
        } else if (param.equals("editar")) {
            TipoUsuario tuser = dao.get(Long.parseLong(request.getParameter("id")));
            session.setAttribute("tipoUsuarioEditar", tuser);
        }else if(param.equals("apagar")){
             try {
                dao.remove(Long.parseLong(request.getParameter("id")));
                session.setAttribute("sucessoExcluir", true);
            } catch (Exception e) {
                
                session.setAttribute("erroExcluir", true);
                dao.getEntityManager().clear();
            }
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TipoUsuario tp = new TipoUsuario();
        tp.setDescricao(request.getParameter("descricao"));
        dao = new GenericDao<TipoUsuario>(TipoUsuario.class);
        System.out.println(request.getParameter("id"));
        if (!"".equals(request.getParameter("id"))) {
            tp.setId(Long.parseLong(request.getParameter("id")));
            dao.edit(tp);
        } else {
            dao.insert(tp);
        }
    }
}
