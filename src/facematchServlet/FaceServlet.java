package facematchServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import model_Db.DbUtil;
import java.sql.*;
import model_FaceMatch.FaceMatch;
/**
 * Servlet implementation class FaceServlet
 */
@WebServlet("/FaceServlet")
public class FaceServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String base = request.getParameter("base");
		System.out.println(base);
		String sql = "select studentnum,base64 from facemessage";
		DbUtil run = new DbUtil();
		String base64="";
		String studentnum="";
		FaceMatch face=new FaceMatch();
		ResultSet rs = run.QuerySQL(sql);
		double score=0;
		boolean result = false;
		try {
			while(rs.next()){
				studentnum =rs.getString("studentnum");
				 base64=rs.getString("base64");
				 score = face.matchFace(base, base64);
				 if(score>85) break;
			}	} catch (SQLException e) {
				e.printStackTrace();}
		//System.out.println(base64);
		
		if (score >= 85) {
			result = true;

		}
		System.out.println(result);
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		obj.put("studentnum", studentnum);
		PrintWriter writer = response.getWriter();
        writer.print(obj);
        writer.flush();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
