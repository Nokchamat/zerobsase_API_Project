<%@page import="handlingAPI.BookMarkService"%>
<%@page import="java.util.List"%>
<%@page import="handlingAPI.WifiInfoService"%>
<%@page import="handlingAPI.WifiInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
<!DOCTYPE html>
<html>


<head>


<style>
	table{
		width: 100%;
		
	}
	 th,td{
		border:solid 1px;
	}
	
	#green th{
		background: #7FFFD4;
	}
	
	
	input {
		outline: none;
		border: none;
	}
	
</style>

<script>

	window.onload=function(){
		
		<%
			BookMarkService bms = new BookMarkService();
			String name = 	request.getParameter("name");
			String odr = request.getParameter("odr");

			boolean isComp = bms.insertBookMarkGroup(name,odr);
			
		%>
		
		var complete = <%=isComp%>;
		
		if(complete == true){
			alert('북마크 그룹 정보를 추가하였습니다.');
		}else{
			alert('정보 추가에 실패하였습니다. 입력 정보를 확인해주세요');
		}
		
		location.href = "bookmark-group.jsp";
		
	}
	
	
	
</script>



<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

</head>


<body>

	

</body>






</html>