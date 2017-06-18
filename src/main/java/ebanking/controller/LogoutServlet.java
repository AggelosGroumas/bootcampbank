package ebanking.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author <a href="mailto:a.groumas@app-art.gr">Aggelos Groumas</a>
 */
@WebServlet("/logoutcontroller")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        request.setAttribute("message", "Logged out!");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
        session.invalidate();
        dispatcher.forward(request, response);

    }
}
