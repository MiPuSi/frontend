package com.restapi;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

public class HttpUtil {
	public String addMemberAPI(String email, String passwd, String nickname, String organization) {
		try {
			String str = "http://49.50.162.19:8000/api/member/email?email="+email+"&password="+passwd+"&nickName="+nickname+"&organization="+organization;
			System.out.println("url = "+str);
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); // http �޼���
			conn.setDoOutput(true); // �����κ��� �޴� ���� �ִٸ� true
			
			System.out.println("state : " + conn.getResponseMessage());
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}
	
	public String loginWeb(String email, String passwd) {
		try {
			String str = "http://49.50.162.19:8000/api/member/login?email="+email+"&password="+passwd;
			URL url = new URL(str);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("POST"); // http �޼���
			conn.setDoOutput(true); // �����κ��� �޴� ���� �ִٸ� true
			
			
			// �����κ��� ������ �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // ���� �� ���� �� ���� �ݺ�
				sb.append(line);
			}
			
			JSONObject obj2 = new JSONObject(sb.toString()); // json���� ���� (������ȭ)
			//System.out.println("token= " + obj2.getString("token"));
			System.out.println("token = " + sb.toString());
			return obj2.getString("token");
			//return sb.toString();
			//return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail";
	}	
}
