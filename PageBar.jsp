<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="javascript:firstPage()">首页</a>
	<a href="javascript:backPage(${pageModel.currentPage eq 1?pageModel.currentPage:pageModel.currentPage-1 })">上一页</a>
	<a href="javascript:nextPage(${pageModel.currentPage eq pageModel.pageCount ?pageModel.pageCount:pageModel.currentPage+1 })">下一页</a>
	<a href="javascript:lastPage()">尾页</a>   
	
	共有${pageModel.pageCount }页 ，每页显示
	<select name="pageSize" onchange="chagePageSize(this.value)">
		<option value="5" ${pageModel.pageSize eq 5?'selected':'' } >5</option>
		<option value="10" ${pageModel.pageSize eq 10?'selected':'' }>10</option>
		<option value="15" ${pageModel.pageSize eq 15?'selected':'' }>15</option>
		<option value="20" ${pageModel.pageSize eq 20?'selected':'' }>20</option>
		<option value="100" ${pageModel.pageSize eq 100?'selected':'' }>100</option>
	</select>条数据，
	当前是第<select name="pageSize" onchange="gaPage(this.value)">
		<c:forEach  var="i" begin="1" end="${pageModel.pageCount }" step="1" >
			<option value="${i }"   ${i eq pageModel.currentPage?'selected':'' } >${i }</option>
		</c:forEach>
	</select>页
	
	<script type="text/javascript">
		function $(id){
			return document.getElementById(id);
		}
	
		function chagePageSize(val){
			/* location.href="FYServlet2?pageSize="+val+"&currentPage="+1; */
			$("pageSize").value=val;
			$("currentPage").value=1;
			$("pageForm").submit();
			
		}
		function gaPage(val){
			/* location.href="FYServlet2?currentPage="+val+"&pageSize=${pageSize}"; */
			$("currentPage").value=val;
			$("pageForm").submit();
		}
		function firstPage(){
			$("currentPage").value=1;
			$("pageForm").submit();
		}
		function lastPage(){
			$("currentPage").value=${pageModel.pageCount};
			$("pageForm").submit();
		}
		function backPage(val){
			$("currentPage").value=val;
			$("pageForm").submit();
		}
		function nextPage(val){
			$("currentPage").value=val;
			$("pageForm").submit();
		}
	</script>
	</body>
</html>
