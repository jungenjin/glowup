<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>Glow up</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/assets/owl.carousel.min.css">
   
   <link href="${context}/css/common.css" rel="stylesheet">

   
   <!-- fontawesome6.3.0 관리자페이지에 사용 -->
   <link href="${context}/css/fontawesome6.3.0/solid.css" rel="stylesheet">
   <link href="${context}/css/fontawesome6.3.0/v4-shims.css" rel="stylesheet" />  
   
   <script defer src="${context}/js/fontawesome6.3.0/all.min.js"></script>
       
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   <script src="${context}/js/jquery-1.9.1.js"></script>
   <script src="${context}/js/jquery.tubular.1.0.js"></script>
   <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
   <script src="${context}/js/owl.carousel.js"></script>
   <script src="${context}/js/common.js"></script>

   <script type="text/javascript">

   
	// 배경 동영상 추가  
	$('document').ready(function() {
	var options = { videoId: '_COg3nQ7qcE', start: 0};
	$('#maintub').tubular(options);
	
	$('.owl-carousel').owlCarousel({
	    loop:true,
	    margin:50,
	    responsiveClass:true,
	    responsive:{
	        0:{
	            items:2,
	            nav:true
	        },
	        600:{
	            items:3,
	            nav:false
	        },
	        1400:{
	            items:5,
	            nav:true,
	            loop:false
	        }
	    }
	})
	
	});
	
   </script>

<style type="text/css">

	.maintub{
		z-index: 0;
	}

	.mainsub{
	font-family: "Gotu";
	font-size: 6vw;
	padding-top: 200px;
	margin-bottom: 78px;
	}
	
	.rotate {
    position: absolute;
    right: 10%;
    animation: rotate_image 12s linear infinite;
    transform-origin: 50% 50%;
	}


	@keyframes rotate_image{
	    100% {
	        transform: rotate(360deg);
	    }
	}
	

	
	
</style>
</head>

<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
	<!-- 메인 백그라운드 배경 튜블라 적용 -->

	

	
	<div id="maintub">
		<div class="container">
		<div class="row item" data-aos="fade-up">
		<div class="mainsub">Glow up<img src="/img/main/txt_animation.png" alt="돌아가는 로고" class="rotate"> </div>
			<h4 class="col-sm-4 lh-lg">
				아래 사이트에서도 글로우업에 대한 정보를 확인하실 수 있습니다. <br/>
				<br/>
			    <a href="#">+ 브랜드 사이트 방문하기 </a> 
			</h4>
			<div class="col-sm-8">
				<img src="/img/main/main1.png" alt="메인 립" class="img-fluid rounded-3">
			</div>
		</div> 
		
		<div class="mainsub">Best Product</div>
		 
		<div class="row item" data-aos="fade-up">
			<h4 class="col-sm-4 lh-lg">
				그 시절 그대로,<br/>
				변하지 않는 아름다움을 만들어보세요.<br>
				<br/>
				<a href="#">+ PRODUCT </a>
			</h4>
			<div class="col-sm-4">
				<img src="/img/main/mainbest1.png" alt="메인 립" class="img-fluid rounded-3 item" data-aos="fade-up">
				<img src="/img/main/mainbest3.png" alt="메인 립" class="img-fluid mt-5 rounded-3 item" data-aos="fade-up">
			</div>
			<div class="col-sm-4" style="margin-top: 259px;">
				<img src="/img/main/mainbest2.png" alt="메인 립" class="img-fluid rounded-3 item" data-aos="fade-up">
				<img src="/img/main/mainbest4.png" alt="메인 립" class="img-fluid mt-5 rounded-3 item" data-aos="fade-up">
			</div>
		</div> 
		
		<div class="mainsub item" data-aos="fade-up">Our Business</div>
		<div><img src="/img/main/mainbusiness1.png" class="img-fluid my-4 rounded-3 item" data-aos="fade-up" alt="비즈니스1"></div> 
		<div><img src="/img/main/mainbusiness2.png" class="img-fluid my-4 rounded-3 item" data-aos="fade-up" alt="비즈니스2"></div> 
		<div><img src="/img/main/mainbusiness3.png" class="img-fluid my-4 rounded-3 item" data-aos="fade-up" alt="비즈니스3"></div>
	
		<h2 style="margin-top: 195px;">@glowup_official</h2>
		
		<div class="mainsub pt-0">
			Instagram
		</div> 
		
		<div class="instaimg owl-carousel item" data-aos="fade-up">
			<div><img src="/img/main/maininsta1.png" class="rounded-3"></div>
			<div><img src="/img/main/maininsta2.png" class="rounded-3"></div>
			<div><img src="/img/main/maininsta3.png" class="rounded-3"></div>
			<div><img src="/img/main/maininsta4.png" class="rounded-3"></div>
			<div><img src="/img/main/maininsta5.png" class="rounded-3"></div>
		</div>
		
	</div>

   
   <footer class="footer">
	<div class="container">
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
				<li><a href="${context}/work/board/reservation.do">고객센터</a>
				<li><a href="${context}/work/board/notice.do">공지사항</a>
				<li><a href="${context}/work/board/community.do">커뮤니티</a>
				<li><a href="#">회사소개 </a>
			</ul>
		</div>
		<div class="col-sm-4 col-md-3 footer-right">
			<h2>정보</h2>
			<ul class="info info2">
				<li><a>이메일</a>
				<li>glowup@glowup.co.kr</li>
			</ul>
			<ul class="info info2">
				<li><a>문의</a>
				<li>1577-1234</li>
			</ul>
		</div>
		<div class="col-sm-4 col-md-3 footer-right">
			<h2>고객센터</h2>
			<ul class="info info2">
				<li><a>상담가능시간</a>
				<li><a></a>
				<li><a>AM 09:00 ~ PM 05:00</a>
				<li><a></a>
				<li><a>주말, 공휴일</a>
			</ul>
		</div>
		</div>
	</div>
</footer>
	</div>
   <script>
  AOS.init();
</script>

</body>
</html>