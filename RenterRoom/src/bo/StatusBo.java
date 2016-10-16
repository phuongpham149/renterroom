package bo;

import java.util.ArrayList;

import bean.Status;
import dao.StatusDao;

public class StatusBo {
	StatusDao statusDAO = new StatusDao();

	public ArrayList<Status> getListStatus() {
		return statusDAO.getListStatus();
	}

	public boolean addStatus(String nameStatus) {
		return statusDAO.addStatus(nameStatus);
	}

	public boolean delStatus(int id) {
		return statusDAO.delStatus(id);
	}

	public Status getStatusDetail(int idStatus) {
		return statusDAO.getStatusDetail(idStatus);
	}
}
