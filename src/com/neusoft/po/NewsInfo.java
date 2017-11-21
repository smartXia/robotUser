package com.neusoft.po;

import java.util.Date;

public class NewsInfo {
    private Integer newsId;

    private String newsTitle;

    private String newsContext;

    private Integer newsAuthor;

    private Integer newsType;

    private Date newsDate;

    private String newsImages;

    private Integer newsRead;

    private String newsCommit;
    

    /* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "NewsInfo [newsId=" + newsId + ", newsTitle=" + newsTitle
				+ ", newsContext=" + newsContext + ", newsAuthor=" + newsAuthor
				+ ", newsType=" + newsType + ", newsDate=" + newsDate
				+ ", newsImages=" + newsImages + ", newsRead=" + newsRead
				+ ", newsCommit=" + newsCommit + "]";
	}

	public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle == null ? null : newsTitle.trim();
    }

    public String getNewsContext() {
        return newsContext;
    }

    public void setNewsContext(String newsContext) {
        this.newsContext = newsContext == null ? null : newsContext.trim();
    }

    public Integer getNewsAuthor() {
        return newsAuthor;
    }

    public void setNewsAuthor(Integer newsAuthor) {
        this.newsAuthor = newsAuthor;
    }

    public Integer getNewsType() {
        return newsType;
    }

    public void setNewsType(Integer newsType) {
        this.newsType = newsType;
    }

    public Date getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
    }

    public String getNewsImages() {
        return newsImages;
    }

    public void setNewsImages(String newsImages) {
        this.newsImages = newsImages == null ? null : newsImages.trim();
    }

    public Integer getNewsRead() {
        return newsRead;
    }

    public void setNewsRead(Integer newsRead) {
        this.newsRead = newsRead;
    }

    public String getNewsCommit() {
        return newsCommit;
    }

    public void setNewsCommit(String newsCommit) {
        this.newsCommit = newsCommit == null ? null : newsCommit.trim();
    }
}