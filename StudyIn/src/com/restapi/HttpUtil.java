package com.restapi;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;
import org.json.JSONArray;
import org.json.JSONObject;
import com.dto.*;

public class HttpUtil {
	// 회원 가입 전용 API
	public String addMemberAPI(String email, String passwd, String nickname, String organization) {
		try {
			String str = "http://49.50.162.19:8000/api/member/email?email="+email+"&password="+passwd+"&nickName="+nickname+"&organization="+organization;
			System.out.println("url = "+str);
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); // http 메서드
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true
			
			System.out.println("state : " + conn.getResponseMessage());
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	// 로그인 전용 API
	public String loginWeb(String email, String passwd) {
		try {
			String str = "http://49.50.162.19:8000/api/member/login?email="+email+"&password="+passwd;
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); // http 메서드
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true
			
			
			// 서버로부터 데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			
			JSONObject obj2 = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
			//System.out.println("token= " + obj2.getString("token"));
			System.out.println("token = " + sb.toString());
			return obj2.getString("token");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	// 유저 정보 API
	public String memberInfo(String token) {
		try {
			String str = "http://49.50.162.19:8000/api/home";
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Authorization", token);
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true

			// 상태 코드
	        int responseCode = conn.getResponseCode();
	        //System.out.println(responseCode);

	        // 서버로부터 데이터 읽어오기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	// 시험지 제작 API
	public String addTestPaper(String token, HashMap<String, String> hm) {
		try {
			String str = "http://49.50.162.19:8000/api/exam/upload";
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); // http 메서드
			conn.setRequestProperty("Authorization", token);
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true

			StringBuilder builder = new StringBuilder();		
			Set<String> keys = hm.keySet();
			Iterator<String> it = keys.iterator();
			while(it.hasNext()) {
				String key = it.next();
				String value = hm.get(key);
				builder.append(key).append("=").append(value);
				if (it.hasNext())
					builder.append("&");
			}
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
	        bw.write(builder.toString()); // 버퍼에 담기
	        bw.flush(); // 버퍼에 담긴 데이터 전달
	        bw.close();

			// 상태 코드
	        int responseCode = conn.getResponseCode();
	        System.out.println("code = "+responseCode);
	        
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	// 유저의 시험지 정보
	public int myPaperInfo(String token) {
		try {
			String str = "http://49.50.162.19:8000/api/myExam";
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Authorization", token);
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true

	        // 서버로부터 데이터 읽어오기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			
			JSONObject obj = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
			JSONArray a1 = obj.getJSONArray("exams");
			int result = -1;
			if (a1.length() != 0) {
				result = a1.getJSONObject(0).getInt("id");
			}
			System.out.println(result);			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	// 유저의 시험지 정보
	public ArrayList<QuestionDTO> getTestPaper(String token, int exam_id) {
		ArrayList<QuestionDTO> list = new ArrayList<QuestionDTO>();
		try {
			String str = "http://49.50.162.19:8000/api/exam/"+ exam_id;
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Authorization", token);
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true

	        // 서버로부터 데이터 읽어오기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			
			JSONObject obj = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
			JSONArray obj2 = obj.getJSONArray("questions");
			int size = obj2.length();
			
			for (int i = 0; i < size; i++) {
				list.add(new QuestionDTO(obj2.getJSONObject(i).getString("qorA"), obj2.getJSONObject(i).getString("qorAImage")));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		list.add(new QuestionDTO("fail","fail"));
		return list;
	}
	
	// 시험지 제목
	public String getTestPaperTitle(String token, int exam_id) {
		try {
			String str = "http://49.50.162.19:8000/api/exam/"+ exam_id;
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Authorization", token);
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true

	        // 서버로부터 데이터 읽어오기
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			
			JSONObject obj = new JSONObject(sb.toString()); // json으로 변경 (역직렬화)
			System.out.println(obj.getString("title"));
			
			return obj.getString("title");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
}
