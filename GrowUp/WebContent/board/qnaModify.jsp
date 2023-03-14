<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>QNA | 글 수정</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
	
			//글수정 기존 내용 셋팅
			fn_setDetailInfo();
		});
	
		function fn_setDetailInfo(){
			$("#qaTitle").val('${dsQnA.QNA_TITLE}');
			$("#qaNo").val('${dsQnA.QNA_NO}');
	
			var qaContent = '${dsQnA.QNA_CONTENT}';
	
			qaContent = qaContent.replace(/<br ?\/?>/gi, "\n");
	
			$("#qaContent").val(qaContent);
		}
	
		function fn_save(){
			if(!fn_validation()){
				return;
			}else{
				var qaContent = String($("#qaContent").val());
	
				qaContent = qaContent.replace(/\n/gi, "<br/>");
	
				$("#qaContent").val(qaContent);
	
		 		$("#qnaModify").submit();
			}
		}
	
	</script>
	
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_event.jpg");'>
</div>
<!-- title, visual end -->
<!-- Detail -->
<div class="container-fluid">
	<div class="px-5 py-5">
		<!-- board title start -->
		<div class="page-header">
			<div class="row py-5">
				<div class="d-flex flex-row mb-12">
				<h2 class="title p-2">QNA 게시판</h2>
			</div>
		</div>
	</div>
	<!-- board title end -->
		
		<!-- board modify start -->
		<form id="qnaModify" method="post" action="${context}/work/board/qnaModify.do?qaNo=${dsQnA.QNA_NO}" role="form">
			<div class="form-horizontal boardwrite">
				<div class="form-group">
					<label for="qaTitle" class="control-label fs-4 mb-2">제목</label>
					<input class="form-control" type="text" name="qaTitle" id="qaTitle" required="required" maxlength="50" autofocus="autofocus">
				</div>
				<div class="form-group">
					<label for="qaContent" class="control-label fs-4 mb-2 mt-5">내용</label>
					<textarea class="form-control" name="qaContent" id="qaContent" cols="10" rows="15" required="required"></textarea>
				</div>
				
				<!-- board button start -->
				<div class="col-xs-4 d-flex justify-content-end">
					<button type="button" class="btn boardbtn" onclick="fn_save()">글 등록하기</button>
					<button type="button" class="btn boardbtn" onclick="fn_back()">취소</button>
				</div>
				
			</div>
		</form>
		<!-- board modify end -->
		
	</div> <!-- container end -->
</div> <!-- container end -->
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>