window.onload = function () {};

// 회원 정보 수정 함수
function updateAction() {
  let memberNo = document.getElementById("memberNo").value;
  let memberId = document.getElementById("inputId").value;
  let memberPw = document.getElementById("inputPw").value;
  let memberName = document.getElementById("inputNickname").value;
  let memberRole = document.getElementById("inputRole").value;
  let memberPoint = document.getElementById("inputPoint").value;
  let memberJoinDatetime = document.getElementById("inputJoinDate").value;

  let params = {
    memberNo: memberNo,
    memberId: memberId,
    memberPw: memberPw,
    memberName: memberName,
    memberRole: memberRole,
    memberPoint: memberPoint,
    memberJoinDatetime: memberJoinDatetime,
  };
  console.log(JSON.stringify(params));

  fetch("/updateAction", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(params),
  })
    .then((response) => {
      console.log("response:" + response);
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      console.log("json:" + json);

      if (json.result == 1) {
        // 회원 정보 수정
        window.location.href = "/MemberList";
      } else {
        //회원가입 실패
        alert("회원 정보 수정 실패입니다.");
      }
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}

// 상품 정보 수정 함수
function itemUpdateAction() {
  let itemNo = document.getElementById("itemNo").value;
  let itemName = document.getElementById("inputName").value;
  let itemImageUrl = document.getElementById("inputImg").value;
  let itemPrice = document.getElementById("inputPrice").value;
  let itemCode = document.getElementById("inputCode").value;
  let itemRecommend = document.getElementById("itemRecommend").value;
  let itemCate = document.getElementById("inputCate").value;
  let itemUpdateDatetime = document.getElementById("inputJoinDate").value;

  let params = {
    itemNo: itemNo,
    itemName: itemName,
    itemImageUrl: itemImageUrl,
    itemPrice: itemPrice,
    itemCode: itemCode,
    itemCate: itemCate,
    itemRecommend: itemRecommend,
    itemUpdateDatetime: itemUpdateDatetime,
  };
  console.log(JSON.stringify(params));

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

      if (json.result == 1) {
        // 상품 정보 수정
        window.location.href = "/ProductList";
      } else {
        //수정 실패
        alert("회원 정보 수정 실패입니다.");
      }
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}

// 주문 정보 수정 함수 orderUpdateForm
function orderUpdateForm() {
  // 안보이는 요소
  let cartItemCode1 = document.getElementById("cartItemCode1").value;
  let cartItemCode2 = document.getElementById("cartItemCode2").value;
  let cartItemCode3 = document.getElementById("cartItemCode3").value;
  let cartItemCode4 = document.getElementById("cartItemCode4").value;
  let cartItemCode5 = document.getElementById("cartItemCode5").value;
  let orderNo = document.getElementById("orderNo").value;
  let orderPayType = document.getElementById("orderPayType").value;
  // 보이는 요소
  let orderCode = document.getElementById("inputOrderCode").value;
  let orderTotalPrice = document.getElementById("inputOrderTotalPrice").value;
  let orderTotalCount = document.getElementById("inputOrderTotalCount").value;
  let orderNumber = document.getElementById("inputOrderNumber").value;
  let orderState = document.getElementById("inputOrderState").value;
  let orderDatetime = document.getElementById("inputOrderDatetime").value;

  let params = {
    cartItemCode1: cartItemCode1,
    cartItemCode2: cartItemCode2,
    cartItemCode3: cartItemCode3,
    cartItemCode4: cartItemCode4,
    cartItemCode5: cartItemCode5,
    orderNo: orderNo,
    orderPayType: orderPayType,
    orderCode: orderCode,
    orderTotalPrice: orderTotalPrice,
    orderTotalCount: orderTotalCount,
    orderNumber: orderNumber,
    orderState: orderState,
    orderDatetime: orderDatetime,
  };
  console.log(JSON.stringify(params));

  fetch("/orderUpdateAction", {
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
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}
