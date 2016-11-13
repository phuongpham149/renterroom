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

/**
 * Servlet implementation class Public_RoomListAction
 */
@WebServlet("/Public_RoomListAction")
public class Public_RoomListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Public_RoomListAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		RoomBo roomBO = new RoomBo();
		ArrayList<Rooms> roomList = roomBO.getListRoom();
		request.setAttribute("roomList", roomList);
		System.out.println(roomList.size());
		// search Room
		if (request.getParameter("search") != null) {
			String location = new String(request.getParameter("location")
					.getBytes("ISO-8859-1"), "UTF-8");
			String cost = new String(request.getParameter("cost").getBytes(
					"ISO-8859-1"), "UTF-8");
			String type = new String(request.getParameter("type").getBytes(
					"ISO-8859-1"), "UTF-8");
			System.out.println(location);
			System.out.println(cost);
			System.out.println(type);
			if (location.equals("") && cost.equals("") && type.equals("")) {
				request.getRequestDispatcher("/index.jsp").forward(request,
						response);
				return;
			}
			RoomBo roomBo = new RoomBo();
			ArrayList<Rooms> alRooms = roomBo.searchRoom(location, cost, type);
			System.out.println(alRooms.size());
			if (alRooms.size() != 0) {
				request.setAttribute("alRooms", alRooms);
				request.getRequestDispatcher("/indexsearch.jsp").forward(request,
						response);
			} else {
				request.getRequestDispatcher("/indexsearch.jsp?msg=0").forward(request,
						response);
				
			}
		}else{
			RequestDispatcher rd = request
					.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		
	}

}
