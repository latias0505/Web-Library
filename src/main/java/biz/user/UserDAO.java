package biz.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import biz.common.JDBCUtil;

public class UserDAO {
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	private static String USER_INSERT = "insert into users(id, password, name, role, phone) values (?, ?, ?, ?, ?)";
	private static String USER_GET_BY_ID = "SELECT * FROM users WHERE id = ?";
    private static String USER_GET_BY_NAME = "SELECT * FROM users WHERE name = ?";
    private static String USER_GET_BY_PHONE = "SELECT * FROM users WHERE phone = ?";
    private static String USER_GET_BY_ID_AND_PASSWORD = "SELECT * FROM users WHERE id = ? AND password = ?";
    private static String USER_UPDATE_STATUS = "UPDATE users SET status = ? WHERE id = ?";
    private static String USER_UPDATE = "UPDATE users SET password = ?, name = ?, phone = ? WHERE id = ?";
    private static String USER_GET_ALL = "SELECT * FROM users";
    private static String USER_UPDATE_ROLE = "UPDATE users SET role = ? WHERE id = ?";
    
    public void updateRole(String id, String role) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_UPDATE_ROLE);
            stmt.setString(1, role);
            stmt.setString(2, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }

    public void updateStatus(String id, String status) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_UPDATE_STATUS);
            stmt.setString(1, status);
            stmt.setString(2, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }

    
    public List<UserVO> getAllUsers() {
        List<UserVO> userList = new ArrayList<>();

        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_GET_ALL);
            rs = stmt.executeQuery();

            while (rs.next()) {
                UserVO user = new UserVO();
                user.setId(rs.getString("ID"));
                user.setPassword(rs.getString("PASSWORD"));
                user.setName(rs.getString("NAME"));
                user.setRole(rs.getString("ROLE"));
                user.setPhone(rs.getString("PHONE"));
                user.setStatus(rs.getString("STATUS"));
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }

        return userList;
    }
    
    public void updateUser(UserVO user) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_UPDATE);
			stmt.setString(1, user.getPassword());
			stmt.setString(2, user.getName());
			stmt.setString(3, user.getPhone());
			stmt.setString(4, user.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
    public void deleteUser(UserVO user) {
        try {
            conn = JDBCUtil.getConnection();
            // 테이블 이름이 "users"이고, 기본 키가 "id"인 것으로 가정합니다.
            String query = "DELETE FROM users WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, user.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
    
    public void updateStatus(UserVO user) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_UPDATE_STATUS);
            stmt.setString(1, user.getStatus());
            stmt.setString(2, user.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(stmt, conn);
        }
    }
    
    public boolean isIdExists(String id) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_GET_BY_ID);
            stmt.setString(1, id);
            rs = stmt.executeQuery();
            return rs.next(); // id가 이미 존재하면 true 반환
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return false; // 오류 발생 시 false 반환
    }

    public boolean isNameExists(String name) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_GET_BY_NAME);
            stmt.setString(1, name);
            rs = stmt.executeQuery();
            return rs.next(); // 이름이 이미 존재하면 true 반환
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return false; // 오류 발생 시 false 반환
    }

    public boolean isPhoneExists(String phone) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_GET_BY_PHONE);
            stmt.setString(1, phone);
            rs = stmt.executeQuery();
            return rs.next(); // 전화번호가 이미 존재하면 true 반환
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, conn);
        }
        return false; // 오류 발생 시 false 반환
    }
    
	public void insertUser(UserVO vo) {
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getRole());
			stmt.setString(5, vo.getPhone());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(USER_GET_BY_ID_AND_PASSWORD);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			rs = stmt.executeQuery();
			if (rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
				user.setPhone(rs.getString("PHONE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
}
