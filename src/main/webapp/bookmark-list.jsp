<%@page import="handlingAPI.BookMark"%>
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

	.head th{
		height: 35px;
	}
	
	td{
		height: 30px;
	}

</style>

<script>

	window.onload=function(){
		getBookMark();			
	}
		
	function getBookMark(){ 
			
		var myTable = document.getElementById("tbody");
		
		<%
		BookMarkService bms = new BookMarkService();
		List<BookMark> list = bms.getBookMark();
		BookMark bm = new BookMark();
		
		int size = list.size();
		
		for(int i=0; i<size; i++){
			bm = list.get(i);
		%>
			var row = myTable.insertRow(myTable.rows.length);
			
	    	row.insertCell(0).innerHTML = "<%=bm.getId()%>"; //id
	    	row.insertCell(1).innerHTML = "<%=bm.getName()%>"; //이름
	    	row.insertCell(2).innerHTML = "<a href='detail.jsp?managenum=<%=bm.getManageNum()%>&distance=0'> <%=bm.getWifiName()%> </a>"; //우선순위
	    	row.insertCell(3).innerHTML = "<%=bm.getSubmitDate()%>"; //등록 날짜
	    	
	    	var cell4 = row.insertCell(4);
	    	cell4.align = 'center';
	    	cell4.innerHTML = "<a href='bookmark-delete.jsp?bmName=<%=bm.getName()%>&wifiName=<%=bm.getWifiName()%>&submitDate=<%=bm.getSubmitDate()%>&indexNum=<%=bm.getIndexNum()%>'>삭제</a>";
	    	
		<% } %>
		
	}

			
	
</script>



<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<h1>북마크 목록</h1>

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
	


	<table>
	
		<thead class="head">
			
			<tr>
				<th>ID</th>
				<th>북마크 이름</th>
				<th>와이파이명</th>
				<th>등록일자</th>
				<th>비고</th>
			</tr>
			
		</thead>
		
		
		
		<tbody id="tbody">
		
		</tbody>
	
	
	</table>


</body>






</html>