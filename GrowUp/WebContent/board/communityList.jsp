<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커뮤니티 | 글 목록</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<!-- 테이블에 dataTables-example 사용시 검색, 페이징처리 됨 -->
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<!-- 테이블에 dataTables-example 사용시 검색, 페이징처리 됨 -->
    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    
	<script type="text/javascript">
	 $(document).ready(function() {
	        $('#dataTables-example').DataTable();
	    });
	
		function fn_communityWrite(){
			location.href = "${context}/work/board/communityWrite.do";
		}
	</script>
	<style type="text/css">
		.dataTables_info{display: hidden};
		#dataTables-example th {background: #ffffff !important};
	</style>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>

<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_event.jpg");'></div>
<!-- title, visual end -->

<!-- Details -->
<div class="container">
	<div class="px-5 py-5">
		<!-- board title start -->
		<div class="py-5">
			<p class="title fs-1 fw-bold">커뮤니티</p>
		</div>
		<!-- board title end -->
		
		<!-- board list start -->
        <div class="table-responsive">
            <table class="table table-hover boardlist" id="dataTables-example">
                <thead>
			            <tr style="display: none;">
			                <th>Name</th>
			                <th>Position</th>
			                <th>Office</th>
			                <th>Age</th>
			                <th>Start date</th>
			            </tr>
			        </thead>
                    <tbody>
					<c:forEach items="${dsCommunityList}" var="dsCommunityList">
                      <tr>
                      	<td class="flex-row" >
                      		<th class="col-md-7 p-2  comuTable"  style="background: #ffffff"><a href ="${context}/work/board/communityView.do?comuNo=${dsCommunityList.COMU_NO}" style="background: #ffffff">${dsCommunityList.COMU_TITLE}</a></th>
							<th class="col-md-2 p-2 px-right-1 fw-bold" style="background: #ffffff">${dsCommunityList.USER_NAME}</th>
							<th class="col-md-2 p-2 px-right-1 comuTable" style="background: #ffffff">${dsCommunityList.COMU_REG_DATE}</th>
							<th class="col-md-1 p-2 px-right-1 comuTable" style="background: #ffffff">조회수 : ${dsCommunityList.COMU_HIT}</th>
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
				<button type="button" class="btn boardbtn p-2" onclick="fn_communityWrite()">새 글 쓰기</button>
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