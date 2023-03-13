<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Q n A | 글 목록</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_qnaWrite(){
			location.href = "${context}/work/board/qnaWrite.do";
		}
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>

<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_qna.jpg");'></div>
<!-- title, visual end -->

<!-- Details -->
<div class="container">
	<div class="px-5 py-5">
		<!-- board title start -->
		<div class="py-5">
			<p class="title fs-1 fw-bold">Q n A</p>
		</div>
		<!-- board title end -->

		<!-- search-bar start -->
		<div class="d-flex justify-content-center mb-5">
			<div class="search-bar">
	          <input class="search-bar__input" type="search" placeholder="무엇을 도와드릴까요?" />
	          <i class="fas fa-search"></i>
	        </div>
		</div>	
		<!-- search-bar end -->
		
		<!-- board list start -->
        <div class="table-responsive">
            <table class="table table-hover boardlist">
                <tbody>
                    <c:forEach items="${dsqnaList}" var="dsqnaList">
                     <tr>
                     	<td class="col-md-7 p-3 px-left-1">
                     		<a href ="${context}/work/board/qnaView.do?inqNo=${dsqnaList.QNA_NO}">${dsqnaList.QNA_TITLE}</a>
                     	</td>
                     	<td class="col-md-2 p-3 px-right-1 fw-bold">
							${dsqnaList.USER_NAME}
                     	</td>
                     	<td class="col-md-2 p-3 px-right-1">
							${dsqnaList.QNA_REG_DATE}
                     	</td>
                     	<td class="col-md-1 p-3 px-right-1">
							조회수 : ${dsqnaList.QNA_HIT}
                     	</td>
                     </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
		<!-- board list end -->
		
		<!-- board buttons start -->
		<c:if test="${sessionScope.grade == 'A' || sessionScope.grade == 'M'}">
			<div class="d-flex flex-row-reverse p-2">
				<button type="button" class="btn boardbtn p-2" onclick="fn_qnaWrite()">새 글 쓰기</button>
			</div>
		</c:if>
		<!-- board buttons end -->
		
		<!-- pagination start -->
		<div class="d-flex justify-content-center mb-5">
		<!-- 페이징을 지정할 태그에 class에 pagination을 넣으면 자동으로 페이징이 된다.-->
		  <!-- 페이징의 크기를 제어할 수 있는데 pagination-lg를 추가하면 페이징 크기가 커지고, pagination-sm를 넣으면 작아진다. -->
		  <!-- 큰 페이징 class="pagination pagination-lg", 보통 페이징 class="pagination", 작은 페이징  class="pagination pagination-sm" -->
		  <ul class="pagination mx-2">
		    <!-- li태그의 클래스에 disabled를 넣으면 마우스를 위에 올렸을 때 클릭 금지 마크가 나오고 클릭도 되지 않는다.-->
		    <!-- disabled의 의미는 앞의 페이지가 존재하지 않다는 뜻이다. -->
		    <li class="disabled mx-2">
		      <a href="#">
		        <span>«</span>
		      </a>
		    </li>
		    <!-- li태그의 클래스에 active를 넣으면 색이 반전되고 클릭도 되지 않는다. -->
		    <!-- active의 의미는 현재 페이지의 의미이다. -->
		    <li class="active mx-2"><a href="#">1</a></li>
		    <li class="mx-2"><a href="#">2</a></li>
		    <li class="mx-2"><a href="#">3</a></li>
		    <li class="mx-2">
		      <a href="#">
		        <span>»</span>
		      </a>
		    </li>
		  </ul>
		</div><!-- pagination end -->
			
	</div><!-- Details end -->
</div><!-- container end -->

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>