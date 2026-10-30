package edu.sehs4701.edonor.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Edonor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String edonorname;
    private String email;
    private String password;

    public Edonor() {
        super();
    }

    public Edonor(Long id, String edonorname, String email, String password) {
        super();
        this.id = id;
        this.edonorname = edonorname;
        this.email = email;
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEdonorname() {
        return edonorname;

    }

    public void setEdonorname(String edonorname) {
        this.edonorname = edonorname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}