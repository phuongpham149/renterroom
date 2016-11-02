package action;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FileUtils.DateUtils;
import bean.Rooms;
import bean.Users;
import bo.BookingBo;
import bo.RoomBo;

/**
 * Servlet implementation class Public_BookingRoom
 */
@WebServlet("/Public_BookingRoom")
public class Public_BookingRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Public_BookingRoom() {
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
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		BookingBo bookingBo = new BookingBo();
		int idRoom = 2;
		String submit = request.getParameter("submit");
		boolean error = false, check = false;
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("user");

		if (users != null) {
			if (submit != null) {
				DateUtils dateUtils = new DateUtils();
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				String dateTime = sdf.format(cal.getTime()).toString();
				Date timeCreated;
				timeCreated = dateUtils.convertToSDate(dateTime);
				String note = request.getParameter("note");
				check = bookingBo.addBooking(users.getIdUser(), idRoom, 0,
						note, timeCreated);
				if (check == false) {
					error = true;
				}
				if (error == true) {
					response.sendRedirect(request.getContextPath()
							+ "/Public_BookingRoom?msg=0");
				} else {
					response.sendRedirect(request.getContextPath()
							+ "/Public_BookingRoom?msg=1");
				}
			} else {
				RoomBo roomBo = new RoomBo();
				Rooms rooms = new Rooms();
				rooms = roomBo.getRoomDetail(idRoom);
				request.setAttribute("rooms", rooms);
				RequestDispatcher rd = request
						.getRequestDispatcher("/booking.jsp");
				rd.forward(request, response);
			}

		} else {
			// tra ve khi chua dang nhap
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
	}

}
