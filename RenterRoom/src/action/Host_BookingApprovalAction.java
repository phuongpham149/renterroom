package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Booking;
import bo.BookingBo;
import dao.LibraryPer;

/**
 * Servlet implementation class Host_BookingContactAction
 */
@WebServlet("/Host_BookingApprovalAction")
public class Host_BookingApprovalAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Host_BookingApprovalAction() {
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

		boolean check = false;
		int id = Integer.parseInt(request.getParameter("idBooking"));

		System.out.println("Update: " + id);

		BookingBo bookingBo = new BookingBo();
		Booking objBooking = new Booking();
		objBooking.setIdRoom(id);
		int status = objBooking.getIdStatus();
		objBooking.setIdStatus(status = 1);
		check = bookingBo.editStatusBooking(status, id);
		if (check) {
			response.sendRedirect(request.getContextPath() + "/Host_BookingListAction?msg=1");

		} else {
			response.sendRedirect(request.getContextPath() + "/Host_BookingListAction?msg=0");
		}

	}
}
