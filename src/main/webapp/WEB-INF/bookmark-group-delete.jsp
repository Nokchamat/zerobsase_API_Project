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
	th{
		width: 250px;
		height: 40px
	}

</style>

<script>


	window.onload=function(){
		<%
			BookMarkService bms = new BookMarkService();
			BookMarkGroup bm = bms.getGroup( request.getParameter("id") );
			
		%>
		
		document.getElementById("name").value = "<%= bm.getName() %>";
		document.getElementById("odr").value = "<%= bm.getpriority() %>";
	}
	
</script>



<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>위치 히스토리 목록</h1>



</head>

<body>
	<h3>북마크 그룹을 삭제하시겠습니까?</h3>
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
	


	
	
		<form action="bookmark-group-delete-submit.jsp" method="post">
			<table>
				<tbody class="head">
					<tr>
						<th>북마크 이름</th>
						<td>
							<input type="text" value="1" id="name" name="name" readonly />
						</td>
					</tr>
					<tr>
						<th>순서</th>
						<td>
							<input type="text" value="1" id="odr" name="odr" readonly />
						</td>
					</tr>
				</tbody>
			
			
			</table>
			
			<div align="center">
				<a href="javascript:window.history.back();">돌아가기</a>
				<button type="submit">삭제</button>
			</div>
		
			<input type="hidden" name="id" value="<%=request.getParameter("id")%>" readonly/>
		
		</form>
	
		


</body>






</html>