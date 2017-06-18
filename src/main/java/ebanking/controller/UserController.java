package ebanking.controller;

import ebanking.dao.AccountDao;
import ebanking.dao.UserAccountDAO;
import ebanking.dao.UserDAO;
import ebanking.listener.AppContextListener;
import ebanking.model.Account;
import ebanking.model.User;
import ebanking.model.UserAccount;

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
@WebServlet("/usercontroller")
public class UserController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd ;
        String username = req.getParameter("username");
        String name = req.getParameter("name");
        String lastname = req.getParameter("lastname");
        String pass = req.getParameter("password");
        String email = req.getParameter("emailAddress");

        Connection connection = (Connection) req.getServletContext().getAttribute(AppContextListener.CONN_ATTR_NAME);
        HttpSession session = req.getSession();

        UserDAO userDAO = new UserDAO(connection);
        AccountDao accountDao = new AccountDao(connection);
        UserAccountDAO userAccountDAO = new UserAccountDAO(connection);

        User newUser = new User(name, lastname, username, pass, email);
        Account account = new Account("initAccount", 0.0);

        int userId = userDAO.save(newUser);
        int accId = accountDao.save(account);
        int userAccId = -1;

        if (userId != -1 && accId != -1) {
            UserAccount userAccount = new UserAccount(userId, accId);
            userAccId = userAccountDAO.save(userAccount);
        }

        if (userId == -1 || accId == -1 || userAccId == -1) {
            req.setAttribute("errorMessage", "User could not be created!");
            rd = req.getServletContext().getRequestDispatcher("/login.jsp");
            rd.forward(req, resp);
        } else {
            session.setAttribute("user", newUser);
            session.setAttribute("account", account);

            rd = req.getServletContext().getRequestDispatcher("/home.jsp");
            rd.forward(req, resp);
        }

    }
}
