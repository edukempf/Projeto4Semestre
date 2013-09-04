/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Sala;
import Class.TipoUsuario;
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
@WebServlet(name = "UsuariosServlet", urlPatterns = {"/UsuariosServlet"})
public class UsuariosServlet extends HttpServlet {
GenericDao<Usuario> daoU;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        daoU=new GenericDao<Usuario>(Usuario.class);
        
        HttpSession session = request.getSession();
        session.setAttribute("usuarioEditar", null);
        String param = request.getParameter("op");
        
        if (param.equals("listar")) {
            ArrayList<Usuario> lista = (ArrayList<Usuario>) daoU.list();
            session.setAttribute("listaUsuario", lista);
        } else if (param.equals("editar")) {
            Usuario user = daoU.get(Long.parseLong(request.getParameter("id")));
            session.setAttribute("usuarioEditar", user);
        }else if(param.equals("apagar")){
            daoU.remove(Long.parseLong(request.getParameter("id")));
        }else if(param.equals("listar_professores")){
            ArrayList<Usuario> professores=(ArrayList<Usuario>) daoU.listParamInteiro(Long.parseLong("1"));
            session.setAttribute("listaProfessores", professores);
        }
        response.sendRedirect("Admin/area_administrativa.jsp");
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
        
        daoU=new GenericDao<Usuario>(Usuario.class);
        if (!"".equals(request.getParameter("id"))) {
            user.setId(Long.parseLong(request.getParameter("id")));
            daoU.edit(user);
        } else {
            daoU.insert(user);
        }
        
    }

}
