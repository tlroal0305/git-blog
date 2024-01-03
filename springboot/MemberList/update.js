function updateAction() {
  let memberId = document.getElementById("inputId").value;
  let memberPw = document.getElementById("inputPw").value;
  let memberName = document.getElementById("inputNickname").value;
  let memberRole = document.getElementById("inputRole").value;
  let memberJoinDate = document.getElementById("inputJoinDate").value;
  console.log("아이디" + memberId);

  let params = {
    memberId: memberId,
    memberPw: memberPw,
    memberName: memberName,
    memberRole: memberRole,
    memberJoinDate: memberJoinDate,
  };
  console.log(JSON.stringify(params));

  fetch("/update", {
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
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}
