/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
import java.sql.Timestamp;

public class NewsItem {
    private int newsID;
    private String title;
    private String content;
    private int userID;
    private Timestamp publishDate;
    private Timestamp postDate;
    private String category;
    private boolean isActive;
    private Timestamp lastModified;

    // Default constructor
    public NewsItem() {}

    // Constructor with all fields
    public NewsItem(int newsID, String title, String content, int userID, Timestamp publishDate,
                    Timestamp postDate, String category, boolean isActive, Timestamp lastModified) {
        this.newsID = newsID;
        this.title = title;
        this.content = content;
        this.userID = userID;
        this.publishDate = publishDate;
        this.postDate = postDate;
        this.category = category;
        this.isActive = isActive;
        this.lastModified = lastModified;
    }

    // Getters and Setters
    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Timestamp getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Timestamp publishDate) {
        this.publishDate = publishDate;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public Timestamp getLastModified() {
        return lastModified;
    }

    public void setLastModified(Timestamp lastModified) {
        this.lastModified = lastModified;
    }

    @Override
    public String toString() {
        return "NewsItem{" +
                "newsID=" + newsID +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", userID=" + userID +
                ", publishDate=" + publishDate +
                ", postDate=" + postDate +
                ", category='" + category + '\'' +
                ", isActive=" + isActive +
                ", lastModified=" + lastModified +
                '}';
    }
}