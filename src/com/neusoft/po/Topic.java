package com.neusoft.po;

import java.util.Date;

public class Topic {
    private Integer topicId;

    private String topicTitle;

    private String topicImage;

    private String topicContext;

    private Date topicTime;

    private Integer topicLove;

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle == null ? null : topicTitle.trim();
    }

    public String getTopicImage() {
        return topicImage;
    }

    public void setTopicImage(String topicImage) {
        this.topicImage = topicImage == null ? null : topicImage.trim();
    }

    public String getTopicContext() {
        return topicContext;
    }

    public void setTopicContext(String topicContext) {
        this.topicContext = topicContext == null ? null : topicContext.trim();
    }

    public Date getTopicTime() {
        return topicTime;
    }

    public void setTopicTime(Date topicTime) {
        this.topicTime = topicTime;
    }

    public Integer getTopicLove() {
        return topicLove;
    }

    public void setTopicLove(Integer topicLove) {
        this.topicLove = topicLove;
    }
}