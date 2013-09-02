/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.TipoUsuario;
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
@WebServlet(name = "UsuariosServlet", urlPatterns = {"/UsuariosServlet"})
public class UsuariosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Usuario user= new Usuario();
        user.setEmail(request.getParameter("email"));
        user.setRegistro(request.getParameter("registro"));
        user.setNome(request.getParameter("nome"));
        user.setSenha(request.getParameter("senha"));
        GenericDao<TipoUsuario> daoTU=new GenericDao<TipoUsuario>(TipoUsuario.class);
        user.setTipo(daoTU.get(Long.parseLong(request.getParameter("tipo"))));
        
        GenericDao<Usuario> daoU=new GenericDao<Usuario>(Usuario.class);
        daoU.insert(user);
        
    }

}
