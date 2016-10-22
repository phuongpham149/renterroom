package bean;

import java.sql.Date;

public class Booking {
	private int idBooking;
	private int idUser;
	private int idRoom;
	private int idStatus;
	private String note;
	private Date timeCreated;
	private String username;
	private String phoneNumber;
	private String address;
	private String email;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public Booking(int idBooking, int idUser, int idRoom, int idStatus,
			String note, Date timeCreated, String username, String phoneNumber,
			String address, String email) {
		super();
		this.idBooking = idBooking;
		this.idUser = idUser;
		this.idRoom = idRoom;
		this.idStatus = idStatus;
		this.note = note;
		this.timeCreated = timeCreated;
		this.username = username;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.email = email;
	}

	public Booking(int idBooking, int idUser, int idRoom, int idStatus,
			String note, Date timeCreated, String username, String phoneNumber,
			String address) {
		super();
		this.idBooking = idBooking;
		this.idUser = idUser;
		this.idRoom = idRoom;
		this.idStatus = idStatus;
		this.note = note;
		this.timeCreated = timeCreated;
		this.username = username;
		this.phoneNumber = phoneNumber;
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Booking() {
		super();
	}

	public Booking(int idBooking, int idUser, int idRoom, int idStatus,
			String note, Date timeCreated) {
		super();
		this.idBooking = idBooking;
		this.idUser = idUser;
		this.idRoom = idRoom;
		this.idStatus = idStatus;
		this.note = note;
		this.timeCreated = timeCreated;
	}

	
	public Date getTimeCreated() {
		return timeCreated;
	}

	public void setTimeCreated(Date timeCreated) {
		this.timeCreated = timeCreated;
	}

	public String getName() {
		return username;
	}

	public void setName(String username) {
		this.username = username;
	}

	public int getIdBooking() {
		return idBooking;
	}

	public void setIdBooking(int idBooking) {
		this.idBooking = idBooking;
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public int getIdRoom() {
		return idRoom;
	}

	public void setIdRoom(int idRoom) {
		this.idRoom = idRoom;
	}

	public int getIdStatus() {
		return idStatus;
	}

	public void setIdStatus(int idStatus) {
		this.idStatus = idStatus;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
