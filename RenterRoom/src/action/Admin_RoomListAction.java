package action;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class RoomListAction
 */
@WebServlet("/Admin_RoomListAction")
public class Admin_RoomListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_RoomListAction() {
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

		RoomBo roomBO = new RoomBo();
		ArrayList<Rooms> roomList = roomBO.getListRoom();

		request.setAttribute("roomList", roomList);

		RequestDispatcher rd = request.getRequestDispatcher("/admin/RoomList.jsp");
		rd.forward(request, response);
	}

}
