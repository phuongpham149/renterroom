package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Users;

public class LibraryPer {

	public boolean isLogin(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		if (user == null) {
			return false;
		} else {
			return true;
		}

	}

}
