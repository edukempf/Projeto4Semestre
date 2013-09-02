/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Bloco;
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
@WebServlet(name = "BlocoServlet", urlPatterns = {"/BlocoServlet"})
public class BlocoServlet extends HttpServlet {

  
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        
        Bloco bloco = new Bloco();
        bloco.setNome(request.getParameter("nome"));
        GenericDao<Bloco> dao=new GenericDao<Bloco>(Bloco.class);
        dao.insert(bloco);
        
    }

}
