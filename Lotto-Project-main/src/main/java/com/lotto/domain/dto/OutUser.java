package com.lotto.domain.dto;

import java.sql.Timestamp;

public class OutUser {
    private Integer id;
    private String email;
    private String name;
    private Timestamp createAt;

    public OutUser(Integer id, String email, String name, Timestamp createAt) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.createAt = createAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }
}
