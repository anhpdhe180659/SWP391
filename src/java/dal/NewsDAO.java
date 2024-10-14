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

    public List<NewsItem> getTop3() {
        List<NewsItem> newsList = new ArrayList<>();
        try (
                Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery("SELECT Top(3) * FROM News ORDER BY Publish_date DESC")) {

            while (rs.next()) {
                NewsItem news = new NewsItem();
                news.setNewsID(rs.getInt("NewsID"));
                news.setTitle(rs.getString("Title"));
                news.setContent(rs.getString("Content"));
                news.setUserID(rs.getInt("UserID"));
                news.setPublishDate(rs.getTimestamp("Publish_date"));
                news.setCategory(rs.getString("Category"));
                news.setActive(rs.getBoolean("Is_active"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public List<NewsItem> getAllNews() {
        List<NewsItem> newsList = new ArrayList<>();
        try (
                Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery("SELECT * FROM News ORDER BY Publish_date DESC")) {

            while (rs.next()) {
                NewsItem news = new NewsItem();
                news.setNewsID(rs.getInt("NewsID"));
                news.setTitle(rs.getString("Title"));
                news.setContent(rs.getString("Content"));
                news.setUserID(rs.getInt("UserID"));
                news.setPublishDate(rs.getTimestamp("Publish_date"));
                news.setCategory(rs.getString("Category"));
                news.setActive(rs.getBoolean("Is_active"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    public NewsItem getNewsById(int newsId) {
        NewsItem news = null;
        String sql = "SELECT * FROM News WHERE newsID = ?";
        try (
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, newsId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    news = new NewsItem();
                    news.setNewsID(rs.getInt("NewsID"));
                    news.setTitle(rs.getString("Title"));
                    news.setContent(rs.getString("Content"));
                    news.setUserID(rs.getInt("UserID"));
                    news.setPublishDate(rs.getTimestamp("Publish_date"));
                    news.setCategory(rs.getString("Category"));
                    news.setActive(rs.getBoolean("Is_active"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return news;
    }

    public void addNews(NewsItem news) {
        String sql = "INSERT INTO News (title, content, userID, publish_date, category, is_active, last_modified) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, news.getTitle());
            pstmt.setString(2, news.getContent());
            pstmt.setInt(3, news.getUserID());
            pstmt.setTimestamp(4, news.getPublishDate());
            pstmt.setString(5, news.getCategory());
            pstmt.setBoolean(6, news.isActive());
            pstmt.setTimestamp(7, news.getLastModified());

            // Execute the update
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteNews(int id) {
        String sql = "DELETE FROM News WHERE newsID = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Add more methods as needed (e.g., insertNews, updateNews, deleteNews)
    }

    public static void main(String[] args) {
        NewsDAO dao = new NewsDAO();
        dao.deleteNews(3);
        List<NewsItem> list = dao.getAllNews();
        for (NewsItem newsItem : list) {
            System.out.println(newsItem);
        }
//        System.out.println(dao.getAllNews());
    }
}
