package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import bo.CatBo;
import dao.LibraryPer;

/**
 * Servlet implementation class Admin_CategoryListAction
 */
@WebServlet("/Admin_CategoryListAction")
public class Admin_CategoryListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_CategoryListAction() {
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

		CatBo catBo = new CatBo();
		ArrayList<Category> catList = catBo.getListCat();

		request.setAttribute("catList", catList);

		RequestDispatcher rd = request.getRequestDispatcher("/admin/CategoryList.jsp");
		rd.forward(request, response);
	}

}
