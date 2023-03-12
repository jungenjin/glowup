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
		    "pluginKey": "c3d98b1c-a99d-4111-9531-8fa51ea5da14"
		  });
		</script>
	</c:if>
	
	<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
		<script>
		  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
			
		  ChannelIO('boot', {
		    "pluginKey": "c3d98b1c-a99d-4111-9531-8fa51ea5da14"
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
<footer class="footer bg-opacity-75">
	<div class="container-fluid">
		<div class="row">
		<div class="col-sm-12 col-md-4">
			<a href="${homeUrl}" class="ftlogo">
				<img src="${context}/img/Glowup_logo.png" alt="glowup" width="" height="24">
			</a>
			<p>글로우업과 함께 당신만의 팔레트를 완성해보세요. </p>
			<div class="sns">
	      		<a href="#"><img src="${context}/img/common/sns_kakao.svg"  alt="kakaolink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_insta.svg" alt="instalink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_youtube.svg" alt="youtubelink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_twitter.svg" alt="twitterlink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_facebook.svg" alt="fackbooklink"></a>
			</div>
		</div>
		<div class="col-sm-4 col-md-2 footer-right">
			<h2>서비스</h2>
			<ul class="info">
				<li><a href="${context}/work/board/notice.do">공지사항</a>
				<li><a href="${context}/work/board/community.do">커뮤니티</a>
				<li><a href="#">회사소개 </a>
			</ul>
		</div>
		<div class="col-sm-4 col-md-3 footer-right">
			<h2>고객센터</h2>
			<ul class="info info2">
				<li><a href="${context}/work/board/inquiry.do">1 : 1 상담</a>
				<li><a href="${context}/work/board/qan.do">Q & A</a></li>
				<li><a href="${context}/FAQ/FAQ.jsp">FAQ</a></li>
			</ul>
		</div>
		<div class="col-sm-4 col-md-3 footer-right">
			<h2>정보</h2>
			<ul class="info info3">
				<li>email : <a>glowup@glowup.co.kr</a></li>
				<li>tel : <a>1577-1234</a></li>
			</ul>
			<ul class="info info2">
				<li>상담시간 : <a>AM 09:00 ~ PM 05:00</a></li>
				<li>월 ~ 금 (주말, 공휴일 제외)</li>
			</ul>
		</div>
		</div>
	</div>
</footer>
</body>
</html>