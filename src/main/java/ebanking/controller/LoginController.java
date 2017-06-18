package ebanking.controller;

import ebanking.dao.AccountDao;
import ebanking.dao.UserDAO;
import ebanking.exceptions.AccountNotFoundException;
import ebanking.exceptions.UserNotFoundException;
import ebanking.exceptions.WrongPasswordException;
import ebanking.listener.AppContextListener;
import ebanking.model.Account;
import ebanking.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

/**
 * @author <a href="mailto:a.groumas@app-art.gr">Aggelos Groumas</a>
 */
@WebServlet("/logincontroller")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd;
        String username = req.getParameter("username");
        String pass = req.getParameter("password");

        Connection connection = (Connection) req.getServletContext().getAttribute(AppContextListener.CONN_ATTR_NAME);

        HttpSession session = req.getSession();

        UserDAO userDao = new UserDAO(connection);
        AccountDao accountDao = new AccountDao(connection);

        try {
            User found = userDao.findUserByUsername(username);
            found.checkPassword(pass);
            Account account = accountDao.findUserByUsername(found.getUsername()).get(0);
            session.setAttribute("user", found);
            session.setAttribute("account", account);
            rd = getServletContext().getRequestDispatcher("/home.jsp");
        } catch (UserNotFoundException | WrongPasswordException | AccountNotFoundException e) {
            session.setAttribute("errorMessage", e.getMessage());
            rd = getServletContext().getRequestDispatcher("/login.jsp");
        }

        rd.forward(req, resp);
    }
}
