package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Users;
import bo.UserBo;

/**
 * Servlet implementation class Admin_HostListaction
 */
@WebServlet("/Admin_HostListaction")
public class Admin_HostListaction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_HostListaction() {
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

		UserBo userBo = new UserBo();
		ArrayList<Users> hostList = userBo.getListHost();
		System.out.println("size" + hostList.size());
		request.setAttribute("hostList", hostList);

		RequestDispatcher rd = request
				.getRequestDispatcher("/admin/UserList.jsp");
		rd.forward(request, response);
	}

}
