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
		
		//답글
	    function fn_reply(paramuserCode){
	    	location.href = "${context}/work/board/retrieve.do?userCode=" + paramProductCode;
	    }
	</script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_inquiry.jpg");'>
</div>
<!-- title, visual end -->
<!-- Details -->
<div class="container footertop">
	<div class="py-5">
	
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
		<div class="border-bottom border-secondary">
			<div class="row fs-4 mb-2 p-2">
				<div class="col-md-10 px-3"><span class="badge bg-secondary">질문</span> ${dsInquiry.INQ_TITLE}</div>
			</div>
			
			<div class="row fs-5 mb-2 px-3 p-2 text-secondary">
				<div class="col-lg-4"><i class="fa-regular fa-user"></i> ${dsInquiry.USER_NAME}</div>
				<div class="col-lg-4"><i class="fa-solid fa-mobile-screen-button"></i> ${dsInquiry.INQ_PHONE}</div>
				<div class="col-lg-4"><i class="fa-regular fa-envelope"></i> ${dsInquiry.INQ_EMAIL}</div>
			</div>
		</div>
		
		<div class="mt-2">
			<div class="fs-4 p-3">${dsInquiry.INQ_CONTENT}</div>
		</div>
  		
		<form class="form-horizontal" method="post" role="form">
  			<!-- board button area start -->
			<div class="d-flex justify-content-end">
				<button class="btn boardbtn" type="button" onclick="fn_inquiryList()">목록</button>
				<c:if test="${sessionScope.userCode == dsInquiry.INQ_REG_ID || sessionScope.grade == 'A'}">
					<button class="btn boardbtn" type="button" onclick="fn_update()">글 수정하기</button>
					<button class="btn boardbtn" type="button" onclick="fn_delete()">글 삭제하기</button>
				</c:if>
			</div>
			<!-- board button area end -->	
		</form>
		<!-- board view end -->
	</div>
	<!--  답글 입력 토글 start -->
<div class="container review-box" >
	<div class="row">
		<div  class="col-xs-6">
	   		<h3>상품평 <span class="badge">${dsComment[0].COMMENT_COUNT}</span></h3>
		</div>
        <div class="col-xs-6 text-right">
               <a class="btn btn-lg" id="openReviewBtn">상품평 등록하기</a>
        </div>
	</div>
	<div class="row">
		<div class="col-md-12" id="post-review-box" style="display:block;">
            <form id="inquiryReplyWrite" accept-charset="UTF-8" action="${context}/work/reply/inquiryReplyWrite.do" method="post">
                <textarea class="form-control animated" cols="50" id="inqreContent" name="inqreContent" placeholder="상품평을 입력하세요..." rows="5"></textarea>
                <div class="text-right">
					<a href="#" id="close-review-box" class="btn">Cancel</a>
					<button id="save-review" class="btn" onclick="return fn_save()">Save</button>
                </div>
                <input type="text" id="inqNo" name="inqNo"  value="${dsInquiry.INQ_NO}">
            </form>
		</div>
	</div>
</div>
		<!-- 답글 입력 토글 end -->
		<!-- 답글 목록 start -->
        <jsp:include page="${context}/work/board/inquiryReply.do"></jsp:include>
		<!-- 답글 목록 end -->
		
</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>