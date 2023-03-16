import "./css/main.css";

const App = () => {
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
            <div className="d-flex justify-content-between align-items-center">
                <div>
                    <p className="display-5">Our <br />Brand Stroy</p>
                    <p className="h3">Glow up만의 창조하는 아름다움으로 <br />새로운 역사를 써 내려갑니다.</p>
                    <p className="h3">사람과 세상을 더 아름답게 하는 <br />소명을 이루고자 미의 여정을 이어갑니다.</p>
                </div>
                <div><img src={require('./img/img_brand01.png').default} alt="" /></div>
            </div>
            <div className="d-flex justify-content-between align-items-center pt200">
                <div className="order-2">
                    <p className="display-5">Research <br />& Innovation</p>
                    <p className="h3">최초, 최고의 제품을 전 세계에 전하기 <br />위한 혁신적인 연구개발과 좋은 원료, <br />첨단기술을 토대로 세계가 주목하는 <br />아름다움을 만들어 냅니다.</p>
                </div>
                <div className="order-1"><img src={require('./img/img_brand02.png').default} alt="" /></div>
            </div>
            <div className="d-flex justify-content-between align-items-center pt200">
                <div>
                    <p className="display-5">Creative <br />Visual Identity</p>
                    <p className="h3">글로우업은 실용적인 패키지, <br />혁신적인 텍스처와 컬러, 오래가는 지속력 등 <br />트렌드를 충실히 리드하는 <br />일상 속 메이크업 제품들을 만듭니다.</p>
                </div>
                <div><img src={require('./img/img_brand03.png').default} alt="" /></div>
            </div>
            <div className="d-flex justify-content-between align-items-center pt200">
                <div className="order-2">
                    <p className="display-5">Individuality</p>
                    <p className="h3">일상 속 메이크업 제품들이 글로우업만의 철학과 <br />크리에이티브한 감각을 바탕으로 트렌디해지며, <br />개인의 아름다움과 고유의 개성을 찾기 위해 노력합니다.</p>
                    <p className="h3">글로우업은 ‘나만의 아름다움과 고유의 개성을 찾는 것이 <br />진정한 뷰티'라는 철학으로 각자의 성격, 취향에 따라 <br />달라져야 한다는 가치관을 반영했습니다.</p>
                </div>
                <div className="order-1"><img src={require('./img/img_brand04.png').default} alt="" /></div>
            </div>
            {/* contact */}
            <span id="contact" className="d-block pt200"></span>
            <div>
                <p className="display-5 con_slogan">Building Brands, One <br />Success Story at a Time.</p>
                <p className="h3">Glow up은 변하는 시대에 맞춰 가치관을 새롭게 정립해왔습니다. 그리고 이를 성장을 위한 나침반으로 삼았습니다. <br />
                Glow up은 이 세상 모든 이들이 아름답다고 믿습니다. <br />
                모두가 자신만의 아름다움을 발견하고 실현하는 삶이 모여 더 나은 세상을 만들 수 있다고 여깁니다.</p>
            </div>
            <div className="">
                <div className="">Contact</div>
                <div className=""></div>
            </div>
            {/* 오시는길 */}
            <span id="location" className="d-block pt200"></span>
            <div>
                <p className="display-5">오시는길</p>
                <div>지도</div>
            </div>
        </div>
        <div className="footer px-5 pt200">
            <div className="row">
                <div className="col">
                    <a className="navbar-brand" href="#\"><img src={require('./img/logo_glowup.png').default} alt="Glow Up Brand" /></a>
                    <p>글로우업과 함께 당신만의 팔레트를 완성해보세요.</p>
                </div>
                <div className="col">
                    <p>(04386) 서울 용산구 한강대로 100 글로우업</p>
                    <p>Tel. 1577-1234</p>
                    <p>Email. Glowup@glow.co.kr</p>
                </div>
            </div>
        </div>
    </div>
    </>
  );
};

export default App;