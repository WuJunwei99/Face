package model_FaceMatch;

import java.util.ArrayList;
import java.util.Iterator;

import org.json.JSONObject;
import org.json.JSONArray;
import com.baidu.aip.face.AipFace;
import com.baidu.aip.face.MatchRequest;
public class FaceMatch{
	//璁剧疆APPID/AK/SK 
	public static final String APP_ID="15443888"; 
	public static final String API_KEY="Y5FThDZqdLMyiLcnOETcMvDP"; 
	public static final String SECRET_KEY="aW13fKuwLldPW9oBK90SiLRL3NSE5Dju";
	static AipFace client = null;	
	static {		client = new AipFace(APP_ID,API_KEY,SECRET_KEY);		
	// 鍙�夛細璁剧疆缃戠粶杩炴帴鍙傛暟		
	client.setConnectionTimeoutInMillis(2000);		
	client.setSocketTimeoutInMillis(60000);	
	}
	public  double matchFace(String imgStr1, String imgStr2) {	
		boolean flag = false;
		MatchRequest req1 = new MatchRequest(imgStr1, "BASE64");		
		MatchRequest req2 = new MatchRequest(imgStr2, "BASE64");		
		ArrayList<MatchRequest> requests = new ArrayList<MatchRequest>();		
		requests.add(req1);		requests.add(req2);		
		JSONObject res = client.match(requests);	
		System.out.println(res);
		JSONObject results = res.getJSONObject("result");
		System.out.println(results);
		double resultscore = results.getDouble("score");
			System.out.println(resultscore);
			
			/*if (resultscore >= 90) {
				flag = true;

			}*/
		return resultscore;	
		
		}

	}

