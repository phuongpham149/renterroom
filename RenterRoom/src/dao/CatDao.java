package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Category;

public class CatDao {
	private Connection con = null;
	private CallableStatement cstmt = null;
	private ResultSet rs = null;

	private ArrayList<Category> categorys = null;
	private Category category = null;

	public ArrayList<Category> getListCat() {
		categorys = new ArrayList<Category>();
		try {
			con = Database.connectDB();
			String query = "{CALL getListCat()}";
			cstmt = con.prepareCall(query);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				category = new Category(rs.getInt("idCategory"),
						rs.getString("nameCategory"));
				categorys.add(category);
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}
		return categorys;
	}

	public boolean addCat(String nameCategory) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL addCat(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setString(1, nameCategory);
			result = cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		if (result > 0)
			return true;
		else
			return false;
	}

	public boolean delCat(int idCat) {
		int result = 0;
		try {
			con = Database.connectDB();
			String query = "{CALL delCat(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idCat);
			result = cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		if (result > 0)
			return true;
		else
			return false;
	}

	public Category getCatDetail(int idCat) {
		try {
			con = Database.connectDB();
			String query = "{CALL getCatDetail(?)}";
			cstmt = con.prepareCall(query);
			cstmt.setInt(1, idCat);
			rs = cstmt.executeQuery();
			while (rs.next()) {
				category = new Category(rs.getInt("idCategory"),
						rs.getString("nameCategory"));
			}
		} catch (SQLException e) {
			Database.closeConnection(this.con);
			Database.closePrepareStatement(cstmt);
			Database.closeResultSet(rs);
		}

		return category;
	}

}
