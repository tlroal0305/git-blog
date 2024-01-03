window.onload = function () {};

function fileAction() {

  let params = {
    loginId: idValue,
    loginPw: pwValue,
  };
  console.log(JSON.stringify(params));

  fetch("/upload", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(params),
  })
    .then((response) => {
      console.log("response:" + response);
      console.log("response:" + JSON.stringify(response));
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      //{ status: "ok", result: 5 }
      console.log("json:" + json);
      console.log("response:" + JSON.stringify(json));

      if (json.result == 1) {
        window.location.href = "/OrderSelect";
        if (params.loginId == "admin") {
          window.location.href = "/MemberList";
        }
      } else {
        //로그인 실패
        alert("로그인 실패입니다.");
      }
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}

function loginAsGuest() {
  window.location.href = "/OrderSelect";
}

function joinForm() {
  window.location.href = "/joinForm";
}
