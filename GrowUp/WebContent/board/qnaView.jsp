<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>QNA | 내용보기</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_qnaList(){
			location.href = "${context}/work/board/qna.do";
		}
		//글 삭제
		function fn_delete(){
			var qnaNo = '${dsQnA.QNA_NO}';
	
			if(confirm("정말 글을 삭제하시겠습니까?")){
				location.href = "${context}/work/board/deleteQnA.do?qaNo=" + qnaNo;
			}
		}
		
		//글 수정
		function fn_update(){
			var qnaNo = '${dsQnA.QNA_NO}';
	
			location.href = "${context}/work/board/qnaModify.do?qaNo=" + qnaNo;
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
		
		<!-- board view start -->
		<div class="border-bottom">
			<div class="d-flex flex-row fs-4 mb-2 p-2 ">
				<div class="col-md-10 justify-content-start px-3">${dsQnA.QNA_TITLE}</div>
				<div class="col-md-2 justify-content-end">${dsQnA.USER_NAME}</div>
			</div>
		</div>
		<div class="d-flex flex-row fs-5 mt-2">
			<div class="p-2 px-4">${dsQnA.QNA_CONTENT}</div>
		</div>
		<!-- board view end -->
		
		<!-- board button start -->
		<c:if test="${sessionScope.grade == 'M' || sessionScope.grade == 'A'}">
			<div class="d-flex justify-content-end">
				<button class="btn boardbtn" type="button" onclick="fn_qnaList()">목록</button>
				<button class="btn boardbtn" type="button" onclick="fn_update()">글 수정하기</button>
				<button class="btn boardbtn" type="button" onclick="fn_delete()">글 삭제하기</button>
			</div>
		</c:if>
		<!-- board button end -->
		
	</div> <!-- container end -->
</div> <!-- container end -->

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>