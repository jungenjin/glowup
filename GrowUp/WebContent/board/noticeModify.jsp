<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 | 글 수정</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
	
			//글수정 기존 내용 셋팅
			fn_setDetailInfo();
		});
	
		function fn_setDetailInfo(){
			$("#ntcTitle").val('${dsNotice.NTC_TITLE}');
			$("#ntcNo").val('${dsNotice.NTC_NO}');
	
			var ntcContent = '${dsNotice.NTC_CONTENT}';
	
			ntcContent = ntcContent.replace(/<br ?\/?>/gi, "\n");
	
			$("#ntcContent").val(ntcContent);
		}
	
		function fn_save(){
			if(!fn_validation()){
				return;
			}else{
				var ntcContent = String($("#ntcContent").val());
	
				ntcContent = ntcContent.replace(/\n/gi, "<br/>");
	
				$("#ntcContent").val(ntcContent);
	
		 		$("#noticeModify").submit();
			}
		}
	
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>

<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_notice.jpg");'></div>
<!-- title, visual end -->

<!-- Detail -->
<div class="container footertop">
	<div class="px-5 py-5">
	
		<!-- board title start -->
		<div class="page-header">
			<div class="row py-5">
				<div class="d-flex flex-row mb-12">
					<p class="title p-2 fs-1 fw-bold">공지사항</p>
				</div>
			</div>
		</div>
		<!-- board title end -->
		
		<!-- board list start -->
		<form id="noticeModify" method="post" action="${context}/work/board/noticeModify.do?ntcNo=${dsNotice.NTC_NO}" role="form">
			<div class="form-horizontal boardwrite">
				<div class="form-group">
					<label for="ntcTitle" class="control-label fs-4 mb-2">제목</label>
					<input class="form-control" type="text" name="ntcTitle" id="ntcTitle" required="required" maxlength="50" autofocus="autofocus">
				</div>
				<div class="form-group">
					<label for="ntcContent" class="control-label fs-4 mb-2 mt-5">내용</label>
					<textarea class="form-control" name="ntcContent" id="ntcContent" cols="10" rows="15" required="required"></textarea>
				</div>
				
				<!-- board button start -->
				<div class="col-xs-4 d-flex justify-content-end">
					<button type="button" class="btn boardbtn" onclick="fn_save()">글 등록하기</button>
					<button type="button" class="btn boardbtn" onclick="fn_back()">취소</button>
				</div>
				<!-- board button end -->
				
			</div>
		</form>
		<!-- board modify end -->
		
	</div> <!-- container end -->
</div> <!-- container end -->
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>