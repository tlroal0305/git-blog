//7초 뒤 Thanks 화면으로 이동
//setTimeout(function () {
//  window.location.href = "/Thanks";
//}, 7000);

window.onload = function () {
  var audio = new Audio("./audio/payment.mp3");
  audio.play();
  audio.autoplay = true;

  // 로컬스토리지 불러오기
  const cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
  fetch_saveCartItems(cartItems);
};

document.addEventListener("DOMContentLoaded", () => {
  const cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
  const cartQuantityElement = document.getElementById("cartQuantity");
  const cartTotalElement = document.getElementById("cartTotal");

  // Calculate total quantity and total price
  const totalQuantity = cartItems.reduce(
    //(total, cartItem) => total + cartItem.count,
    (total, cartItem) => total + cartItem.cartItemAmount,
    0
  );
  const totalPrice = cartItems.reduce(
    //(total, cartItem) => total + cartItem.count * cartItem.price,
    (total, cartItem) => total + cartItem.cartItemAmount * cartItem.itemPrice,
    0
  );

  // Display total quantity and total price
  cartQuantityElement.textContent = `총 수량: ${totalQuantity}개`;
  cartTotalElement.textContent = `총 가격: ${totalPrice}원`;

  fetch_saveOrder(totalQuantity, totalPrice, cartItems);
  savePoint(totalPrice);
});

function getKST() {
  // 1. 현재 시간(Locale)
  const curr = new Date();
  console.log("현재시간(Locale) : " + curr + "<br>"); // 현재시간(Locale) : Tue May 31 2022 09:00:30

  // 2. UTC 시간 계산
  const utc = curr.getTime() + curr.getTimezoneOffset() * 60 * 1000;

  // 3. UTC to KST (UTC + 9시간)
  const KR_TIME_DIFF = 9 * 60 * 60 * 1000; //한국 시간(KST)은 UTC시간보다 9시간 더 빠르므로 9시간을 밀리초 단위로 변환.
  const kr_curr = new Date(utc + KR_TIME_DIFF); //UTC 시간을 한국 시간으로 변환하기 위해 utc 밀리초 값에 9시간을 더함.

  console.log("한국시간 : " + kr_curr); // 한국시간 : Tue May 31 2022 09:00:30 GMT+0900 (한국 표준시)

  return kr_curr;
}

function uuidv4() {
  return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, (c) =>
    (
      c ^
      (crypto.getRandomValues(new Uint8Array(1))[0] & (15 >> (c / 4)))
    ).toString(16)
  );
}

// Entity와 모두 맞춰줘야 함
function fetch_saveOrder(totalQuantity, totalPrice, cartItems) {
  var randomOrderNumber = Math.floor(Math.random() * 10000) + 1;
  // map 함수를 이용하여 cartItems 배열의 각 itemCode 속성을 추출
  const cartItemCodes = cartItems.map((cartItem) => cartItem.itemCode);

  let order = {
    orderNo: 0,
    orderCode: uuidv4(),
    cartItemCode1: cartItemCodes[0],
    cartItemCode2: cartItemCodes[1],
    cartItemCode3: cartItemCodes[2],
    cartItemCode4: cartItemCodes[3],
    cartItemCode5: cartItemCodes[4],
    orderTotalPrice: totalPrice,
    orderTotalCount: totalQuantity,
    orderNumber: randomOrderNumber,
    orderPayType: 1, //1 신용카드 2 간편결제
    orderState: "결제완료",
    orderDatetime: getKST(), // UTC+9
  };

  console.log("cartItem: " + JSON.stringify(cartItemCodes));
  console.log("order테이블 : " + JSON.stringify(order));

  fetch("/setOrder", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(order),
  })
    .then((response) => {
      console.log("response:" + response);
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      //{ status: "ok", result: 5 }
      console.log("json:" + json);

      //다음페이지로 이동
      //window.location.href = "/Payment";
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}
function fetch_saveCartItems(cartItems) {
  console.log("fetch_saveCartItems");
  console.log(JSON.stringify(cartItems));

  fetch("/setCartItems", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(cartItems),
  })
    .then((response) => {
      console.log("response:" + response);
      return response.json();
    }) //HTTP 응답
    .then((json) => {
      //{ status: "ok", result: 5 }
      console.log("json:" + json);

      //다음페이지로 이동
      //window.location.href = "/Payment";
    }) //실제 데이타
    .catch((error) => {
      console.log(error);
    });
}
function savePoint(totalPrice) {
  const point = {
    memberPoint: totalPrice * (1 / 100),
  };

  console.log("point: ", point); // 객체를 출력

  fetch("/savePoint", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(point), // 객체를 JSON 문자열로 변환하여 전송
  })
    .then((response) => {
      console.log("response: ", response);
      return response.json();
    }) // HTTP 응답
    .then((json) => {
      console.log("json: ", json); // 실제 데이터
    })
    .catch((error) => {
      console.log(error);
    });
}
