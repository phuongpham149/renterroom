package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Booking;
import bean.Category;

public class BookingDao {
	Database db = new Database();
	public ArrayList<Booking> getListBooking() {
		ArrayList<Booking> listBooking = new ArrayList<Booking>();
		String query = "SELECT idBooking, booking.idUser, username,phoneNumber, address, idRoom, idStatus, note , timeCreated FROM  booking,users WHERE booking.idUser = users.idUser";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			Booking booking;
			while(rs.next()){
				booking = new Booking(rs.getInt("idBooking"),rs.getInt("idUser"), rs.getInt("idRoom"), rs.getInt("idStatus"),rs.getString("note"), rs.getString("timeCreated"), rs.getString("username"), rs.getString("phoneNumber"),rs.getString("address"));
				listBooking.add(booking);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listBooking;
	}
	public boolean addBooking(Booking booking) {
		String query = "INSERT INTO booking(idUser, idRoom, idStatus, note, timeCreated) VALUES (?,?,?,?)";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setInt(1, booking.getIdUser());
			pstm.setInt(2, booking.getIdRoom());
			pstm.setInt(3, booking.getIdStatus());
			pstm.setString(4, booking.getNote());
			check=pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(check>0){
			return true;
		}
		else{
			return false;
		}
		
	}
	public boolean delBooking(int id) {
		// TODO Auto-generated method stub
		String query = "delete from booking where idBooking=?";
		int check=0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setInt(1, id);
			check=pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(check>0){
			return true;
		}
		else{
			return false;
		}
	}
	public Booking getBookingDetail(int idBooking) {
		String query = "SELECT idBooking, idUser  idRoom, idStatus, note, timeCreated FROM  booking where idBooking = "+idBooking;
		Booking booking = null;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(query);
			
			while(rs.next()){
				booking = new Booking(rs.getInt("idBooking"),rs.getInt("idUser"), rs.getInt("idRoom"), rs.getInt("idStatus"),rs.getString("note"), rs.getString("timeCreated"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return booking;
	}
	public boolean editBooking(Booking booking) {
        String query = "UPDATE booking set idUser= '"+booking.getIdUser()+"'"
        		+ ", idRoom = '"+booking.getIdRoom()+"'"
        		+ ", idStatus = '"+booking.getIdStatus()+"'"
        		+ ", note = '"+booking.getNote()+"'"
        		+ ", timeCreated = '"+booking.getTimeCreated()+"' where idBooking= "+booking.getIdBooking();
		
		int check=0;
		try {
			Statement pstm = db.connectDB().createStatement();
			check = pstm.executeUpdate(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(check>0){
			return true;
		}
		else{
			return false;
		}
	}

}
