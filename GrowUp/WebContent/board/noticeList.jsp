<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 | 글 목록</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_noticeWrite(){
			location.href = "${context}/work/board/noticeWrite.do";
		}
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_notice.jpg");'></div>
<!-- title, visual end -->
<!-- Detail -->
<div class="container">
	<div class="px-5 py-5">
	
		<!-- board title start -->
		<div class="page-header">
			<div class="row py-5">
				<div class="d-flex flex-row mb-12">
					<p class="title p-2 fs-1 fs-bold">공지사항</p>
				</div>
			</div>
		</div>
		<!-- board title end -->
		<!-- board list start -->
		<div class="row">
            <div class="table-responsive">
                <table class="table table-hover boardlist">
                    <tbody>
					<c:forEach items="${dsNoticeList}" var="dsNoticeList">
                      <tr>
                      	<td class="d-flex flex-row">
                      		<div class="col-md-8 p-2 px-left-1"><a href ="${context}/work/board/noticeView.do?ntcNo=${dsNoticeList.NTC_NO}">${dsNoticeList.NTC_TITLE}</a></div>
							<div class="col-md-1 p-2 px-right-1">${dsNoticeList.USER_NAME}</div>
							<div class="col-md-2 p-2 px-right-1">${dsNoticeList.NTC_REG_DATE}</div>
							<div class="col-md-1 p-2 px-right-1">조회수 : ${dsNoticeList.NTC_HIT}</div>
                      	</td>
                      </tr>
                 	</c:forEach>
                    </tbody>
                </table>
            </div>
			<!-- board list end -->
		<!-- board buttons start -->
		<c:if test="${sessionScope.grade == 'A' || sessionScope.grade == 'A'}">
			<div class="d-flex flex-row-reverse p-2">
				<button type="button" class="btn boardbtn p-2" onclick="fn_noticeWrite()">새 글 쓰기</button>
			</div>
		</c:if>
		<!-- board buttons end -->
		
		</div><!-- row end -->
	</div><!-- container end -->
</div><!-- container end -->
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>