/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Disciplina;
import Class.Usuario;
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
@WebServlet(name = "DisciplinaServlet", urlPatterns = {"/DisciplinaServlet"})
public class DisciplinaServlet extends HttpServlet {

    GenericDao<Disciplina> daoD;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        daoD=new GenericDao<Disciplina>(Disciplina.class);
        
        HttpSession session = request.getSession();
        session.setAttribute("disciplinaEditar", null);
        String param = request.getParameter("op");
        
        if (param.equals("listar")) {
            ArrayList<Disciplina> lista = (ArrayList<Disciplina>) daoD.list();
            session.setAttribute("listaDisciplina", lista);
        } else if (param.equals("editar")) {
            Disciplina user = daoD.get(Long.parseLong(request.getParameter("id")));
            session.setAttribute("disciplinaEditar", user);
        }else if(param.equals("apagar")){
            daoD.remove(Long.parseLong(request.getParameter("id")));
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Disciplina disciplina = new Disciplina();
        disciplina.setAbreviatura(request.getParameter("abreviatura"));
        disciplina.setNome(request.getParameter("nome"));
        disciplina.setNumParticipantes(Integer.parseInt(request.getParameter("participantes")));
        GenericDao<Usuario> daoU = new GenericDao<Usuario>(Usuario.class);
        disciplina.setResponsavel(daoU.get(Long.parseLong(request.getParameter("responsavel"))));

        daoD = new GenericDao<Disciplina>(Disciplina.class);
        if (!"".equals(request.getParameter("id"))) {
            disciplina.setId(Long.parseLong(request.getParameter("id")));
            daoD.edit(disciplina);
        } else {
            daoD.insert(disciplina);
        }

    }
}
