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
<style>

	.head th{
		height: 35px;
	}
	
	td{
		height: 30px;
	}

</style>


<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>위치 히스토리 목록</h1>

</head>

<body>

	<script>
		
		window.onload=function(){
			
			closedWifi();
			
		}
		
	    function closedWifi(){ //17cell
	    	
	    	var myTable = document.getElementById("tbody");
	    	<%
    		List<History> list = new HistoryService().getHistory();
    		History history = new History();
    		for(int i=0; i<list.size(); i++){
    		
    			history = list.get(i);
   				
    			String id = history.getiD();
    			String xlocation = history.getxLocation();
    			String ylocation = history.getyLocation();
    			String selectDate = history.getSelectDate();
    			
    		%>
    			var row = myTable.insertRow(myTable.rows.length);
    			
		    	row.insertCell(0).innerHTML = "<%=id%>";
		    	row.insertCell(1).innerHTML = "<%=xlocation%>";
		    	row.insertCell(2).innerHTML = "<%=ylocation%>";
		    	row.insertCell(3).innerHTML = "<%=selectDate%>";
		    	
		    	var cell4 = row.insertCell(4);
		    	cell4.align = "center";
		    	cell4.innerHTML = "<a href='history-list-delete.jsp?id=<%=id%>&xlocation=<%=xlocation%>&ylocation=<%=ylocation%>&selectDate=<%=selectDate%>'>삭제</a>";
		    	
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
		
			
	
	</table>
	


	<table>
	
	<colgroup>
		<col style="width: 15%">
		<col style="width: 20%">
		<col style="width: 20%">
		<col style="width: 25%">
	</colgroup>
	
	
		<thead class="head">
			<tr>
				<th>ID</th>
				<th>X좌표</th>
				<th>Y좌표</th>
				<th>조회일자</th>
				<th>비고</th>
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