package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Rooms;

public class RoomDao {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;

	private ArrayList<Rooms> rooms = null;
	private Rooms room = null;
	Database db = new Database();

	public ArrayList<Rooms> getListRoom() {

		rooms = new ArrayList<Rooms>();
		try {
			con = Database.connectDB();
			String query = "{CALL getListRoom()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				room = new Rooms(rs.getInt(1), rs.getInt(2), rs.getInt(3),
						rs.getInt(5), rs.getString(6), rs.getInt(7),
						rs.getDate(8), rs.getDate(9), rs.getInt(10),
						rs.getString(11), rs.getString(12), rs.getString(13),
						rs.getString(14), rs.getString(4));
				rooms.add(room);
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return rooms;
	}

	public boolean addRoom(int idUser, int idCategory, int cost,
			String description, int isActive, Date timeCreated,
			Date timeUpdate, int isEmpty, String nameRoom, String image,
			String street, String district) {

		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL addRoom(?,?,?,?,?,?,?,?,?,?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idUser);
			cstmt.setInt(2, idCategory);
			cstmt.setInt(3, cost);
			cstmt.setString(4, description);
			cstmt.setInt(5, isActive);
			cstmt.setDate(6, timeCreated);
			cstmt.setDate(7, timeUpdate);
			cstmt.setInt(8, isEmpty);
			cstmt.setString(9, nameRoom);
			cstmt.setString(10, image);
			cstmt.setString(11, street);
			cstmt.setString(12, district);
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

	public boolean delRoom(int idRoom) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL delRoom(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idRoom);
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

	public Rooms getRoomDetail(int idRoom) {

		try {
			con = Database.connectDB();
			String query = "{CALL getRoomDetail(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idRoom);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				room = new Rooms(rs.getInt(1), rs.getInt(2), rs.getInt(3),
						rs.getInt(4), rs.getString(5), rs.getInt(6),
						rs.getDate(7), rs.getDate(8), rs.getInt(9),
						rs.getString(10), rs.getString(11), rs.getString(12),
						rs.getString(13));
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		return room;
	}

	public boolean editIsEmptyRoom(int isEmpty, int idRoom) {

		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL editIsEmptyRoom(?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, isEmpty);
			cstmt.setInt(2, idRoom);
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

	public Rooms getIsEmpty(int idRoom) {
		try {
			con = Database.connectDB();
			String query = "{CALL getIsEmpty(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idRoom);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				room = new Rooms();
				room.setIsEmpty(rs.getInt("isEmpty"));
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		return room;
	}

	public int updateActiveRoom(int idRoom) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL updateActiveRoom(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idRoom);
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