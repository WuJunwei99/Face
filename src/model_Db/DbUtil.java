package model_Db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtil {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public int updateSQL(String sql) {
		int n = -1;
		try {
			con = DBConnection.getDBconnection();
			pstmt = con.prepareStatement(sql);
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			DBConnection.closeDB(con, pstmt, rs);
			e.printStackTrace();
		}
		return n;
	}
	
	public ResultSet QuerySQL(String sql) {
		try {
			con = DBConnection.getDBconnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			return rs;
		} catch (SQLException e){
			DBConnection.closeDB(con, pstmt, rs);
			e.printStackTrace();
		}
		return null;
	}
}
