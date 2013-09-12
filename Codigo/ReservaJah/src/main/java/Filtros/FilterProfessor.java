/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Filtros;

import Class.Usuario;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
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
 * @author eduardo
 */
@WebFilter(filterName = "FilterProfessor", urlPatterns = {"/Professor/*"})
public class FilterProfessor implements Filter {
    
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) request).getSession(false);
        if (session != null) {
            Usuario user = (Usuario) session.getAttribute("user");
            if (user == null) {
                session.setAttribute("erro", "Você não está logado no sistema!");
                ((HttpServletResponse) response).sendRedirect("../index.jsp");
            }else if (user.getTipo().getDescricao().equalsIgnoreCase("professor")) {
                chain.doFilter(request, response);
            }else if(user.getTipo().getDescricao().equalsIgnoreCase("admin")){
                ((HttpServletResponse) response).sendRedirect("../Admin/area_administrativa.jsp");
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
