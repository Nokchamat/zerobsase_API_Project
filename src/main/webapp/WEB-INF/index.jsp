<%@page import="handlingAPI.HistoryService"%>
<%@page import="handlingAPI.History"%>
<%@page import="org.omg.IOP.TAG_ALTERNATE_IIOP_ADDRESS"%>
<%@page import="java.util.Queue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="handlingAPI.WifiInfoService"%>
<%@page import="handlingAPI.WifiInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
    
<!-- 37.4811992 126.8955438-->
    
<!DOCTYPE html>
<html>


<head>

<link rel="stylesheet" href="style.css">

<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>와이파이 정보 구하기</h1>

</head>

<body>

	<script>
		var latitude = "";
		var longitude = "";
		
		window.onload=function(){
			if("<%=request.getParameter("lat")%>" > 0){
				
				document.getElementById("lat").value = "<%=request.getParameter("lat")%>";
				document.getElementById("lnt").value = "<%=request.getParameter("lnt")%>";
				closedWifi();
				
			}else{
				document.getElementById("lat").value = latitude = "0.0";
				document.getElementById("lnt").value = longitude = "0.0";
				
				var footTable = document.getElementById("tfoot");
		    	var row = footTable.insertRow(footTable.rows.length);
		    	row.insertCell(0).innerHTML = "위치 정보를 가져오신 후 근처 WIFI 정보 보기를 눌러주십시오.";
				
			}
			
			
		}
		
		
		function myLocation(){
		    navigator.geolocation.getCurrentPosition(position =>{
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;

                document.getElementById("lat").value = latitude;
                document.getElementById("lnt").value = longitude;

            }, (err) => {
                alert("위치 확인을 허용해주세요!");
            })

	    }
		
		<%
			WifiInfo info = new WifiInfo();
			WifiInfoService infoService = new WifiInfoService();
		%>
	    
	    
	    function closedWifi(){ //17cell
	    	
	    	var myTable = document.getElementById("tbody");
	    	<%
	    	
	    	String lat = request.getParameter("lat");
	    	String lnt = request.getParameter("lnt");
	    	
    		List<WifiInfo> list = infoService.getClosedWifi(lat, lnt);
	    	new HistoryService().insertHistory(lat, lnt);
    		
    		if(list.isEmpty()){
    		%>
    			var dummy = "<%=request.getParameter("lat")%>";
    			if(	dummy != "null"){
    				alert("근처에 공공WIFI가 없습니다.");
    			}
    				
    		<%
    		}
    		
    		for(int i=0; i<list.size(); i++){
    		
   				info = list.get(i);
   				
   			%>
    			var row = myTable.insertRow(myTable.rows.length);
    			
		    	row.insertCell(0).innerHTML = "<%=info.getDistance()%>"; //거리
		    	row.insertCell(1).innerHTML = "<%=info.getManagenum()%>"; //관리번호
		    	row.insertCell(2).innerHTML = "<%=info.getArea()%>"; //자치구
		    	row.insertCell(3).innerHTML = "<a href='detail.jsp?managenum=<%=info.getManagenum()%>&distance=<%=info.getDistance()%>'> <%=info.getWifiname()%> </a>";
		    	row.insertCell(4).innerHTML = "<%=info.getRoadname()%>"; //도로명주소
		    	row.insertCell(5).innerHTML = "<%=info.getDetailaddress()%>"; //상세주소
		    	row.insertCell(6).innerHTML = "<%=info.getSetlocation()%>"; //설치위치(층)
		    	row.insertCell(7).innerHTML = "<%=info.getSettype()%>"; //설치유형
		    	row.insertCell(8).innerHTML = "<%=info.getSetcompany()%>"; //설치기관
		    	row.insertCell(9).innerHTML = "<%=info.getServicetype()%>"; //서비스유형
		    	row.insertCell(10).innerHTML = "<%=info.getWebtype()%>"; //망종류
		    	row.insertCell(11).innerHTML = "<%=info.getYear()%>"; //설치년도
		    	row.insertCell(12).innerHTML = "<%=info.getInout()%>"; //실내외 구분
		    	row.insertCell(13).innerHTML = "<%=info.getEnv()%>"; //wifi접속환경w
		    	row.insertCell(14).innerHTML = "<%=info.getXlocation()%>"; //x좌표
		    	row.insertCell(15).innerHTML = "<%=info.getYlocation()%>"; //y좌표
		    	row.insertCell(16).innerHTML = "<%=info.getSetdate()%>"; //작업일자
		    	
	    	<%
	    	} 
		    %>
	    }
	   
	</script>

	<table>
	
		<tr>
			<th align="left" style="border: none">
				<a href="index.jsp">홈</a>
				|
				<a href="history-list.jsp">위치 히스토리 목록</a>
				|
				<a href="SetWifi.jsp">Open API 와이파이 정보 가져오기</a>
				|
				<a href="bookmark-list.jsp">북마크 보기</a>
				|
				<a href="bookmark-group.jsp">북마크 그룹 관리</a>
			</th>
		</tr>
		
		<tr>
			<th align="left" style="border: none">
			
				<form action="?" method="post">
				
					LAT:<input type="text" id="lat" name="lat"  style="border: solid 1px" >
					LNT:<input type="text" id="lnt" name="lnt"  style="border: solid 1px" >
					<button type="button" onclick="myLocation()">내 위치 가져오기</button>
					<button onclick="closedWifi()">근처 WIFI 정보 보기</button>
					
				</form>
				
					
			
 			</th>
		</tr>
			
	
	</table>
	


	<table>
		<colgroup>
			<col style="width:3%"> <!-- 거리 -->
			<col style="width:5%"> <!-- 관리번호 -->
			<col style="width:3%"> <!-- 자치구 -->
			<col style="width:10%"> <!-- 와이파이명 -->
			<col style="width:15%"> <!-- 도로명주소 -->
			<col style="width:9%"> <!-- 상세주소 -->
			<col style="width:5%"> <!-- 설치위치(층) -->
			<col style="width:5%"> <!-- 설치유형 -->
			<col style="width:5%"> <!-- 설치기관 -->
			<col style="width:5%"> <!-- 서비스구분 -->
			<col style="width:5%"> <!-- 망종류 -->
			<col style="width:5%"> <!-- 설치년도 -->
			<col style="width:3%"> <!-- 실내외구분 -->
			<col style="width:4%"> <!-- wifi접속환경 -->
			<col style="width:5%"> <!-- x좌표 -->
			<col style="width:5%"> <!-- y좌표 -->
			<col style="width:5%"> <!-- 설치일자 -->
		</colgroup>
	
	
		<thead class="head">
			<tr>
				<th>거리(Km)</th> 
				<th>관리번호</th>
				<th>자치구</th>
				<th>와이파이명</th>
				<th>도로명주소</th>
				<th>상세주소</th>
				<th>설치위치(층)</th>
				<th>설치유형</th>
				<th>설치기관</th>
				<th>서비스구분</th>
				<th>망종류</th>
				<th>설치년도</th>
				<th>실내외구분</th>
				<th>WIFI접속환경</th>
				<th>X좌표</th>
				<th>Y좌표</th>
				<th>작업일자</th>
			</tr>
			
			
			
			
		</thead>
		
		<tbody id="tbody">
				
		</tbody>
		
	</table>
		
		
	<table>
		<tfoot  id="tfoot" align="center">
			
		</tfoot>
	</table>
	

</body>






</html>