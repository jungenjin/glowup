import axios from "axios";
import React, { Component } from "react";
import "../css/main.css";

class ContactForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      conNo: "",
      conName: "",
      conEmail: "",
      conPhone: "",
      conContent: "",
      //by 김은주 230318, route path대신 props를 전달받도록 수정
      // crud: props.match.params.crud,
      crud: this.props.crud,
    };
  }

  //by 김은주 230318, 전체기능은 Insert만 남기고 삭제
  crud() {
    const { conNo, conName, conEmail, conPhone, conContent, crud } = this.state;

    let crudType = "";

    if (crud === "Insert") {
      crudType = "/insertProcess.do";
    } 

    let form = new FormData();
    form.append("conNo", conNo);
    form.append("conName", conName);
    form.append("conEmail", conEmail);
    form.append("conPhone", conPhone);
    form.append("conContent", conContent);

    axios
      .post(crudType, form)
      .then((res) => {
        alert("문의가 정상처리되었습니다");
        // this.props.history.push("/Insert");
        window.location.replace("/");
      })
      .catch((err) => alert("error: " + err.response.data.msg));
  }

  render() {

    return (
      <> 
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
        <h3>이름</h3>
        <input
          type="text"
          placeholder="이름"
          onChange={(event) =>
            this.setState({ conName: event.target.value })
          }
        />
        <br />
        <h3>이메일</h3>
        <input
          type="text"
          placeholder="이메일"
          onChange={(event) =>
            this.setState({ conEmail: event.target.value })
          }
        />
        <br />
        <h3>연락처</h3>
        <input
          type="text"
          placeholder="연락처"
          onChange={(event) =>
            this.setState({ conPhone: event.target.value })
          }
        />
        <br />
        <h3>내용</h3>
        <textarea
          rows="10"
          cols="20"
          placeholder="내용"
          onChange={(event) =>
            this.setState({ conContent: event.target.value })
          }
        ></textarea>
        <br /> <br />
        <button onClick={() => this.crud()}>게시글 등록</button>
        </div>
                </div>
      </>
    );
  }
}

ContactForm.defaultProps = {
  crud : 'Insert'
}

export default ContactForm;