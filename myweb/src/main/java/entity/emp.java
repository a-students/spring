package entity;

import java.io.Serializable;

public class emp implements Serializable {
    private String empname;
    private String gender;
    private String email;
    private String depname;

    public emp() {
        super();
    }

    public emp(String empname, String gender, String email, String depname) {
        this.empname = empname;
        this.gender = gender;
        this.email = email;
        this.depname = depname;
    }

    public String getEmpname() {
        return empname;
    }

    public void setEmpname(String empname) {
        this.empname = empname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepname() {
        return depname;
    }

    public void setDepname(String depname) {
        this.depname = depname;
    }

    @Override
    public String toString() {
        return "emp{" +
                "empname='" + empname + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", depname='" + depname + '\'' +
                '}';
    }
}
