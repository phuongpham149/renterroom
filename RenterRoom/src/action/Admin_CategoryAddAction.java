package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.CatBo;

/**
 * Servlet implementation class Admin_CategoryAddAction
 */
@WebServlet("/Admin_CategoryAddAction")
public class Admin_CategoryAddAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_CategoryAddAction() {
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
		request.setCharacterEncoding("UTF-8");

		String submit = request.getParameter("submit");
		CatBo catBo = new CatBo();
		boolean error = false, check = false;

		if (submit != null) {
			String nameCategory = request.getParameter("nameCat");
			if (nameCategory.equals("")) {
				System.out.println("1");
				error = true;
			}
			if (nameCategory.length() < 6) {
				System.out.println("2");
				error = true;
			}
			if (error == true) {
				response.sendRedirect(request.getContextPath()
						+ "/Admin_CategoryListAction?msg=2");
				return;
			}
			check = catBo.addCat(nameCategory);
			if (check == false) {
				error = true;
			}
			if (error == true) {
				response.sendRedirect(request.getContextPath()
						+ "/Admin_CategoryListAction?msg=0");
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/Admin_CategoryListAction?msg=1");
			}
		} else {
			RequestDispatcher rd = request
					.getRequestDispatcher("/admin/CategoryAdd.jsp");
			rd.forward(request, response);
		}
	}

}
