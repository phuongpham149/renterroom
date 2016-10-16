package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.RoomBo;

/**
 * Servlet implementation class RoomUpdateAction
 */
@WebServlet("/Admin_RoomApproveAction")
public class Admin_RoomApproveAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_RoomApproveAction() {
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

		int idRoom = Integer.parseInt(request.getParameter("idRoom"));

		RoomBo roomBO = new RoomBo();
		int check = roomBO.updateActiveRoom(idRoom);

		if (check > 0) {
			response.sendRedirect(request.getContextPath()
					+ "/Admin_RoomListAction?msg=1");
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/Admin_RoomListAction?msg=0");
		}
	}

}
