/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        GenericDao<Usuario> dao = new GenericDao<Usuario>(Usuario.class);
        ArrayList<Usuario> lista = (ArrayList<Usuario>) dao.list();
        boolean log = false;
        for (Usuario usuario : lista) {
            if (usuario.getRegistro().equalsIgnoreCase(login) && usuario.getSenha().equalsIgnoreCase(senha)) {
                log = true;
                session.setAttribute("user", usuario);
                if (usuario.getTipo().getDescricao().equalsIgnoreCase("Professor")) {
                    response.sendRedirect("Professor/area_professor.jsp");

                }else if(usuario.getTipo().getDescricao().equalsIgnoreCase("Admin")){
                    response.sendRedirect("Admin/area_administrativa.jsp");
                }
            }
        }
        if (!log) {
            session.setAttribute("erro", "Login e/ou senha inválidos!");
            response.sendRedirect("index.jsp");
        }
    }
}
