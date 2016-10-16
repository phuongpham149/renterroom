package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Contact;

public class ContactDao {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;

	private ArrayList<Contact> contacts = null;
	private Contact contact = null;
	Database db = new Database();

	public ArrayList<Contact> getListContact() {
		contacts = new ArrayList<Contact>();
		try {
			con = Database.connectDB();
			String query = "{CALL getListContact()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				contact = new Contact(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5));
				contacts.add(contact);
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return contacts;
	}

	public boolean addContact(String nameContact, String email,
			String phoneNumber, String Content) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL addContact(?,?,?,?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, nameContact);
			cstmt.setString(2, email);
			cstmt.setString(3, phoneNumber);
			cstmt.setString(4, Content);
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

	public boolean delContact(int idContact) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL delContact(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idContact);
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

	public Contact getContactDetail(int idContact) {
		try {
			con = Database.connectDB();
			String query = "{CALL getContactDetail(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idContact);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				contact = new Contact(rs.getInt(1), rs.getString(2),
						rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		return contact;
	}

}
