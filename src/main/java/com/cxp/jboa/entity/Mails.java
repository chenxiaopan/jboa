package com.cxp.jboa.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Mails {
    private BigDecimal id;

    private String title;

    private String message;

    private Date pbtime;

    private BigDecimal fromOne;

    private BigDecimal toOne;

    private BigDecimal isRead;

    private BigDecimal isDel;

    private String attachment;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    public Date getPbtime() {
        return pbtime;
    }

    public void setPbtime(Date pbtime) {
        this.pbtime = pbtime;
    }

    public BigDecimal getFromOne() {
        return fromOne;
    }

    public void setFromOne(BigDecimal fromOne) {
        this.fromOne = fromOne;
    }

    public BigDecimal getToOne() {
        return toOne;
    }

    public void setToOne(BigDecimal toOne) {
        this.toOne = toOne;
    }

    public BigDecimal getIsRead() {
        return isRead;
    }

    public void setIsread(BigDecimal isRead) {
        this.isRead = isRead;
    }

    public BigDecimal getIsDel() {
        return isDel;
    }

    public void setIsDel(BigDecimal isDel) {
        this.isDel = isDel;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment == null ? null : attachment.trim();
    }
}