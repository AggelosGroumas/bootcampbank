package ebanking.model;

import ebanking.exceptions.WithdrawAmountException;

/**
 * @author <a href="mailto:a.groumas@app-art.gr">Aggelos Groumas</a>
 */
public class Account {
    private Integer id;
    private Double balance;
    private String name;

    public Account(Integer id, String name, Double balance) {
        this.balance = balance;
        this.name = name;
        this.id = id;
    }

    public Account(String name, Double balance) {
        this(null, name, balance);
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public Double incrementBalance(Double amount) {
        this.balance += amount;
        return this.balance;
    }

    public Double reduceBalance(Double amount) throws WithdrawAmountException {
        if (amount > this.balance) {
            throw new WithdrawAmountException("Amount you want to withdraw is greater than the balance");
        }
        this.balance -= amount;
        return this.balance;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", balance=" + balance +
                ", name='" + name + '\'' +
                '}';
    }
}
