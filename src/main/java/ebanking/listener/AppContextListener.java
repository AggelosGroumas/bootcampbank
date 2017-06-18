package ebanking.listener;

import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

import static org.slf4j.LoggerFactory.getLogger;

/**
 * @author <a href="mailto:a.groumas@app-art.gr">Aggelos Groumas</a>
 */
@WebListener
public class AppContextListener implements ServletContextListener {
    private static final Logger LOGGER = getLogger(AppContextListener.class);

    public static final String CONN_ATTR_NAME = "dbconnection";

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext ctx = servletContextEvent.getServletContext();
        Context context;
        try {
            context = new InitialContext();
            DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/ebanking");
            Connection connection = ds.getConnection();
            Validate.notNull(connection, "DB connection cannot be null");
            ctx.setAttribute(CONN_ATTR_NAME, connection);
            LOGGER.info("Database connection initialized for Application.");
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        ServletContext ctx = servletContextEvent.getServletContext();
        Connection connection = (Connection) ctx.getAttribute(CONN_ATTR_NAME);
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
