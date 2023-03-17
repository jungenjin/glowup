import { Route } from "react-router-dom";
import React, {useEffect} from "react";
import InputForm from "./views/InputForm";
import "./css/main.css";

// 스크립트로 kakao maps api를 심어서 가져오면 window전역 객체에 들어가게 되서 이를 바로 인식하지 못함
// kakao가 함수형 컴포넌트인지 인지시키고 window에서 kakao객체로 뽑아서 사용
const {kakao} = window;

const App = () => {
    useEffect(()=> {
        const mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(37.5213, 127.0222), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
        
        const map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        // 마커가 표시될 위치입니다 
        const markerPosition  = new kakao.maps.LatLng(37.5213, 127.0222); 
        
        // 마커를 생성합니다
        const marker = new kakao.maps.Marker({
            position: markerPosition
        });
        
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        
        const iwContent = '<div style="padding:5px;">Glow Up</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(37.5213, 127.0222); //인포윈도우 표시 위치입니다

        // 인포윈도우를 생성합니다
        const infowindow = new kakao.maps.InfoWindow({
            position : iwPosition, 
            content : iwContent 
        });
  
        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
        infowindow.open(map, marker); 
    }, [])
  return (
    <>
    <nav id="gnb" className="navbar fixed-top px-5">
        <a className="navbar-brand" href="#"><img src={require('./img/logo_glowup.png').default} alt="Glow Up Brand" /></a>
        <ul className="nav nav-pills me-auto">
            <li className="nav-item">
                <a className="nav-link" href="#brand">브랜드</a>
            </li>
            <li className="nav-item">
                <a className="nav-link" href="#contact">Contact</a>
            </li>
            <li className="nav-item">
                <a className="nav-link" href="#location">오시는길</a>
            </li>
        </ul>
        <a className="d-flex" href="!#" target={"_blank"}>공식 온라인몰</a>
    </nav>
    <div data-bs-spy="scroll" data-bs-target="#gnb" data-bs-offset="0" data-bs-smooth-scroll="true"  tabIndex="0">
        <div className="position-relative pt200_visiul">
            <div className="position-absolute txt">Glow up</div>
            <img src={require('./img/img_main.png').default} alt="" className="img-fluid" />
        </div>
        <div className="container-xxl">
            {/* 브랜드소개 */}
            <span id="brand" className="d-block pt200"></span>
            <div className="row d-flex justify-content-between align-items-center">
                <div className="col-md-12 col-lg-5">
                    <p className="display-5">Our <br />Brand Stroy</p>
                    <p className="h3">Glow up만의 창조하는 아름다움으로 <br className="d-none d-lg-block" />새로운 역사를 써 내려갑니다.</p>
                    <p className="h3">사람과 세상을 더 아름답게 하는 <br className="d-none d-lg-block" />소명을 이루고자 미의 여정을 이어갑니다.</p>
                </div>
                <div className="col-md-12 col-lg-7"><img src={require('./img/img_brand01.png').default} alt="" className="img-fluid" /></div>
            </div>
            <div className="row d-flex justify-content-between align-items-center pt200">
                <div className="col-md-12 col-lg-4 order-2">
                    <p className="display-5">Research <br />& Innovation</p>
                    <p className="h3">
                        최초, 최고의 제품을 전 세계에 전하기 <br className="d-none d-lg-block"/>
                        위한 혁신적인 연구개발과 좋은 원료, <br className="d-none d-lg-block" />
                        첨단기술을 토대로 세계가 주목하는 <br className="d-none d-lg-block" />
                        아름다움을 만들어 냅니다.
                    </p>
                </div>
                <div className="col-md-12 col-lg-8 order-1"><img src={require('./img/img_brand02.png').default} alt="" className="img-fluid" /></div>
            </div>
            <div className="row d-flex justify-content-between align-items-center pt200">
                <div className="col-md-12 col-lg-6">
                    <p className="display-5">Creative <br />Visual Identity</p>
                    <p className="h3">
                        글로우업은 실용적인 패키지, <br className="d-none d-lg-block" />
                        혁신적인 텍스처와 컬러, 오래가는 지속력 등 <br className="d-none d-lg-block" />
                        트렌드를 충실히 리드하는 <br className="d-none d-lg-block" />
                        일상 속 메이크업 제품들을 만듭니다.
                    </p>
                </div>
                <div className="col-md-12 col-lg-6 text-right"><img src={require('./img/img_brand03.png').default} alt="" className="img-fluid" /></div>
            </div>
            <div className="row d-flex justify-content-between align-items-center pt200">
                <div className="col-md-12 col-lg-6 order-2">
                    <p className="display-5">Individuality</p>
                    <p className="h3">
                        일상 속 메이크업 제품들이 글로우업만의 철학과 <br className="d-none d-lg-block" />
                        크리에이티브한 감각을 바탕으로 트렌디해지며, <br className="d-none d-lg-block" />
                        개인의 아름다움과 고유의 개성을 찾기 위해 노력합니다.
                    </p>
                    <p className="h3">
                        글로우업은 ‘나만의 아름다움과 고유의 개성을 찾는 것이 <br className="d-none d-lg-block" />
                        진정한 뷰티'라는 철학으로 각자의 성격, 취향에 따라 <br className="d-none d-lg-block" />
                        달라져야 한다는 가치관을 반영했습니다.
                    </p>
                </div>
                <div className="col-md-12 col-lg-6 order-1"><img src={require('./img/img_brand04.png').default} alt="" className="img-fluid" /></div>
            </div>
            {/* contact */}
            <span id="contact" className="d-block pt200"></span>
            <div>
                <p className="display-5 con_slogan">Building Brands, One <br className="d-none d-lg-block" />Success Story at a Time.</p>
                <p className="h3">Glow up은 변하는 시대에 맞춰 가치관을 새롭게 정립해왔습니다. 그리고 이를 성장을 위한 나침반으로 삼았습니다. <br />
                Glow up은 이 세상 모든 이들이 아름답다고 믿습니다. <br />
                모두가 자신만의 아름다움을 발견하고 실현하는 삶이 모여 더 나은 세상을 만들 수 있다고 여깁니다.</p>
            </div>
            <div className="">
                <div className="">Contact</div>
                <div className="">
                    <Route exact path="/" component={InputForm} />
                </div>
            </div>
            {/* 오시는길 */}
            <span id="location" className="d-block pt200"></span>
            <div>
                <p className="display-5">오시는길</p>
                
            </div>
        </div>
        {/* 카카오지도표시 */}
        <div id="map"></div>
        <div className="footer container-fluid">
            <div className="row">
                <div className="col-sm-8 align-self-center">
                    <a className="navbar-brand ms-5 ps-5" href="#\"><img src={require('./img/logo_glowup.png').default} alt="Glow Up Brand" /></a>
                    <p className="h4 ms-5 ps-5">글로우업과 함께 당신만의 팔레트를 완성해보세요.</p>
                </div>
                <div className="col-sm-4">
                    <p className="h4">(04386) 서울 용산구 한강대로 100 글로우업</p>
                    <p className="h4">Tel. 1577-1234</p>
                    <p className="h4">Email. Glowup@glow.co.kr</p>
                </div>
            </div>
        </div>
    </div>
    </>
  );
};

export default App;