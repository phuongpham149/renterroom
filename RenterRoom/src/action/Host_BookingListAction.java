package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Booking;
import bean.Rooms;
import bo.BookingBo;
import bo.RoomBo;

/**
 * Servlet implementation class Host_BookingListAction
 */
@WebServlet("/Host_BookingListAction")
public class Host_BookingListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Host_BookingListAction() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		BookingBo list = new BookingBo();
		ArrayList<Booking> listBooking = list.getListBooking();

		request.setAttribute("listBooking", listBooking);
		RequestDispatcher rd = request
				.getRequestDispatcher("host/BookingList.jsp");
		rd.forward(request, response);
	}

}
