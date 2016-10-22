package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Booking;

public class BookingDao {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;

	private ArrayList<Booking> bookings = null;
	private Booking booking = null;

	public ArrayList<Booking> getListBooking() {
		bookings = new ArrayList<Booking>();

		try {
			con = Database.connectDB();
			String query = "{CALL getListBooking()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				booking = new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(6),
						rs.getInt(7), rs.getString(8), rs.getDate(9),
						rs.getString(3), rs.getString(4), rs.getString(5));
				bookings.add(booking);
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		return bookings;
	}

	public boolean addBooking(int userId, int roomId, int statusId,
			String note, Date timeCreate) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL addBooking(?,?,?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
			cstmt.setInt(2, roomId);
			cstmt.setInt(3, statusId);
			cstmt.setString(4, note);
			cstmt.setDate(5, timeCreate);
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

	public boolean delBooking(int userId) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL delBooking(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, userId);
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

	public Booking getBookingDetail(int idBooking) {
		System.out.println("DAO");
		try {
			con = Database.connectDB();
			String query = "{CALL getBookingDetail(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idBooking);
			System.out.println("id " + idBooking);
			rs = cstmt.executeQuery();
			if (rs.next()) {
				booking = new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(3),
						rs.getInt(4), rs.getString(5), rs.getDate(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return booking;
	}

	public int ApprovalBooking(int idApprovalBooking) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL ApprovalBooking(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idApprovalBooking);
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

	public int unApprovalBooking(int idApprovalBooking) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL unApprovalBooking(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idApprovalBooking);
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

	public Boolean editStatusBooking(int status, int idBooking) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL editStatusBooking(?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, status);
			cstmt.setInt(2, idBooking);
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
}
