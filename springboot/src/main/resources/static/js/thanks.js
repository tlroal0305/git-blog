//thanks.js

// 랜덤한 주문번호 생성 -> 서버에 있는 마지막번호 + 1로 수정
var randomOrderNumber = Math.floor(Math.random() * 10000) + 1; // 1부터 1000 사이의 랜덤 숫자
var orderNumberElement = document.getElementById("orderNumber");
orderNumberElement.textContent = randomOrderNumber;

//5초 뒤 Thanks 화면으로 이동
setTimeout(function () {

  //cart db에 있는 것도 지운다. fetch_deleteCartItems()
  localStorage.removeItem("cartItems");
  localStorage.removeItem("selectedItems");

  window.location.href = "/main";
}, 5000);



