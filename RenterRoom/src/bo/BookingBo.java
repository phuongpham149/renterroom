package bo;

import java.sql.Date;
import java.util.ArrayList;

import bean.Booking;
import dao.BookingDao;

public class BookingBo {
	BookingDao bookingDAO = new BookingDao();

	public ArrayList<Booking> getListBooking() {
		return bookingDAO.getListBooking();
	}

	public boolean addBooking(int userId, int roomId, int statusId,
			String note, Date timeCreate) {
		return bookingDAO
				.addBooking(userId, roomId, statusId, note, timeCreate);
	}

	public boolean delBooking(int id) {
		return bookingDAO.delBooking(id);
	}

	public Booking getBookingDetail(int idBooking) {
		System.out.println("BO");
		return bookingDAO.getBookingDetail(idBooking);
	}
}
