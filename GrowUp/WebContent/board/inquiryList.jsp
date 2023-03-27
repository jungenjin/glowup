<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>1:1 문의 | 글 목록</title>
	<!-- 테이블에 dataTables-example 사용시 검색, 페이징처리 됨 -->
	<link href="https://cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" rel="stylesheet"/>
	
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<!-- 테이블에 dataTables-example 사용시 검색, 페이징처리 됨 -->
	<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
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
<div class="container footertop">
	<div class="py-5">
		<!-- board title start -->
		<div class="py-5">
			<p class="title fs-1 fw-bold">1 : 1 문의</p>
		</div>
		<!-- board title end -->
		
		<!-- board list start -->
        <div class="table-responsive">
            <table class="table hover pt-3 mb-3 boardlist" id="dataTables-example">
            	<thead>
                     <tr style="display: none;">
                         <th class="visually-hidden">NO</th>
                         <th>제목</th>
                         <th>작성자</th>
                         <th>작성일</th>
                     </tr>
                 </thead>
                <tbody>
                    <c:forEach items="${dsinquiryList}" var="dsinquiryList">
						<tr>
							<td class="visually-hidden">${dsinquiryList.INQ_NO}</td>
	                     	<td style="min-width:200px" class="p-3">
	                     		<a href="${context}/work/board/inquiryView.do?inqNo=${dsinquiryList.INQ_NO}">${dsinquiryList.INQ_TITLE}</a>
	                     	</td>
	                     	<td style="width:100px;min-width:100px" class="p-3 text-center">${dsinquiryList.USER_NAME}</td>
	                     	<td style="width:150px;min-width:150px" class="p-3 text-end">${dsinquiryList.INQ_REG_DATE}</td>
	                     </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
		<!-- board list end -->
		
		<!-- board buttons start -->
		<c:if test="${sessionScope.grade == 'A' || sessionScope.grade == 'M'}">
			<div class="d-flex flex-row-reverse p-2">
				<button type="button" class="btn boardbtn p-2" onclick="fn_inquiryWrite()">새 글쓰기</button>
			</div>
		</c:if>
		<!-- board buttons end -->
			
	</div><!-- Details end -->
</div><!-- container end -->

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>