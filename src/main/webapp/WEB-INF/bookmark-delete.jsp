<%@page import="handlingAPI.BookMarkService"%>
<%@page import="handlingAPI.BookMarkGroup"%>
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

	.head th{
		height: 35px;
	}
	
	td{
		height: 30px;
	}
</style>

<script>


	window.onload=function(){
		<%
			String name = request.getParameter("bmName");
			String wifiName = request.getParameter("wifiName");
			String submitDate = request.getParameter("submitDate");
			String indexNum = request.getParameter("indexNum");
			
		%>
		
		document.getElementById("name").value = "<%= name %>";
		document.getElementById("wifiName").value = "<%= wifiName %>";
		document.getElementById("submitDate").value = "<%= submitDate %>";
		document.getElementById("indexNum").value = "<%= indexNum %>";
	}
	
</script>



<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>위치 히스토리 목록</h1>



</head>

<body>
	<h3>북마크를 삭제하시겠습니까?</h3>
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
	


	
	
		<form action="bookmark-delete-submit.jsp" method="post">
			<table>
				<tbody class="head">
					<tr>
						<th>북마크 이름</th>
						<td>
							<input type="text" id="name" name="name" readonly />
						</td>
					</tr>
					<tr>
						<th>와이파이명</th>
						<td>
							<input type="text" id="wifiName" name="odr" readonly />
						</td>
					</tr>
					<tr>
						<th>등록일자</th>
						<td>
							<input type="text" id="submitDate" name="odr" readonly />
						</td>
					</tr>
				</tbody>
			
			
			</table>
			
			<div align="center">
				<a href="javascript:window.history.back();">돌아가기</a>
				<button type="submit">삭제</button>
			</div>
		
			<input type="hidden" name="indexNum" id="indexNum" readonly/>
		
		</form>
	
		


</body>






</html>