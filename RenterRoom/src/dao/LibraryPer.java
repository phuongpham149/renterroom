package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Users;

public class LibraryPer {
	static Users user = null;
	public boolean isLogin(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		user = (Users) session.getAttribute("user");
		if (user == null) {
			return false;
		} else {
			return true;
		}

	}
	
	public static Users getUserLogin(){
		return user;
	}

}
