package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Rooms;
import bo.RoomBo;

/**
 * Servlet implementation class Public_ContactDetailAction
 */
@WebServlet("/Public_ContactDetailAction")
public class Public_ContactDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Public_ContactDetailAction() {
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
		int idRoom=Integer.parseInt(request.getParameter("idRoom"));
		RoomBo roomBo=new RoomBo();
		Rooms alRooms=roomBo.getRoomDetail(idRoom);
		alRooms.setAddress(alRooms.getStreet()+" "+alRooms.getDistrict()+" Đà Nẵng");
		request.setAttribute("alRooms", alRooms);
		request.getRequestDispatcher("/detail.jsp").forward(request, response);
	}

}
