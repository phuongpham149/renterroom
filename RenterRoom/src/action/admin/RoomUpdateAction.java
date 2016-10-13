package action.admin;

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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("abc"+request.getParameter("idRoom"));
		int idRoom = Integer.parseInt(request.getParameter("idRoom"));
		
		RoomBo roomBO = new RoomBo();
		
		Rooms room = new Rooms();
		room.setIsActive(1);
		
		int check = roomBO.updateActiveRoom(room);
		
		if(check>0){
			response.sendRedirect(request.getContextPath() + "/RoomListAction?msg=1");
		}
		else{
			response.sendRedirect(request.getContextPath() + "/RoomListAction?msg=0");
		}
				
		
		
	}

}
