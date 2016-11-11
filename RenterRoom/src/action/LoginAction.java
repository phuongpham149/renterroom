package action;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Users;
import bo.UserBo;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginAction() {
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

		String submit = request.getParameter("submit");

		if (submit != null) {
			String userName = request.getParameter("username");
			String password = request.getParameter("password");

			if (userName.matches("^[a-zA-Z0-9]*$") == false) {
				response.sendRedirect(request.getContextPath()
						+ "/login.jsp?msg=2");
				return;
			}
			int role = -1;
			String passwordMd5 = "";

			// ma hoa md5
			MessageDigest msd;
			try {
				msd = MessageDigest.getInstance("MD5");
				byte[] srcTextBytes = password.getBytes("UTF-8");
				byte[] enrTextBytes = msd.digest(srcTextBytes);
				BigInteger big = new BigInteger(1, enrTextBytes);
				passwordMd5 = big.toString(16);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			UserBo userBo = new UserBo();
			Users user = userBo
					.getUserByUsernamePassword(userName, passwordMd5);

			if (user != null) {
				if (user.getStatus() == 1) {
					// bat session
					HttpSession session = request.getSession();
					session.setAttribute("user", user);

					// kiem tra role
					role = user.getRole();

					if (role == 0) {
						// chuyen den admin
						response.sendRedirect(request.getContextPath()
								+ "/Admin_RoomListAction");
						return;
					}
					if (role == 1) {
						// chuyen den host
						response.sendRedirect(request.getContextPath()
								+ "/Host_BookingListAction");
					}
					if (role == 2) {
						// chuyen den user
					}
				} else {
					response.sendRedirect(request.getContextPath()
							+ "/login.jsp?msg=1");
				}

			} else {
				response.sendRedirect(request.getContextPath()
						+ "/login.jsp?msg=0");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}

	}

}
