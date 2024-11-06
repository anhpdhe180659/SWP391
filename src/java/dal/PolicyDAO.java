package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.policy;

public class PolicyDAO extends DBContext {
    
    // Lấy tất cả các policies
    public List<policy> getAllPolicies() {
        List<policy> policyList = new ArrayList<>();
        try (
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM policies")
        ) {
            while (rs.next()) {
                policy policy = new policy();
                policy.setPolicyId(rs.getInt("policyid"));
                policy.setPolicyTitle(rs.getString("policytitle"));
                policy.setPolicyContext(rs.getString("policycontext"));
                policyList.add(policy);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return policyList;
    }
    
    // Lấy policy theo ID
    public policy getPolicyById(int policyId) {
        policy policy = null;
        String sql = "SELECT * FROM policies WHERE policyid = ?";
        try (
            PreparedStatement pstmt = connection.prepareStatement(sql)
        ) {
            pstmt.setInt(1, policyId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    policy = new policy();
                    policy.setPolicyId(rs.getInt("policyid"));
                    policy.setPolicyTitle(rs.getString("policytitle"));
                    policy.setPolicyContext(rs.getString("policycontext"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return policy;
    }
    
    // Thêm policy mới
    public void addPolicy(policy policy) {
        String sql = "INSERT INTO policies (policyid, policytitle, policycontext) VALUES (?, ?, ?)";
        try (
            PreparedStatement pstmt = connection.prepareStatement(sql)
        ) {
            pstmt.setInt(1, policy.getPolicyId());
            pstmt.setString(2, policy.getPolicyTitle());
            pstmt.setString(3, policy.getPolicyContext());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Cập nhật policy
    public void updatePolicy(policy policy) {
        String sql = "UPDATE policies SET policytitle = ?, policycontext = ? WHERE policyid = ?";
        try (
            PreparedStatement pstmt = connection.prepareStatement(sql)
        ) {
            pstmt.setString(1, policy.getPolicyTitle());
            pstmt.setString(2, policy.getPolicyContext());
            pstmt.setInt(3, policy.getPolicyId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Xóa policy
    public void deletePolicy(int policyId) {
        String sql = "DELETE FROM policies WHERE policyid = ?";
        try (
            PreparedStatement stmt = connection.prepareStatement(sql)
        ) {
            stmt.setInt(1, policyId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    // Main method để test
//    public static void main(String[] args) {
//        PolicyDAO dao = new PolicyDAO();
//        
//        
//        
//        // Test xóa policy
//        System.out.println("\nTest xóa policy:");
//        dao.deletePolicy(2);
//    }
}