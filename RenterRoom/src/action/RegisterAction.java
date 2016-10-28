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

import bean.Users;
import bo.UserBo;

/**
 * Servlet implementation class RegisterAction
 */
@WebServlet("/RegisterAction")
public class RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterAction() {
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
		UserBo userBo = new UserBo();
		Users user = null;
		int role = -1;

		if (submit != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phonenumber = request.getParameter("phonenumber");
			String roleStr = request.getParameter("role");
			String street = request.getParameter("street");
			String district = request.getParameter("district");
			String city = request.getParameter("city");

			if (username.matches("^[a-zA-Z0-9]*$") == false) {
				response.sendRedirect(request.getContextPath()
						+ "/register.jsp?msg=0");
				return;
			}

			user = userBo.getUserByUserName(username);
			if (user != null) {
				response.sendRedirect(request.getContextPath()
						+ "/register.jsp?msg=1");
				return;
			}

			if (roleStr != null) {
				role = Integer.parseInt(roleStr);
			}
			String address = street + " " + district + " " + city;

			// ma hoa md5
			MessageDigest msd;
			String passwordMd5 = "";
			try {
				msd = MessageDigest.getInstance("MD5");
				byte[] srcTextBytes = password.getBytes("UTF-8");
				byte[] enrTextBytes = msd.digest(srcTextBytes);
				BigInteger big = new BigInteger(1, enrTextBytes);
				passwordMd5 = big.toString(16);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}

			boolean check = userBo.addUser(username, passwordMd5, phonenumber,
					role, email, address);
			if (check) {
				response.sendRedirect(request.getContextPath()
						+ "/register.jsp?msg=2");
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/register.jsp?msg=3");
				return;
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/register.jsp");
		}
	}

}
