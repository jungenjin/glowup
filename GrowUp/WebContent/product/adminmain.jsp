<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>Glow up</title>
	<!-- CSS only -->
	<!-- JavaScript Bundle with Popper -->
	<script src="${context}/js/jquery-1.9.1.js"></script>
</head>
<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=E</c:set>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- 메인 백그라운드 배경 튜블라 적용 -->
	<!-- 관리자 페이지 -->
	<c:if test="${sessionScope.grade == 'A'}">
	<div class="container adminmode">
	    <div class="row">
	         <div class="col-md-4 text-center adminlink" onclick="location.href='${productManageUrl}'">
	         <div class="img-circle">
	            <span>
	               <i class="fa-solid fa-store fa-8x" style="color:white;"></i>
	            </span>
	         </div>
	         <h1>재고관리</h1>
	      </div>
	         <div class="col-md-4 text-center adminlink" onclick="location.href='${statisticsForProductUrl}'">
	            <div class="img-circle">
	               <span>
	                  <i class="fa-solid fa-chart-pie fa-8x" style="color:white;"></i>
	            </span>
	          </div>
	         <h1>매출통계</h1>
	      </div>
	         <div class="col-md-4 text-center adminlink" onclick="location.href='${statisticsForStockUrl}'">
	            <div class="img-circle">
	               <span>
	                  <i class="fa-solid fa-boxes-stacked fa-8x" style="color:white;"></i>
	            </span>
	           </div>
	         <h1>재고현황</h1>
	      </div> 
	   </div>
	</div>
   	<jsp:include page="${context}/common/foot.jsp"></jsp:include>
	</c:if>
</body>
</html>