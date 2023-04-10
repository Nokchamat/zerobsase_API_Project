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

<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>위치 히스토리 삭제</h1>


</head>

<body>
	<h3>히스토리를 삭제하시겠습니까?</h3>
	
		
	<table class="head">
		<tbody id="tbody">
			<tr>
				<th>ID</th>
				<td>
					<%=request.getParameter("id")%>
				</td>
			</tr>
			<tr>
				<th>X좌표</th>
				<td>
					<%=request.getParameter("xlocation")%>
				</td>
			</tr>
			<tr>
				<th>Y좌표</th>
				<td>
					<%=request.getParameter("ylocation")%>
				</td>
			</tr>
			<tr>
				<th>조회일자</th>
				<td>
					<%=request.getParameter("selectDate")%>
				</td>
			</tr>
		</tbody>
	
	</table>
			
	<form action="history-list-delete-submit.jsp" method="post">
	
		<div align="center">
			<a href="javascript:window.history.back();">돌아가기</a>
			<button type="submit">삭제</button>
			<input type="hidden" value=<%=request.getParameter("id")%> name="id"  />
		</div>
		
	</form>
	
		


</body>






</html>