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
	th{
		width: 250px;
		height: 40px
	}

</style>

<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>북마크 그룹 수정</h1>

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
		
	</table>
	


	
	
		<form action="bookmark-group-edit-submit.jsp" method="post">
			<table>
				<tbody class="head">
					<tr>
						<th>북마크 이름</th>
						<td>
							<input type="text" name="name"/>
						</td>
					</tr>
					<tr>
						<th>순서</th>
						<td>
							<input type="text" name="odr"/>
						</td>
					</tr>
				</tbody>
			
				<%
					String manageNum = request.getParameter("managenum");
					
					WifiInfoService service = new WifiInfoService();
					WifiInfo wifiInfo = service.getDetail(manageNum);
				%>
		
			</table>
			
			<div align="center">
				<a href="javascript:window.history.back();">돌아가기</a>
				<button type="submit">수정</button>
			</div>
			
			<input type="hidden" name="id" value="<%=request.getParameter("id")%>" readonly/>
		
		</form>
	
		


</body>






</html>