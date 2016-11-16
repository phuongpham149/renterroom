package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Rooms;
import bo.RoomBo;
import dao.LibraryPer;

/**
 * Servlet implementation class Admin_RoomDetailServlet
 */
@WebServlet("/Admin_RoomDetailAction")
public class Admin_RoomDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_RoomDetailAction() {
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

		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		String idRoomStr = request.getParameter("idRoom");
		int idRoom = -1;

		if (idRoomStr != null) {
			idRoom = Integer.parseInt(idRoomStr);
		}

		RoomBo roomBo = new RoomBo();
		Rooms room = roomBo.getRoomDetail(idRoom);

		request.setAttribute("room", room);

		RequestDispatcher rd = request.getRequestDispatcher("/admin/RoomDetail.jsp");
		rd.forward(request, response);
	}

}
