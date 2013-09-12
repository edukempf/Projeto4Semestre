/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Filtros;

import Class.Usuario;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eduardo
 */
@WebFilter(filterName = "FiltroAdmin", urlPatterns = {"/Admin/*"})
public class FiltroAdmin implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) request).getSession(false);
        if (session != null) {
            Usuario user = (Usuario) session.getAttribute("user");
            if (user == null) {
                session.setAttribute("erro", "Você não está logado no sistema!");
                ((HttpServletResponse) response).sendRedirect("../index.jsp");
            }else if (user.getTipo().getDescricao().equalsIgnoreCase("admin")) {
                chain.doFilter(request, response);
            }else if(user.getTipo().getDescricao().equalsIgnoreCase("professor")){
                ((HttpServletResponse) response).sendRedirect("../Professor/area_professor.jsp");
            }
        } else {
            session.setAttribute("erro", "Você não está logado no sistema!");
            ((HttpServletResponse) response).sendRedirect("../index.jsp");
        }
    }

    public void destroy() {
    }


    public void init(FilterConfig filterConfig) {
    }
}
