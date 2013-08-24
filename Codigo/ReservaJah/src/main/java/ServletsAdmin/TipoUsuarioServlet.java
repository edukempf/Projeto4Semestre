/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.TipoUsuario;
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
@WebServlet(name = "TipoUsuarioServlet", urlPatterns = {"/TipoUsuarioServlet"})
public class TipoUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        TipoUsuario tp=new TipoUsuario();
        tp.setDescricao(request.getParameter("descricao"));
        
        GenericDao<TipoUsuario> dao=new GenericDao<TipoUsuario>(TipoUsuario.class);
        dao.insert(tp);
    }

}
