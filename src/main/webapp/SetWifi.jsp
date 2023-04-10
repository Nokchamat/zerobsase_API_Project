<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="handlingAPI.WifiInfo"%>
<%@page import="handlingAPI.WifiInfoService"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<style>
	div{
		text-align: center;
	
	}

</style>


<head>


<meta charset="UTF-8">
<title>와이파이 정보 저장</title>

</head>

<body>

<%
	WifiInfoService wifiInfoService = new WifiInfoService();
	WifiInfo wifiInfo = new WifiInfo(); 
%>



<%

	int startNum = 0;
	int endNum = 999;
	int maxNum = 100000;
	
	StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
	/*URL*/
	urlBuilder.append("/" + URLEncoder.encode("4a486c5865726b64313031626446506a","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
	urlBuilder.append("/" + URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
	urlBuilder.append("/" + URLEncoder.encode("TbPublicWifiInfo","UTF-8"));
	
	
	while(maxNum+1000 > endNum) {
		
		StringBuilder repeat = new StringBuilder(urlBuilder);
		
		repeat.append("/" + URLEncoder.encode(String.valueOf(startNum),"UTF-8")); //시작 1000개씩 끊어야함
		repeat.append("/" + URLEncoder.encode(String.valueOf(endNum),"UTF-8")); // 끝 
		
		URL url = new URL(repeat.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		
		System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
		
		BufferedReader rd;
		// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
			
		StringBuilder sb = new StringBuilder();
		String line;
		
		String jsonData = "";
		
		while ((line = rd.readLine()) != null) {
			
			jsonData = line;
			sb.append(line);
			
		}
		
		rd.close();
		conn.disconnect();
		
		if(jsonData.equals("")) {
			
			System.out.println("정보가 없습니다.");
			
		}else {
			
			
			JsonObject jsonMain = (JsonObject) JsonParser.parseString(jsonData);
			
			jsonMain = jsonMain.getAsJsonObject("TbPublicWifiInfo");
			
			JsonArray jsonArr = jsonMain.getAsJsonArray("row");
			
			maxNum = jsonMain.get("list_total_count").getAsInt();
			
			for(int i=0; i<jsonArr.size(); i++) {
				
				JsonObject jsonObj = (JsonObject)jsonArr.get(i);
				
				wifiInfo.setManagenum(jsonObj.get("X_SWIFI_MGR_NO").getAsString());
				wifiInfo.setArea(jsonObj.get("X_SWIFI_WRDOFC").getAsString());
				wifiInfo.setWifiname(jsonObj.get("X_SWIFI_MAIN_NM").getAsString());
				wifiInfo.setRoadname(jsonObj.get("X_SWIFI_ADRES1").getAsString());
				wifiInfo.setDetailaddress(jsonObj.get("X_SWIFI_ADRES2").getAsString());
				wifiInfo.setSetlocation(jsonObj.get("X_SWIFI_INSTL_FLOOR").getAsString());
				wifiInfo.setSettype(jsonObj.get("X_SWIFI_INSTL_TY").getAsString());
				wifiInfo.setSetcompany(jsonObj.get("X_SWIFI_INSTL_MBY").getAsString());
				wifiInfo.setServicetype(jsonObj.get("X_SWIFI_SVC_SE").getAsString());
				wifiInfo.setWebtype(jsonObj.get("X_SWIFI_CMCWR").getAsString());
				wifiInfo.setYear(jsonObj.get("X_SWIFI_CNSTC_YEAR").getAsString());
				wifiInfo.setInout(jsonObj.get("X_SWIFI_INOUT_DOOR").getAsString());
				wifiInfo.setEnv(jsonObj.get("X_SWIFI_REMARS3").getAsString());
				wifiInfo.setXlocation(jsonObj.get("LNT").getAsString());
				wifiInfo.setYlocation(jsonObj.get("LAT").getAsString());
				wifiInfo.setSetdate(jsonObj.get("WORK_DTTM").getAsString());
				
				wifiInfoService.insertInfo(wifiInfo);
				
			}
			
		}
		
		
		startNum += 1000;
		endNum += 1000;
		
	}
	
	System.out.println(maxNum + "개 정보 저장 완료");

%>


<h2 align="center">
	<%=maxNum%>개의 WIFI 정보를 정상적으로 저장하였습니다.
</h2>


<div>
	<a href="index.jsp">홈 으로 가기</a>
</div>






</body>






</html>