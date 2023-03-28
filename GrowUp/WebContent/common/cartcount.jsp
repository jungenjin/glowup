<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>

<!-- 장바구니 갯수 구하기 -->
<c:choose>
	<c:when test="${dsCartList.size()>0}">${dsCartList.size() }</c:when>
	<c:otherwise>0</c:otherwise>
</c:choose>
<script>
	console.log(${dsCartList.size()})
</script>