<%@page import="handlingAPI.HistoryService"%>
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


<script>

	window.onload=function(){
		
		<%
			HistoryService hs = new HistoryService();
			String id = request.getParameter("id");
			
			boolean isComp = hs.deleteHistory(id);
		%>
		
		var complete = <%=isComp%>;
		
		if(complete == true){
			alert('히스토리를 삭제하였습니다.');
		}else{
			alert('히스토리 삭제에 실패하였습니다. 정보를 확인해주세요');
		}
		
		location.href = "history-list.jsp";
		
	}
	
</script>



<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

</head>


<body>

	

</body>






</html>