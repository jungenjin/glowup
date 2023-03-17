import axios from "axios";
import React, { Component } from "react";

class InputForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      conNo: "",
      conName: "",
      conEmail: "",
      conPnone: "",
      conContent: "",
      crud: props.match.params.crud,
    };
    if (this.state.crud !== "Insert") {
      this.getData();
    }
  }

  createHeaderName() {
    const crud = this.state.crud;
    if (crud === "View") {
      return "조회";
    } else if (crud === "Update") {
      return "수정";
    } else if (crud === "Delete") {
      return "삭제";
    } else if (crud === "Insert") {
      return "등록";
    }
  }

  createCrudBtn() {
    const crud = this.state.crud;
    if (crud === "View") {
      return null;
    } else {
      const crudName =
      crud === "Update" ? "수정" : crud === "Insert" ? "등록" : "삭제";
      return (
        <button onClick={() => this.crud()}>게시글 {crudName}</button>
      );
    }
  }

  crud() {
    const { conNo, conName, conEmail, conPhone, conContent, crud } = this.state;

    let crudType = "";

    if (crud === "Update") {
      crudType = "/updateProcess.do";
    } else if (crud === "Delete") {
      crudType = "/deleteProcess.do";
    } else if (crud === "Insert") {
      crudType = "/insertProcess.do";
    } else if (crud === "View") {
      return null;
    }

    let form = new FormData();
    form.append("conName", conName);
    form.append("conEmail", conEmail);
    form.append("conPhone", conPhone);
    form.append("conContent", conContent);
    if (crud !== "Insert") {
      form.append("conNo", conNo);
    }

    axios
      .post(crudType, form)
      .then((res) => {
        alert("요청이 처리되었습니다");
        // this.props.history.push("/Insert");
        window.location.replace("/Insert");
      })
      .catch((err) => alert("error: " + err.response.data.msg));
  }

  getData() {
    axios.get("/view.do").then((res) => {
      const data = res.data;
      this.setState({
        conNo: data.conNo,
        conName: data.conName,
        conEmail: data.conEmail,
        conPhone: data.conPhone,
        conContent: data.conContent,
      });
    });
  }

  createconNoTag() {
    const conNo = this.state.conNo;
    const crud = this.state.crud;
    if (crud !== "Insert") {
      return <input type="hidden" value={conNo} readOnly />;
    } else {
      return null;
    }
  }

  render() {
    const conName = this.state.conName;
    const conEmail = this.state.conEmail;
    const conPhone = this.state.conPhone;
    const conContent = this.state.conContent;

    return (
      <>
        <h1>게시글 {this.createHeaderName()}</h1>
        {this.createconNoTag()}
        <h3>이름</h3>
        <input
          type="text"
          value={conName}
          onChange={(event) =>
            this.setState({ conName: event.target.value })
          }
        />
        <br />
        <h3>이메일</h3>
        <input
          type="text"
          value={conEmail}
          onChange={(event) =>
            this.setState({ conEmail: event.target.value })
          }
        />
        <br />
        <h3>연락처</h3>
        <input
          type="text"
          value={conPhone}
          onChange={(event) =>
            this.setState({ conPhone: event.target.value })
          }
        />
        <br />
        <h3>내용</h3>
        <textarea
          rows="10"
          cols="20"
          value={conContent}
          onChange={(event) =>
            this.setState({ conContent: event.target.value })
          }
        ></textarea>
        <br /> <br />
        {this.createCrudBtn()}
      </>
    );
  }
}

InputForm.defaultProps = {
  crud : 'Insert'
}

export default InputForm;