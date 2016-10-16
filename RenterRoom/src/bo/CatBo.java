package bo;

import java.util.ArrayList;

import bean.Category;
import dao.CatDao;

public class CatBo {
	CatDao catDAO = new CatDao();

	public ArrayList<Category> getListCat() {
		return catDAO.getListCat();
	}

	public boolean addCat(String nameCat) {
		return catDAO.addCat(nameCat);
	}

	public boolean delCat(int id) {
		return catDAO.delCat(id);
	}

	public Category getCatDetail(int idCat) {
		return catDAO.getCatDetail(idCat);
	}
}
