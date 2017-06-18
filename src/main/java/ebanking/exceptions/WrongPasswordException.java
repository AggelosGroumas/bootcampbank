package ebanking.exceptions;

/**
 * @author <a href="mailto:a.groumas@app-art.gr">Aggelos Groumas</a>
 */
public class WrongPasswordException extends Exception {
    /**
     * Constructs a new exception with the specified detail message.  The
     * cause is not initialized, and may subsequently be initialized by
     * a call to {@link #initCause}.
     *
     * @param message the detail message. The detail message is saved for
     *                later retrieval by the {@link #getMessage()} method.
     */
    public WrongPasswordException(String message) {
        super(message);
    }
}
