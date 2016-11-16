package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.CatBo;
import dao.LibraryPer;

/**
 * Servlet implementation class Admin_CategoryDeleteAction
 */
@WebServlet("/Admin_CategoryDeleteAction")
public class Admin_CategoryDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_CategoryDeleteAction() {
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

		String idCategoryStr = request.getParameter("idCategory");

		int idCategory = -1;

		if (idCategoryStr != null) {
			idCategory = Integer.parseInt(idCategoryStr);
		}

		CatBo catBo = new CatBo();
		boolean check = false;

		check = catBo.delCat(idCategory);

		if (check == true) {
			response.sendRedirect(request.getContextPath() + "/Admin_CategoryListAction?msg=1");
		} else {
			response.sendRedirect(request.getContextPath() + "/Admin_CategoryListAction?msg=0");
		}
	}

}
