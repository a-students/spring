package entity;

import java.io.Serializable;

public class cookie implements Serializable {
    private String username;
    private String password;

    public cookie() {
        super();
    }

    public cookie(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "cookie{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
