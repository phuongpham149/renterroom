package action;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Booking;
import bo.BookingBo;
import bo.EmailUtility;
import dao.LibraryPer;

/**
 * Servlet implementation class Host_BookingContactAction
 */
@WebServlet("/Host_BookingContactAction")
public class Host_BookingContactAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Host_BookingContactAction() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LibraryPer lPermission = new LibraryPer();
		if (!lPermission.isLogin(request, response)) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		BookingBo bookingBo = new BookingBo();
		String submit = request.getParameter("submit");
		boolean error = false;

		if (submit != null) {

			String email = request.getParameter("email");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			if (email != null) {
				if (subject.equals("")) {
					error = true;
				}
				if (content.length() <= 36) {
					error = true;
				}
				if (error == true) {
					response.sendRedirect(request.getContextPath() + "/Host_BookingListAction?msg=2");
					return;
				}
				// goi email
				String username = "chodoimotngaymai@gmail.com";
				String password = "20122017bk";

				String host = "smtp.gmail.com";
				String port = "465";

				try {
					EmailUtility.sendEmail(host, port, username, password, email, subject, content);
				} catch (AddressException e) {
					System.out.println("Eror address");
				} catch (MessagingException e) {
					System.out.println("Eror message");
				}

				// chuyen trang
				response.sendRedirect(request.getContextPath() + "/Host_BookingListAction?msg=1");

			} else {
				response.sendRedirect(request.getContextPath() + "/Host_BookingListAction?msg=0");
			}

		} else {

			String idBookingStr = request.getParameter("idBooking");
			int idBooking = -1;
			if (idBookingStr != null) {
				idBooking = Integer.parseInt(idBookingStr);
			}
			Booking booking = bookingBo.getBookingDetail(idBooking);
			request.setAttribute("booking", booking);

			RequestDispatcher rd = request.getRequestDispatcher("/host/BookingReply.jsp");
			rd.forward(request, response);
		}
	}

}
