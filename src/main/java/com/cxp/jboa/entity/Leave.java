package com.cxp.jboa.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Leave {
    private BigDecimal id;

    private String name;

    private Date startTime;

    private Date endTime;

    private BigDecimal leaveDay;

    private String reason;

    private BigDecimal checkId;

    private BigDecimal status;

    private BigDecimal whoId;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public BigDecimal getLeaveDay() {
        return leaveDay;
    }

    public void setLeaveDay(BigDecimal leaveDay) {
        this.leaveDay = leaveDay;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public BigDecimal getCheckId() {
        return checkId;
    }

    public void setCheckId(BigDecimal checkId) {
        this.checkId = checkId;
    }

    public BigDecimal getStatus() {
        return status;
    }

    public void setStatus(BigDecimal status) {
        this.status = status;
    }

    public BigDecimal getWhoId() {
        return whoId;
    }

    public void setWhoId(BigDecimal whoId) {
        this.whoId = whoId;
    }
}