<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
aaaaaa
	<div class="container">
		<c:forEach items="${dsReplyList}" var="dsReplyList">
			<div class="row" style="border-top: 1px solid #D7D8DA; padding:34px 0;">
				<div class="col-xs-8 col-md-10 text-left">
				
					<h4>
						${dsReplyList.NAME}&nbsp;&nbsp;<span class="text-muted">${dsReplyList.COMMENT_DATE}</span>&nbsp;&nbsp;&nbsp;
					</h4>
				</div>
				<div class="col-xs-4 col-md-2 text-right">
					<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">
	               		<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn" 
	               		onclick="javascript:fn_remove('${dsReplyList.USER_COMMENT_NO}')">삭제</a>
	            	</c:if>
	            </div>
				<div class="col-xs-12 text-left">${dsReplyList.USER_COMMENT}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>