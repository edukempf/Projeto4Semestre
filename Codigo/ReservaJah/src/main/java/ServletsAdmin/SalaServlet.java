/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsAdmin;

import Class.Bloco;
import Class.Sala;
import Class.TipoSala;
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
 * @author eduardo
 */
@WebServlet(name = "SalaServlet", urlPatterns = {"/SalaServlet"})
public class SalaServlet extends HttpServlet {
 
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Sala sala= new Sala();
        sala.setNome(request.getParameter("nome"));
        sala.setCapacidade(Integer.parseInt(request.getParameter("capacidade")));
        
        GenericDao<Bloco> daoB=new GenericDao<Bloco>(Bloco.class);
        Bloco bloco=daoB.get(Long.parseLong(request.getParameter("bloco")));
        sala.setBlocoPertencente(bloco);
        
        GenericDao<TipoSala> daoT=new GenericDao<TipoSala>(TipoSala.class);
        TipoSala tipoSala=daoT.get(Long.parseLong(request.getParameter("tipo")));
        sala.setTipoSala(tipoSala);
        
    }

  
}
