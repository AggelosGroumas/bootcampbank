package ebanking.controller;

import ebanking.dao.AccountDao;
import ebanking.exceptions.AccountNotFoundException;
import ebanking.exceptions.WithdrawAmountException;
import ebanking.listener.AppContextListener;
import ebanking.model.Account;
import ebanking.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

/**
 * @author <a href="mailto:a.groumas@app-art.gr">Aggelos Groumas</a>
 */
@WebServlet("/transfertopupcontroller")
public class TransferTopupController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd;
        Connection connection = (Connection) req.getServletContext().getAttribute(AppContextListener.CONN_ATTR_NAME);
        User user = (User) req.getSession().getAttribute("user");
        Double amount = Double.valueOf(req.getParameter("amount"));

        if (req.getParameter("transferToAccount") == null) {
            AccountDao accountDao = new AccountDao(connection);
            try {
                Account account = accountDao.findUserByUsername(user.getUsername()).get(0);
                Account updatedAccount = accountDao.depositAmount(amount, account.getId());
                req.getSession().setAttribute("account", updatedAccount);
            } catch (AccountNotFoundException e) {
                req.setAttribute("errorMessage", e.getMessage());
            }
            rd = req.getRequestDispatcher("/TransferTopup.jsp");
            rd.forward(req, resp);
        } else {
            Integer targetAccountId = Integer.parseInt(req.getParameter("transferToAccount"));
            AccountDao accountDao = new AccountDao(connection);
            try {
                Account targetAccount = accountDao.findById(targetAccountId);
                Account sourceAccount = accountDao.findUserByUsername(user.getUsername()).get(0);

                Account sourceAccountUpdated = accountDao.withdrawAmount(amount, sourceAccount.getId());
                accountDao.depositAmount(amount, targetAccount.getId());

                req.getSession().setAttribute("account", sourceAccountUpdated);
                req.setAttribute("message", "Transfer complete!");
            } catch (AccountNotFoundException | WithdrawAmountException e) {
                req.setAttribute("errorMessage", e.getMessage());
            }
            rd = req.getRequestDispatcher("/TransferTopup.jsp");
            rd.forward(req, resp);
        }
    }
}
