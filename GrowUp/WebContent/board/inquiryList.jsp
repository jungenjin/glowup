<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>1:1 문의 | 글 목록</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_inquiryWrite(){
			location.href = "${context}/work/board/inquiryWrite.do";
		}
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>

<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_inquiry.jpg");'></div>
<!-- title, visual end -->

<!-- Details -->
<div class="container">
	<div class="px-5 py-5">
	
		<!-- board title start -->
		<div class="page-header">
			<div class="row py-5">
				<div class="d-flex flex-row mb-12">
					<p class="title p-2 fs-1 fw-bold">1 : 1 문의</p>
				</div>
			</div>
		</div>
		<!-- board title end -->
		
		<!-- board list start -->
		<div class="row">
	         <div class="table-responsive">
	             <table class="table table-hover">
	                 <tbody>
	                     <c:forEach items="${dsinquiryList}" var="dsinquiryList">
	                      <tr>
	                      	<td class="d-flex flex-row">
	                      		<div class="col-md-10"><a href ="${context}/work/board/inquiryView.do?inqNo=${dsinquiryList.INQ_NO}">${dsinquiryList.INQ_TITLE}</a></div>
								<div class="col-md-1 p-2 px-right-1 fw-bold">${dsinquiryList.USER_NAME}</div>
								<div class="col-md-2 p-2 px-right-1">${dsinquiryList.INQ_REG_DATE}</div>
								<div class="col-md-1 p-2 px-right-1">조회수 : ${dsinquiryList.INQ_HIT}</div>
	                      	</td>
	                      </tr>
	                 	</c:forEach>
	                 </tbody>
	             </table>
	         </div>
			<!-- board list end -->
		</div> <!-- row end -->
		
		<!-- board buttons start -->
		<c:if test="${sessionScope.grade == 'A' || sessionScope.grade == 'M'}">
			<div class="d-flex flex-row-reverse p-2">
				<button type="button" class="btn boardbtn p-2" onclick="fn_inquiryWrite()">새 글 쓰기</button>
			</div>
		</c:if>
		<!-- board buttons end -->
	
	</div><!-- Details end -->
</div><!-- container end -->

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>