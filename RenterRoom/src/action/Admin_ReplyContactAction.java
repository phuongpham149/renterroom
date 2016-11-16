package action;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Contact;
import bo.ContactBo;
import bo.EmailUtility;
import dao.LibraryPer;

/**
 * Servlet implementation class Admin_ReplyContact
 */
@WebServlet("/Admin_ReplyContactAction")
public class Admin_ReplyContactAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_ReplyContactAction() {
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

		ContactBo contactBo = new ContactBo();
		String submit = request.getParameter("submit");
		boolean error = false;

		if (submit != null) {

			String email = request.getParameter("email");

			String subject = request.getParameter("subject");
			String content = request.getParameter("content");

			if (email != null) {
				System.out.println(subject.length() + " ab " + content.length());
				if (subject.equals("")) {
					error = true;
				}
				if (content.length() <= 36) {
					error = true;
				}
				if (error == true) {
					response.sendRedirect(request.getContextPath() + "/Admin_ContactListAction?msg=2");
					return;
				}

				// goi email
				String username = "chodoimotngaymai@gmail.com";
				String password = "20122017bk";

				String host = "smtp.gmail.com";
				String port = "465";

				try {
					EmailUtility.sendEmail(host, port, username, password, email, subject, content);
				} catch (AddressException e) {
					System.out.println("Eror address");
				} catch (MessagingException e) {
					System.out.println("Eror message");
				}

				// chuyen trang
				response.sendRedirect(request.getContextPath() + "/Admin_ContactListAction?msg=1");

			} else {
				response.sendRedirect(request.getContextPath() + "/Admin_ContactListAction?msg=0");
			}

		} else {
			// lay idContact
			String idContactStr = request.getParameter("idContact");

			int idContact = -1;

			if (idContactStr != null) {
				idContact = Integer.parseInt(idContactStr);
			}

			// lay du lieu
			Contact contact = contactBo.getContactDetail(idContact);

			request.setAttribute("contact", contact);

			RequestDispatcher rd = request.getRequestDispatcher("/admin/ContactReply.jsp");
			rd.forward(request, response);
		}
	}

}
