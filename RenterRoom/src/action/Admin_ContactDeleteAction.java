package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.ContactBo;
import dao.LibraryPer;

/**
 * Servlet implementation class Admin_ContactDeleteAction
 */
@WebServlet("/Admin_ContactDeleteAction")
public class Admin_ContactDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_ContactDeleteAction() {
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

		String idContractStr = request.getParameter("idContact");
		int idContact = -1;
		boolean check = false;

		if (idContractStr != null) {
			idContact = Integer.parseInt(idContractStr);
		}
		if (idContact < 0) {
			response.sendRedirect(request.getContextPath() + "/Admin_ContactListAction?msg=0");
			return;
		}

		ContactBo contactBo = new ContactBo();

		check = contactBo.delContact(idContact);
		if (check == true) {
			response.sendRedirect(request.getContextPath() + "/Admin_ContactListAction?msg=3");
		} else {
			response.sendRedirect(request.getContextPath() + "/Admin_ContactListAction?msg=0");
		}

	}

}
