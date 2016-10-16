package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Database {
	private static Connection con = null;

	public static Connection connectDB() {
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				System.out.println("Error not find class");
				e.printStackTrace();
			}

			String connectionURL = "jdbc:mysql://localhost:3306/renterroom?useUnicode=true&characterEncoding=UTF-8";
			con = DriverManager.getConnection(connectionURL, "root", "");

		} catch (SQLException e) {
			System.out.println("Error connect");
			e.printStackTrace();
		}
		return con;

	}

	public static void closeConnection(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close connection !");
			e.printStackTrace();
		}
	}

	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close ResultSet !");
			e.printStackTrace();
		}
	}

	public static void closePrepareStatement(PreparedStatement pstmt) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close PreparedStatement  !");
			e.printStackTrace();
		}
	}

	public static void closeCallableStatement(CallableStatement cstmt) {
		try {
			if (cstmt != null) {
				cstmt.close();
			}
		} catch (SQLException e) {
			System.err.println("Can not close CallableStatement  !");
			e.printStackTrace();
		}
	}
}


