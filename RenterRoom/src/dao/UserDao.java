package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Users;

public class UserDao {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;

	private ArrayList<Users> users = null;
	private Users user = null;
	Database db = new Database();

	public ArrayList<Users> getListUser() {
		users = new ArrayList<Users>();
		try {
			con = Database.connectDB();
			String query = "{CALL getListUser()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				user = new Users(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getInt(8));
				users.add(user);
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return users;
	}

	public boolean addUser(String username, String password,
			String phoneNumber, int role, String email, String address) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL addUser(?,?,?,?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, username);
			cstmt.setString(2, password);
			cstmt.setString(3, phoneNumber);
			cstmt.setInt(4, role);
			cstmt.setString(5, email);
			cstmt.setString(6, address);

			result = cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		if (result > 0)
			return true;
		else
			return false;
	}

	public boolean delUser(int idUser) {

		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL delUser(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idUser);
			result = cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		if (result > 0)
			return true;
		else
			return false;
	}

	public Users getUserDetail(int idUser) {

		users = new ArrayList<Users>();
		try {
			con = Database.connectDB();
			String query = "{CALL getUserDetail(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idUser);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				user = new Users(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getInt(8));
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return user;
	}

	public ArrayList<Users> getListHost() {
		users = new ArrayList<Users>();
		try {
			con = Database.connectDB();
			String query = "{CALL getListHost()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				user = new Users(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getInt(8));
				users.add(user);
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return users;
	}

	public int lockHost(int idLockHost) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL lockHost(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idLockHost);
			result = cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
			return result;
	}

	public int unlockHost(int idLockHost) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL unlockHost(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idLockHost);
			result = cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
			return result;
	}
}
