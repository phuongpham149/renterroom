package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Status;

public class StatusDao {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;

	private ArrayList<Status> statuses = null;
	private Status status = null;
	Database db = new Database();

	public ArrayList<Status> getListStatus() {

		statuses = new ArrayList<Status>();
		try {
			con = Database.connectDB();
			String query = "{CALL getListStatus()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				status = new Status(rs.getInt(1), rs.getString(2));
				statuses.add(status);
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return statuses;
	}

	public boolean addStatus(String nameStatus) {

		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL addStatus(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, nameStatus);
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

	public boolean delStatus(int idStatus) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL delStatus(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idStatus);
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

	public Status getStatusDetail(int idStatus) {
		try {
			con = Database.connectDB();
			String query = "{CALL getStatusDetail(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idStatus);
			rs = cstmt.executeQuery();
			if (rs.next()) {
				status = new Status(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return status;

	}
}
