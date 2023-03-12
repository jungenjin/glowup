<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Glow up</title>
<!-- 채널톡 챗봇 연동 -->
	<c:if test="${sessionScope.id == null}">
		<script>
		  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
		
		  ChannelIO('boot', {
		    "pluginKey": "84091ac2-0c80-450c-a7c1-2b8955b6f6af"
		  });
		</script>
	</c:if>
	
	<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
		<script>
		  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
		
		  ChannelIO('boot', {
		    "pluginKey": "84091ac2-0c80-450c-a7c1-2b8955b6f6af"
		  });
		</script>
	</c:if>
</head>

<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>

<c:set var="noitceUrl">${context}/work/board/notice.do</c:set>
<c:set var="cmmuUrl">${context}/work/board/community.do</c:set>
<c:set var="inquiryUrl">${context}/work/board/inquiry.do</c:set>
<c:set var="FAQUrl">${context}/FAQ/FAQ.jsp</c:set>
<c:set var="qnaUrl">${context}/work/board/qna.do</c:set>

<body>
<footer class="footer bg-light opacity-75 pt-5 pb-2 mt-5">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-6">
				<a href="${homeUrl}" class=" pb-3">
					<img src="${context}/img/Glowup_logo.png" alt="glowup" width="" height="45">
				</a>
				<p class="py-2 pb-3 fw-semibold">글로우업과 함께 당신만의 팔레트를 완성해보세요. </p>
				<a href="#" class="px-2"><i class="fa-solid fa-comment"></i></a>
				<a href="#" class="px-2"><i class="fa-brands fa-youtube"></i></a>
				<a href="#" class="px-2"><i class="fa-brands fa-tiktok"></i></a>
				<a href="#" class="px-2"><i class="fa-brands fa-instagram"></i></a>
				<a href="#" class="px-2"><i class="fa-brands fa-facebook"></i></a>
			</div>
	
			<div class="col-sm-12 col-md-2">
				<ul class="fs-6">
					<li><p class="fw-bold fs-5">서비스</p></li>
					<li><a href="${context}/work/board/notice.do">공지사항</a></li>
					<li><a href="${context}/work/board/community.do">커뮤니티</a></li>
					<li><a href="#">회사소개 </a></li>
				</ul>
			</div>
			
			<div class="col-sm-12 col-md-2">
				<ul class="fs-6">
					<li><p class="fw-bold fs-5">고객센터</p></li>
					<li><a href="${context}/work/board/inquiry.do">1 : 1 상담</a></li>
					<li><a href="${context}/work/board/qan.do">Q & A</a></li>
					<li><a href="${context}/FAQ/FAQ.jsp">FAQ</a></li>
				</ul>
			</div>
			
			<div class="col-sm-12 col-md-2">
				<ul class="fs-6">
					<li><p class="fw-bold fs-5">정보</p></a></li>
					<li>email : <a>glowup@glowup.co.kr</a></li>
					<li>tel : <a>1577-1234</a></li>
				</ul>
				<ul class="fs-6">
					<li>상담시간 : <a>AM 09:00 ~ PM 05:00</a></li>
					<li>월 ~ 금 (주말, 공휴일 제외)</li>
				</ul>
			</div>
		
		</div>
	</div>
</footer>
</body>
</html>