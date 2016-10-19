package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Rooms;
import bo.RoomBo;

/**
 * Servlet implementation class RoomUpdateAction
 */
@WebServlet("/Host_RoomUpdateAction")
public class Host_RoomUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Host_RoomUpdateAction() {
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

		int id = Integer.parseInt(request.getParameter("idRoom"));

		System.out.println("Update: " + id);
		RoomBo roomBo = new RoomBo();
		Rooms objRoom = new Rooms();
		objRoom.setIdRoom(id);

		int isEmpty = roomBo.getIsEmpty(id).getIsEmpty();
		objRoom.setIsEmpty(isEmpty == 1 ? 0 : 1);

		roomBo.editIsEmptyRoom(isEmpty,id);

		response.sendRedirect(request.getContextPath() + "/Host_RoomListAction");
	}

}
