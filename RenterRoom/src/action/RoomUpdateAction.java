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
@WebServlet("/RoomUpdateAction")
public class RoomUpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdateAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		int id = Integer.parseInt(request.getParameter("idRoom"));
		
		System.out.println("Update: " + id);
		RoomBo roomBo = new RoomBo();
		Rooms objRoom = new Rooms();
		objRoom.setIdRoom(id);
		
		int isEmpty = roomBo.getIsEmpty(id).getIsEmpty();
		objRoom.setIsEmpty(isEmpty==1 ? 0 : 1);
		
		roomBo.editIsEmptyRoom(objRoom);

		response.sendRedirect(request.getContextPath() + "/RoomListAction");
	}

}
