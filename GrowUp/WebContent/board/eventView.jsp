<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자유 게시판 - 글 내용보기</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_eventList(){
			location.href = "${context}/work/board/event.do";
		}
		//글 삭제
		function fn_delete(){
			var evNo = '${dsEvent.EV_NO}';
	
			if(confirm("정말 글을 삭제하시겠습니까?")){
				location.href = "${context}/work/board/deleteEvent.do?evNo=" + evNo;
			}
		}
		
		//글 수정
		function fn_update(){
			var evNo = '${dsEvent.EV_NO}';
	
			location.href = "${context}/work/board/eventModify.do?evNo=" + evNo;
		}
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_service.png");'>
	<div class="boardText">
		<h3 class="boardTitle">EVENT</h3>
		<p class="boardSub">이벤트 게시판</p>
	</div>
</div>
<!-- title, visual end -->
<!-- Detail -->
	<div class="container">
		<!-- board title, buttons start -->
		<div class="page-header">
			<div class="row">
				<div class="col-xs-8">
					<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
					<h2 class="title eng">이벤트 게시판</h2>
				</div>
				<div class="col-xs-4 text-right">
					<button type="button" class="btn btn-lg boardbtn" onclick="fn_eventList()">목록</button>
				</div>
			</div>
		</div>
		<!-- board title, buttons end -->
		<div class="boardview">
			<!-- board view start -->
			<div class="row title">
				<div class="col-sm-12 col-md-10">
					${dsEvent.EV_TITLE}
				</div>
				<div class="col-sm-12 col-md-2 user">
					${dsEvent.USER_NAME}
				</div>
			</div>
			<div class="row content">
				${dsEvent.EV_CONTENT}
			</div>
		</div>
		<!-- board view end -->
		<!-- board button area start -->
		
		<c:if test="${sessionScope.grade == 'A' || sessionScope.userCode == dsEvent.EV_REG_ID}">
			<div class="row btnarea">
				<button class="btn btn-lg boardbtn" type="button" onclick="fn_update()">글 수정하기</button>
				<button class="btn btn-lg boardbtn" type="button" onclick="fn_delete()">글 삭제하기</button>
			</div>
		</c:if>
		
		<!-- board button area end -->
	
	</div> <!-- container end -->
	<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>