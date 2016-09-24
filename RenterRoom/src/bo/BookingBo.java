package bo;

import java.util.ArrayList;

import bean.Booking;
import dao.BookingDao;

public class BookingBo {
	BookingDao bookingDAO = new BookingDao();
	public ArrayList<Booking> getListBooking() {
		// TODO Auto-generated method stub
		return bookingDAO.getListBooking();
	}
	public boolean addBooking(Booking booking) {
		// TODO Auto-generated method stub
		return bookingDAO.addBooking(booking);
	}
	public boolean delBooking(int id) {
		// TODO Auto-generated method stub
		return bookingDAO.delBooking(id);
	}
	public Booking getBookingDetail(int idBooking) {
		
		return bookingDAO.getBookingDetail(idBooking);
	}
	public boolean editBooking(Booking booking) {
		// TODO Auto-generated method stub
		return bookingDAO.editBooking(booking);
	}

}
