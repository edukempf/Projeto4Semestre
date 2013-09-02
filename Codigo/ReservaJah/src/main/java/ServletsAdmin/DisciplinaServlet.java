/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Disciplina;
import Class.Usuario;
import DAO.GenericDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eduardo
 */
@WebServlet(name = "DisciplinaServlet", urlPatterns = {"/DisciplinaServlet"})
public class DisciplinaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Disciplina disciplina=new Disciplina();
        disciplina.setAbreviatura(request.getParameter("abreviatura"));
        disciplina.setNome(request.getParameter("nome"));
        GenericDao<Usuario> daoU=new GenericDao<Usuario>(Usuario.class);
        disciplina.setResponsavel(daoU.get(Long.parseLong(request.getParameter("responsavel"))));
        
        GenericDao<Disciplina> daoD=new GenericDao<Disciplina>(Disciplina.class);
        System.out.println("=============>"+disciplina.getResponsavel().getNome());
        daoD.insert(disciplina);
        
    }

}
