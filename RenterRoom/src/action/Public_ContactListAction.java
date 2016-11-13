package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.ContactBo;

/**
 * Servlet implementation class Public_ContactListAction
 */
@WebServlet("/Public_ContactListAction")
public class Public_ContactListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Public_ContactListAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("sent") != null) {
			String userName = new String(request.getParameter("userName")
					.getBytes("ISO-8859-1"), "UTF-8");
			String userEmail = new String(request.getParameter("userEmail")
					.getBytes("ISO-8859-1"), "UTF-8");
			String userPhone = new String(request.getParameter("userPhone")
					.getBytes("ISO-8859-1"), "UTF-8");
			String userMsg = new String(request.getParameter("userMsg")
					.getBytes("ISO-8859-1"), "UTF-8");
			/*
			 * Contact contact=new Contact(0, userName, userEmail, userPhone,
			 * userMsg);
			 */
			ContactBo contactBo = new ContactBo();
			boolean result = contactBo.addContact(userName, userEmail,
					userPhone, userMsg);
			if (result==true) {
				response.sendRedirect(request.getContextPath()+"/Public_ContactListAction?msg=1");
			}else{
				response.sendRedirect(request.getContextPath()+"/Public_ContactListAction?msg=0");
			}
		} else {
			request.getRequestDispatcher("/contact.jsp").forward(request,
					response);
		}
	}

}
