function click_member() {
  let menu_member = document.getElementById("menu_member");
  let menu_item = document.getElementById("menu_item");
  let menu_order = document.getElementById("menu_order");

  menu_member.classList.remove("menu_height");
  menu_item.classList.remove("menu_height");
  menu_order.classList.remove("menu_height");

  menu_member.classList.add("menu_height");

  //페이지 이동
  window.location.href = "/adminMember";
}
function click_item() {
  let menu_member = document.getElementById("menu_member");
  let menu_item = document.getElementById("menu_item");
  let menu_order = document.getElementById("menu_order");

  menu_member.classList.remove("menu_height");
  menu_item.classList.remove("menu_height");
  menu_order.classList.remove("menu_height");

  menu_item.classList.add("menu_height");

  //페이지 이동
  window.location.href = "/adminItem";
}
function click_order() {
  let menu_member = document.getElementById("menu_member");
  let menu_item = document.getElementById("menu_item");
  let menu_order = document.getElementById("menu_order");

  menu_member.classList.remove("menu_height");
  menu_item.classList.remove("menu_height");
  menu_order.classList.remove("menu_height");

  menu_order.classList.add("menu_height");

  //페이지 이동
  window.location.href = "/adminOrder";
}

function func_member_update(memberNo) {
  window.location.href = "/adminMemberUpdate?memberNo=" + memberNo;
}

function func_member_updateAction() {
  const inputMemberNo = document.getElementById("inputMemberNo").value;
  const inputMemberId = document.getElementById("inputMemberId").value;
  const inputMemberPw = document.getElementById("inputMemberPw").value;
  const inputMemberName = document.getElementById("inputMemberName").value;
  const inputMemberRole = document.getElementById("inputMemberRole").value;
  const inputMemberPoint = document.getElementById("inputMemberPoint").value;
  const inputMemberJoinDatetime = document.getElementById(
    "inputMemberJoinDatetime"
  ).value;

  let params = {
    memberNo: inputMemberNo,
    memberId: inputMemberId,
    memberPw: inputMemberPw,
    memberName: inputMemberName,
    memberRole: inputMemberRole,
    memberPoint: inputMemberPoint,
    memberJoinDatetime: inputMemberJoinDatetime,
  };

  fetch("/memberUpdateAction", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(params),
  })
    .then((response) => {
      console.log("response:" + response);
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      //{ status: "ok", result: 5 }
      console.log("json:" + json);

      //다음페이지로 이동
      window.location.href = "/adminMember";
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}

function func_member_delete(memberNo) {
  const result = confirm("삭제할까요?");
  if (result == false) {
    return;
  }

  let params = {
    memberNo: memberNo,
  };

  fetch("/memberDeleteAction", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(params),
  })
    .then((response) => {
      console.log("response:" + response);
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      //{ status: "ok", result: 5 }
      console.log("json:" + json);

      //다음페이지로 이동
      window.location.href = "/adminMember";
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}

function func_item_delete(itemNo){
  const result = confirm("삭제할까요?");
  if (result == false) {
    return;
  }

  let params = {
    itemNo: itemNo,
  };

  fetch("/itemDeleteAction", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(params),
  })
    .then((response) => {
      console.log("response:" + response);
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      //{ status: "ok", result: 5 }
      console.log("json:" + json);

      //다음페이지로 이동
      window.location.href = "/adminItem";
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}

function func_item_update(itemNo) {
  window.location.href = "/adminItemUpdate?itemNo=" + itemNo;
}

function onClickUpload() {
  let inputItemImageUrl = document.getElementById("inputItemImageUrl");
  inputItemImageUrl.click();
}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById("imgItemImageUrl").src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById("imgItemImageUrl").src = "";
  }

  let inputItemImageUrl = document.getElementById("inputItemImageUrl");
  console.log("input:file value:" + inputItemImageUrl.value);
  console.log("files:" + inputItemImageUrl.files[0]);
}

function func_item_updateAction() {
  image_upload();
}

function image_upload(){

  let inputItemImageUrl = document.getElementById("inputItemImageUrl");

  let fileUrl = inputItemImageUrl.value; //C:\fakepath\cosmos.jpg
  let index = fileUrl.lastIndexOf("\\");
  let fileName = fileUrl.substr(index+1); //cosmos.jpg
  console.log("fileName:" + fileName);

  let form = new FormData();
  form.enctype = "multipart/form-data";
  form.append('file', inputItemImageUrl.files[0], fileName);

  fetch('/upload', {
    method: "POST",
    headers: {
      //"Content-Type": "multipart/form-data"
    },
    body: form,
  })
  .then((response) => {
    console.log("response:" + response);
    console.log("response:" + JSON.stringify(response));

    return response.json();
  }) //HTTP 응답
  .then((json) => {
    //{ status: "ok", result: 5 }
    console.log("json:" + json);
    console.log("json:" + JSON.stringify(json));
    console.log("uploadFileName:" + json.uploadFileName);

    func_item_updateAction_json( json.uploadFileName );
  }) //실제 데이타
  .catch((error) => {
    console.log(error);
  });
}

function func_item_updateAction_json( itemImageUrl ) {
  const inputItemNo = document.getElementById("inputItemNo").value;
  const inputItemCode = document.getElementById("inputItemCode").value;
  const inputItemName = document.getElementById("inputItemName").value;
  //const inputItemImageUrl = document.getElementById("itemImageUrl").value;
  const inputItemCate = document.getElementById("inputItemCate").value;
  const inputItemPrice = document.getElementById("inputItemPrice").value;
  const inputItemRecommend = document.getElementById("inputItemRecommend").value;
  const inputItemUpdateDatetime = document.getElementById("inputItemUpdateDatetime").value;

  let params = {
    itemNo: inputItemNo,
    itemCode: inputItemCode,
    itemName: inputItemName,
    itemCate: inputItemCate,
    itemRecommend: inputItemRecommend,
    itemPrice: inputItemPrice,
    itemImageUrl: itemImageUrl,
    itemUpdateDatetime: inputItemUpdateDatetime,
  };

  fetch("/itemUpdateAction", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(params),
  })
    .then((response) => {
      console.log("response:" + response);
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      //{ status: "ok", result: 5 }
      console.log("json:" + json);
      //console.log("json:" + JSON.stringify(json));

      //다음페이지로 이동
      window.location.href = "/adminItem";
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}