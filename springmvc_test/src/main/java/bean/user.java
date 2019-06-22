package bean;

import java.io.Serializable;
import java.util.Date;

/**
 * @author chen
 * @date 2019/5/22--20:07
 */
public class user implements Serializable {
    private String username;
    private Integer age;
    private Date date;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;

    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public user(String username, Integer age, Date date) {
        this.username = username;
        this.age = age;
        this.date = date;
    }

    public user() {
        super();
    }

    @Override
    public String toString() {
        return "user{" +
                "username='" + username + '\'' +
                ", age=" + age +
                ", date=" + date +
                '}';
    }
}
