<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 | 내용보기</title>
<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_inquiryList(){
			location.href = "${context}/work/board/inquiry.do";
		}
		//글 삭제
		function fn_delete(){
			var VstNo = '${dsInquiry.INQ_NO}';
	
			if(confirm("정말 글을 삭제하시겠습니까?")){
				location.href = "${context}/work/board/deleteInquiry.do?inqNo=" + VstNo;
			}
		}
		
		//글 수정
		function fn_update(){
			var VstNo = '${dsInquiry.INQ_NO}';
	
			location.href = "${context}/work/board/inquiryModify.do?inqNo=" + VstNo;
		}
	</script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>

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
		
		<!-- board view start -->
		<div class="border-bottom">
			<div class="d-flex flex-row fs-5 mt-2">
				<div class="p-2 px-4">${dsInquiry.INQ_CONTENT}</div>
			</div>
			<div class="d-flex flex-row fs-4 mb-2 p-2 ">
				<div class="col-md-10 justify-content-start px-3">${dsInquiry.INQ_TITLE}</div>
				<div class="col-md-2 justify-content-end">${dsInquiry.USER_NAME}</div>
			</div>
			<div class="form-group hidden">
			   <label for="inqPhone" class="col-sm-12 control-label">전화번호</label>
			   <div class="col-sm-12 content border-bottom p-2">${dsInquiry.PHONE}</div>
			 </div>
			<div class="form-group content hidden">
				<div class="col-md-10 justify-content-start px-3"></div>
				<label for="inqEmail" class="col-sm-12 control-label">이메일</label>
				<div class="col-md-2 justify-content-end">${dsInquiry.EMAIL}</div>
			</div>
		</div>
		<!-- board view end -->
	
		<!-- board button area start -->
		<div class="d-flex justify-content-end">
			<button class="btn boardbtn" type="button" onclick="fn_inquiryList()">목록</button>
			<button class="btn boardbtn" type="button" onclick="fn_update()">글 수정하기</button>
			<button class="btn boardbtn" type="button" onclick="fn_delete()">글 삭제하기</button>
		</div>
		<!-- board button area end -->
				
	</div><!-- Details end -->	
</div><!-- container end -->
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>