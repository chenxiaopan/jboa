package com.cxp.jboa.entity;

import java.math.BigDecimal;

public class Users {
    private BigDecimal id;

    private String username;

    private String password;

    private BigDecimal age;

    private BigDecimal sex;

    private String nickname;

    private BigDecimal mobile;

    private String address;

    private BigDecimal supper;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public BigDecimal getAge() {
        return age;
    }

    public void setAge(BigDecimal age) {
        this.age = age;
    }

    public BigDecimal getSex() {
        return sex;
    }

    public void setSex(BigDecimal sex) {
        this.sex = sex;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public BigDecimal getMobile() {
        return mobile;
    }

    public void setMobile(BigDecimal mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public BigDecimal getSupper() {
        return supper;
    }

    public void setSupper(BigDecimal supper) {
        this.supper = supper;
    }
}