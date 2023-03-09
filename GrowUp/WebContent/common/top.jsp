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
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="${context}/css/common.css" rel="stylesheet">
	<script src="${context}/js/bootstrap.min.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="${context}/js/common.js"></script>
</head>

<!-- URL 추가 -->
<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="visitUrl">${context}/work/board/reservation.do</c:set>
<c:set var="noitceUrl">${context}/work/board/notice.do</c:set>
<c:set var="cmmuUrl">${context}/work/board/community.do</c:set>
<c:set var="boardUrl">${context}/work/board/board.do</c:set>
<c:set var="FAQUrl">${context}/FAQ/FAQ.jsp</c:set>

<c:set var="eyeUrl">${context}/work/product/retrieveProductList.do?category=E</c:set>
<c:set var="lipUrl">${context}/work/product/retrieveProductList.do?category=L</c:set>
<c:set var="faceUrl">${context}/work/product/retrieveProductList.do?category=F</c:set>

<body>
    <nav class="navbar fixed-top navbar-expand-lg bg-light" >
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${homeUrl}">
          	<img src="${context}/img/GlowupW_logo.png" alt="glowup" width="" height="24">
          </a>
        </div>
      	 
        <div id="navbar" class="collapse navbar-collapse">
          	<ul class="nav navbar-nav navbar-left member">
	          	<!--  링크 수정  -->
					<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${eyeUrl}')">섀도우</a></li>
					<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${lipUrl}')">립스틱</a></li>
					<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${faceUrl}')">파운데이션</a></li>
				</ul> 
			</ul> 
			<ul class="nav navbar-nav navbar-right member">
				<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/work/user/createUser.do">회원가입</a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/cart/retrieveCartList.do">장바구니</a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/user/login.jsp">로그인</a>
					</c:if>
					<c:if test="${sessionScope.id != null}">
						<a href="${context}/work/user/logout.do">로그아웃</a>
					</c:if>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
				<ul class="dropdown-menu">
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
				    <li><a href="${context}/work/sell/retrieveBuyList.do">구매내역</a></li>
				    <li><a href="${context}/work/user/updateUser.do">정보수정</a></li>
		          </ul>
				</c:if>
	          </ul>
			</div>
	        
			<li class="dropdown">
				<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">관리자 메뉴<span class="caret"></span></a>
		          <ul class="dropdown-menu">
		          	<li><a href="${context}/work/user/updateUser.do">정보수정</a></li>
					<li><a href="${context}/work/product/retrieveProductListForManage.do">재고관리</a></li>
					<li><a href="${context}/work/sell/retrieveStatisticsForProduct.do">매출통계</a></li>
					<li><a href="${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P">재고현황</a></li>
		          </ul>
				</c:if>
			</li>
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