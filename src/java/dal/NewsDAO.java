/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author LENOVO
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.NewsItem;

public class NewsDAO extends DBContext {
   
    public List<NewsItem> getAllNews() {
        List<NewsItem> newsList = new ArrayList<>();
        try (
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM NEWS_ITEMS ORDER BY post_date DESC")) {

            while (rs.next()) {
                NewsItem news = new NewsItem();
                news.setNewsID(rs.getInt("newsID"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setUserID(rs.getInt("UserID"));
                news.setPublishDate(rs.getTimestamp("publish_date"));
                news.setPostDate(rs.getTimestamp("post_date"));
                news.setCategory(rs.getString("category"));
                news.setActive(rs.getBoolean("is_active"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public NewsItem getNewsById(int newsId) {
        NewsItem news = null;
        String sql = "SELECT * FROM NEWS_ITEMS WHERE newsID = ?";
        try (
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, newsId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    news = new NewsItem();
                    news.setNewsID(rs.getInt("newsID"));
                    news.setTitle(rs.getString("title"));
                    news.setContent(rs.getString("content"));
                    news.setUserID(rs.getInt("UserID"));
                    news.setPublishDate(rs.getTimestamp("publish_date"));
                    news.setPostDate(rs.getTimestamp("post_date"));
                    news.setCategory(rs.getString("category"));
                    news.setActive(rs.getBoolean("is_active"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    } 
    public void addNews(NewsItem news) {
    String sql = "INSERT INTO NEWS_ITEMS (title, content, userID, publish_date, post_date, category, is_active, last_modified) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
    try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
        pstmt.setString(1, news.getTitle());
        pstmt.setString(2, news.getContent());
        pstmt.setInt(3, news.getUserID());
        pstmt.setTimestamp(4, news.getPublishDate());
        pstmt.setTimestamp(5, news.getPostDate());
        pstmt.setString(6, news.getCategory());
        pstmt.setBoolean(7, news.isActive());
        pstmt.setTimestamp(8, news.getLastModified());
        
        // Execute the update
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    // Add more methods as needed (e.g., insertNews, updateNews, deleteNews)
}
