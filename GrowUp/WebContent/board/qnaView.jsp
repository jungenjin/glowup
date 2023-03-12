<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 | 내용보기</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_noticeList(){
			location.href = "${context}/work/board/notice.do";
		}
		//글 삭제
		function fn_delete(){
			var noticeNo = '${dsNotice.NTC_NO}';
	
			if(confirm("정말 글을 삭제하시겠습니까?")){
				location.href = "${context}/work/board/deleteNotice.do?ntcNo=" + noticeNo;
			}
		}
		
		//글 수정
		function fn_update(){
			var noticeNo = '${dsNotice.NTC_NO}';
	
			location.href = "${context}/work/board/noticeModify.do?ntcNo=" + noticeNo;
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
					<p class="title p-2 fs-1 fw-bold">공지사항</p>
				</div>
			</div>
		</div>
		<!-- board title end -->

		<!-- board view start -->
		<div class="border-bottom">
			<div class="d-flex flex-row fs-4 mb-2 p-2 ">
				<div class="col-md-10 justify-content-start px-3">${dsNotice.NTC_TITLE}</div>
				<div class="col-md-2 justify-content-end">${dsNotice.USER_NAME}</div>
			</div>
		</div>
		<div class="d-flex flex-row fs-5 mt-2">
			<div class="p-2 px-4">${dsNotice.NTC_CONTENT}</div>
		</div>
		<!-- board view end -->
		
		<!-- board button area start -->
		<c:if test="${sessionScope.grade == 'A' || sessionScope.userCode == dsEvent.EV_REG_ID}">
			<div class="d-flex justify-content-end">
				<button class="btn boardbtn" type="button" onclick="fn_noticeList()">목록</button>
				<button class="btn boardbtn" type="button" onclick="fn_update()">글 수정하기</button>
				<button class="btn boardbtn" type="button" onclick="fn_delete()">글 삭제하기</button>
			</div>
		</c:if>
		<!-- board button area end -->
		
		<!-- 첨부파일 view -->
		
		<!--  답글 입력 토글 start -->
		<div class="container review-box" >
			<div class="row">
				<div  class="col-xs-6">
			   		<h3>답글 <span class="badge">${dsReplyList[0].REPLY_COUNT}</span></h3>
				</div>
		        <div class="col-xs-6 text-right">
		   			<c:if test="${dsProduct.SELL_YN == 'Y'}">
		               <a class="btn confirmbtn" href="#reviews-anchor" id="open-review-box">답글 등록하기</a>
					</c:if>
		        </div>
			</div>
			<div class="row">
				<div class="col-md-12" id="post-review-box" style="display:none;">
		            <form id="createReply" accept-charset="UTF-8" action="${context}/work/reply/createReply.do" method="post">
		                <input id="ratings-hidden" name="markRating" type="hidden">
		                <textarea class="form-control animated" cols="50" id="userReply" name="userReply" placeholder="상품평을 입력하세요..." rows="5"></textarea>
		                <div class="text-right">
							<c:if test="${dsProduct.MARK_YN == 'N'}">
								<div class="stars starrr" data-rating="0"></div>
							</c:if>
							<a href="#" id="close-review-box" class="btn">Cancel</a>
							<button id="save-review" class="btn" onclick="return fn_save()">Save</button>
		                </div>
		                <input type="hidden" id="productCode" name="productCode" value="${dsProduct.PRODUCT_CODE}">
		                <input type="hidden" id="markYn" name="markYn" value="${dsProduct.MARK_YN}">
		            </form>
				</div>
			</div>
		</div>
		<!-- 답글 입력 토글 end -->
		<!-- 답글 목록 start -->
		<div class="container">
			<c:forEach items="${dsReplyList}" var="dsReplyList">
				<div class="row" style="border-top: 1px solid #D7D8DA; padding:34px 0;">
					<div class="col-xs-8 col-md-10 text-left">
						<h4>
							${dsReplyList.USER_ID}&nbsp;&nbsp;<span class="text-muted">${dsReplyList.REPLY_DATE}</span>&nbsp;&nbsp;&nbsp;
							<span class="stars starrr replyStar" data-rating="${dsReplyList.MARK_RATING}"></span>
						</h4>
					</div>
					<div class="col-xs-4 col-md-2 text-right">
						<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">
		               		<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn" 
		               		onclick="javascript:fn_remove('${dsReplyList.USER_REPLY_NO}')">삭제</a>
		            	</c:if>
		            </div>
					<div class="col-xs-12 text-left">${dsReplyList.USER_REPLY}</div>
				</div>
			</c:forEach>
		</div>
		<!-- 답글 목록 end -->
		
	</div><!-- Details end -->
</div> <!-- container end -->
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>