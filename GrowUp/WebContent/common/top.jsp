<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<title>Glow up</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="${context}/css/common.css" rel="stylesheet">
	<!-- fontawesome6.3.0 관리자 페이지에 사용 -->
	<link href="${context}/css/fontawesome6.3.0/solid.css" rel="stylesheet">
	<link href="${context}/css/fontawesome6.3.0/v4-shims.css" rel="stylesheet" />  
	<!-- JavaScript Bundle with Popper -->
	<script defer src="${context}/js/fontawesome6.3.0/all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${context}/js/common.js"></script>
</head>

<!-- URL 추가 -->
<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="noitceUrl">${context}/work/board/notice.do</c:set>
<c:set var="cmmuUrl">${context}/work/board/community.do</c:set>
<c:set var="inquiryUrl">${context}/work/board/inquiry.do</c:set>
<c:set var="FAQUrl">${context}/FAQ/FAQ.jsp</c:set>
<c:set var="qnaUrl">${context}/work/board/qna.do</c:set>

<c:set var="loginUrl">${context}/user/login.jsp</c:set>
<c:set var="eventUrl">${context}/work/board/event.do</c:set>

<c:set var="eyeUrl">${context}/work/product/retrieveProductList.do?category=E</c:set>
<c:set var="lipUrl">${context}/work/product/retrieveProductList.do?category=L</c:set>
<c:set var="faceUrl">${context}/work/product/retrieveProductList.do?category=F</c:set>

<body>
<nav class="navbar bg-opacity-75 fixed-top">
  <div class="container-fluid">
	<a class="navbar-brand px-left-2" href="${homeUrl}"><img src="${context}/img/Glowup_logo.png" alt="glowup" width="" height="24"></a>
    <button class="navbar-toggler px-right-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		<div class="offcanvas-header">
	        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">
	        	<a class="navbar-brand" href="${homeUrl}"><img src="${context}/img/Glowup_logo.png" alt="glowup" width="" height="24"></a>
	        </h5>
     	</div>        

      <!-- 오프캔버스 메뉴 -->
      <div class="offcanvas-body">
          	<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
	          	<!--  링크 수정  -->
				<li class="nav-item"><a class="nav-link active"  onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${eyeUrl}')">섀도우</a>
				</li>
				<li class="nav-item"><a class="nav-link active" onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${lipUrl}')">립스틱</a>
				</li>
				<li class="nav-item"><a class="nav-link active" onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${faceUrl}')">파운데이션</a>
				</li>
				<li class="nav-item"><a class="nav-link active" onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${eventUrl}')">이벤트</a>
				</li>
				<li class="nav-item">
					<c:if test="${sessionScope.id == null}">
						<a class="nav-link active" href="${context}/work/user/createUser.do">회원가입</a>
					</c:if>
				</li>
				<li class="nav-item">
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a class="nav-link active" href="${context}/work/cart/retrieveCartList.do">장바구니</a>
					</c:if>
				</li>
				<li class="nav-item">
					<c:if test="${sessionScope.id == null}">
					<a class="nav-link active" href="${context}/user/login.jsp">로그인</a>
					</c:if>
					<c:if test="${sessionScope.id != null}">
					<a class="nav-link active" href="${context}/work/user/logout.do">로그아웃</a>
					</c:if>
				</li>
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
				<li class="nav-item dropdown">
					<a class="nav-link active nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
					<ul class="dropdown-menu">
					    <li><a class="nav-link active" href="${context}/work/sell/retrieveBuyList.do">구매내역</a></li>
					    <li><a class="nav-link active" href="${context}/work/user/updateUser.do">정보수정</a></li>
		          	</ul>
				</li>
				</c:if>

				<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
				<li class="dropdown">
			          <a class="nav-link active nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자 메뉴</a>
					<ul class="dropdown-menu">
			          	<li><a class="nav-link active" href="${context}/work/user/updateUser.do">EDIT PROFILE</a></li>
						<li><a class="nav-link active" href="${context}/work/product/retrieveProductListForManage.do">재고관리</a></li>
						<li><a class="nav-link active" href="${context}/work/sell/retrieveStatisticsForProduct.do">매출통계</a></li>
						<li><a class="nav-link active" href="${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P">재고현황</a></li>
					</ul>
				</li>
				</c:if>
			</ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

	<div class= "container" style="margin-top:65px;">
	  	<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
	  		<h1 class="admintitle"><mark>관리자 모드</mark></h1>
	  	</c:if>
	</div>

</body>
</html>