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

/**
 * Servlet implementation class Admin_HostUnlockAction
 */
@WebServlet("/Admin_HostUnlockAction")
public class Admin_HostUnlockAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_HostUnlockAction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		UserBo userBo = new UserBo();
		String idUnlockHostStr = request.getParameter("idUnlockHost");

		int idUnlockHost = -1, check = -1;
		if (idUnlockHostStr != null) {
			idUnlockHost = Integer.parseInt(idUnlockHostStr);
		}
		if (idUnlockHost > 0) {

			check = userBo.unlockHost(idUnlockHost);
			if (check > 0) {
				Users user = userBo.getUserDetail(idUnlockHost);

				String to = user.getEmail();
				String subject = "[RenterRoom] Notification to User";
				String message = "Account " + user.getUsername()
						+ " are unlocked by Admin website renterroom.com.";
				String username = "chodoimotngaymai@gmail.com";
				String password = "20122017bk";

				String host = "smtp.gmail.com";
				String port = "465";

				try {
					EmailUtility.sendEmail(host, port, username, password, to,
							subject, message);
				} catch (AddressException e) {
					e.printStackTrace();
				} catch (MessagingException e) {
					e.printStackTrace();
				}

				// goi message
				response.sendRedirect(request.getContextPath()
						+ "/Admin_HostListAction?msg=1");
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/Admin_HostListAction?msg=0");
			}
		} else {
			response.sendRedirect(request.getContextPath()
					+ "/Admin_HostListAction?msg=0");
		}
	}
}
