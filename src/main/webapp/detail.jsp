<%@page import="javax.imageio.metadata.IIOMetadataFormatImpl"%>
<%@page import="handlingAPI.BookMarkGroup"%>
<%@page import="handlingAPI.BookMarkService"%>
<%@page import="java.util.List"%>
<%@page import="handlingAPI.WifiInfoService"%>
<%@page import="handlingAPI.WifiInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
    
    
    
    
<!DOCTYPE html>
<html>


<head>


<link rel="stylesheet" href="style.css">

<style>

	th,td{
		height: 35px;
	
	}

</style>

<script>
	window.onload=function(){
		
		<%
			BookMarkService bms = new BookMarkService();
			List<BookMarkGroup> list = bms.getGroupName();
			
		%>
		
	}
	
	<%
		String manageNum = request.getParameter("managenum");
		
		WifiInfoService service = new WifiInfoService();
		WifiInfo wifiInfo = service.getDetail(manageNum);
		
	%>

			
	
</script>



<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>와이파이 정보 구하기</h1>

</head>

<body>



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
			<form action="bookmark-add-submit.jsp" method="post">
			
				<th align="left" style="border: none">
					
					<select name="bookMarkId">
						<option>북마크 그룹 이름 선택</option>
						
						<%
							for(int i=0; i<list.size(); i++){
								BookMarkGroup bm = list.get(i);
								
								String bookMarkName = bm.getName();
								String id = bm.getId();
								
						%>
							<option value="<%=id %>" ><%=bookMarkName%></option>
						<%	
							}
						%>
						
					
					
					
					</select>
					
					<button type="submit">북마크 추가하기</button>
					
					<input type="hidden" name="manageNum" value="<%=wifiInfo.getManagenum()%>"/>
					
					
				</th>
				
			</form>
		</tr>
		
	</table>
	


	<table>
	
		<thead>
			
			
		</thead>
		
		
		
		
		
		
		<tbody id="tbody" class="head">
		
			<tr>
				<th>거리(Km)</th>
				<td><%=request.getParameter("distance")%></td>
			</tr>
			<tr>
				<th>관리 번호</th>
				<td><%=wifiInfo.getManagenum()%></td>
			</tr>
			<tr>
				<th>자치구</th>
				<td><%=wifiInfo.getArea()%></td>
			</tr>
			<tr>
				<th>와이파이명</th>
				<td><%=wifiInfo.getWifiname()%></td>
			</tr>
			<tr>
				<th>도로명 주소</th>
				<td><%=wifiInfo.getRoadname()%></td>
			</tr>
			<tr>
				<th>상세 주소</th>
				<td><%=wifiInfo.getDetailaddress()%></td>
			</tr>
			<tr>
				<th>설치위치(층)</th>
				<td><%=wifiInfo.getSetlocation()%></td>
			</tr>
			<tr>
				<th>설치유형</th>
				<td><%=wifiInfo.getSettype()%></td>
			</tr>
			<tr>
				<th>설치기관</th>
				<td><%=wifiInfo.getSetcompany()%></td>
			</tr>
			<tr>
				<th>서비스 구분</th>
				<td><%=wifiInfo.getServicetype()%></td>
			</tr>
			<tr>
				<th>망종류</th>
				<td><%=wifiInfo.getWebtype()%></td>
			</tr>
			<tr>
				<th>설치년도</th>
				<td><%=wifiInfo.getYear()%></td>
			</tr>
			<tr>
				<th>실내외구분</th>
				<td><%=wifiInfo.getInout()%></td>
			</tr>
			<tr>
				<th>WIFI접속환경</th>
				<td><%=wifiInfo.getEnv()%></td>
			</tr>
			<tr>
				<th>X좌표</th>
				<td><%=wifiInfo.getXlocation()%></td>
			</tr>
			<tr>
				<th>Y좌표</th>
				<td><%=wifiInfo.getYlocation()%></td>
			</tr>
			<tr>
				<th>작업일자</th>
				<td><%=wifiInfo.getSetdate()%></td>
			</tr>
			
			




				
		</tbody>
	
	
	</table>


</body>






</html>