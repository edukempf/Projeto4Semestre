/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Bloco;
import DAO.GenericDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "BlocoServlet", urlPatterns = {"/BlocoServlet"})
public class BlocoServlet extends HttpServlet {

    GenericDao<Bloco> dao;
    PrintWriter out;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        dao = new GenericDao<Bloco>(Bloco.class);

        HttpSession session = request.getSession();
        session.setAttribute("blocoEditar", null);
        String param = request.getParameter("op");
        if (param.equals("listar")) {
            ArrayList<Bloco> lista = (ArrayList<Bloco>) dao.list();
            session.setAttribute("listaBloco", lista);
        } else if (param.equals("editar")) {
            Bloco bloco = dao.get(Long.parseLong(request.getParameter("id")));
            session.setAttribute("blocoEditar", bloco);
//            RequestDispatcher rq=request.getRequestDispatcher("Admin/area_administrativa.jsp");
//            request.setAttribute("blocoEditar", bloco);
//            rq.forward(request, response);
        }else if(param.equals("apagar")){
            dao.remove(Long.parseLong(request.getParameter("id")));
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        Bloco bloco = new Bloco();
        bloco.setNome(request.getParameter("nome"));
        dao = new GenericDao<Bloco>(Bloco.class);
        if (!"".equals(request.getParameter("id"))) {
            bloco.setId(Long.parseLong(request.getParameter("id")));
            dao.edit(bloco);
        } else {
            dao.insert(bloco);
        }
    }
}
