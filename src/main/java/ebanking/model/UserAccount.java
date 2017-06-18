package ebanking.model;

/**
 * @author <a href="mailto:a.groumas@app-art.gr">Aggelos Groumas</a>
 */
public class UserAccount {
    private Integer id;
    private Integer userId;
    private Integer accountId;

    public UserAccount(Integer id, Integer userId, Integer accountId) {
        this.id = id;
        this.userId = userId;
        this.accountId = accountId;
    }

    public UserAccount(Integer userId, Integer accountId) {
        this(null, userId, accountId);
    }

    public Integer getId() {
        return id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }


    @Override
    public String toString() {
        return "UserAccount{" +
                "id=" + id +
                ", userId=" + userId +
                ", accountId=" + accountId +
                '}';
    }
}
