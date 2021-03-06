package action;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Users;
import bo.EmailUtility;
import bo.UserBo;
import dao.LibraryPer;

/**
 * Servlet implementation class Admin_HostLockAction
 */
@WebServlet("/Admin_HostLockAction")
public class Admin_HostLockAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin_HostLockAction() {
		super();
		// TODO Auto-generated constructor stub
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
		request.setCharacterEncoding("UTF-8");

		UserBo userBo = new UserBo();
		String idLockHostStr = request.getParameter("idLockHost");

		int idLockHost = -1, check = -1;
		if (idLockHostStr != null) {
			idLockHost = Integer.parseInt(idLockHostStr);
		}

		if (idLockHost > 0) {

			check = userBo.lockHost(idLockHost);
			if (check > 0) {
				Users user = userBo.getUserDetail(idLockHost);

				String to = user.getEmail();
				String subject = "[RenterRoom] Notification to User";
				String message = "Account " + user.getUsername() + " are locked by Admin website renterroom.com.";
				String username = "chodoimotngaymai@gmail.com";
				String password = "20122017bk";

				String host = "smtp.gmail.com";
				String port = "465";

				try {
					EmailUtility.sendEmail(host, port, username, password, to, subject, message);
				} catch (AddressException e) {
					e.printStackTrace();
				} catch (MessagingException e) {
					e.printStackTrace();
				}

				// goi message
				response.sendRedirect(request.getContextPath() + "/Admin_HostListAction?msg=1");
			} else {
				response.sendRedirect(request.getContextPath() + "/Admin_HostListAction?msg=0");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/Admin_HostListAction?msg=0");
		}
	}

}
