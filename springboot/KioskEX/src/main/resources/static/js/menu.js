//menu.js

window.addEventListener("load", function () {

  fetch_itemlist();

});

let recommendItems = [];
let burgerSetItems = [];
let happyMealItems = [];
let coffeeItems = [];
let dessertItems = [];
let drinksItems = [];

let arrayCart = [];

function fetch_itemlist(){
    fetch("/itemlistAll", {
      method: "GET",
      headers: { "Content-Type": "application/json" },
      //body: JSON.stringify({
      //  calType: "add",
      //}),
    })
  .then((response) => {
    //console.log("response:"+response);
    return response.json();
  }) //HTTP 응답
  .then((json) => {
    //{ status: "ok", result: 5 }
    //console.log("json:" + json);

    recommendItems = json.itemlistRecommand;
    burgerSetItems = json.itemlistBurgerset;
    happyMealItems = json.itemlistHappymeal;
    coffeeItems = json.itemlistCoffee;
    dessertItems = json.itemlistDesert;
    drinksItems = json.itemlistDrink;

    onload_func();

  }) //실제 데이타
  .catch((error) => {
    console.log(error);
  });
}

function onload_func(){
  const recommendMenuButton = document.getElementById("recommendMenu");
  resetButtonStyles();
  recommendMenuButton.classList.add("selected");

  // 첫 화면 - 추천 메뉴
  const sectionContent = document.querySelector(".section");
  recommendMenuButton.click();

  // 추가 메뉴에서 사용하도록 저장
  localStorage.setItem("recommendItems", JSON.stringify(recommendItems));

  // 로컬 저장소 아이템 불러오기
  const savedCartItems = JSON.parse(localStorage.getItem("cartItems")) || [];
  arrayCart = savedCartItems;

}

// 주문 상세보기로 이동
function goToCart() {
  window.location.href = "/Cart";
}

function goToBack() {
  localStorage.removeItem("cartItems");
  window.location.href = "/main";
}

function goToPay() {
  window.location.href = "/AddItem";
}

const images = [
  "https://www.mcdonalds.co.kr/upload/main/banner/1680589479787.jpg",
  "https://www.mcdonalds.co.kr/upload/main/banner/1681352070104.jpg",
  "https://www.mcdonalds.co.kr/upload/main/banner/1690955803613.jpg",
];
const changingImage = document.getElementById("changingImage");
let currentIndex = 0;

function changeImage() {
  changingImage.src = images[currentIndex];
  currentIndex = (currentIndex + 1) % images.length;
}

setInterval(changeImage, 3000);

function goToOrderSelection() {
  localStorage.removeItem("cartItems");
  window.location.href = "/OrderSelect";
}

//이전 버튼 관련
var returnButton = document.getElementById("returnButton");
returnButton.addEventListener("click", goToOrderSelection);

let currentPage = 1;
const itemsPerPage = 9;

//네비게이션 버튼 관련

function getSelectedItems() {
  const selectedButton = document.querySelector(".nav button.selected");

  if (selectedButton.id === "coffee") {
    return coffeeItems;
  } else if (selectedButton.id === "burgerSet") {
    return burgerSetItems;
  } else if (selectedButton.id === "recommendMenu") {
    return recommendItems;
  } else if (selectedButton.id === "happyMeal") {
    return happyMealItems;
  } else if (selectedButton.id === "dessert") {
    return dessertItems;
  } else if (selectedButton.id === "drinks") {
    return drinksItems;
  }
}

function updateContent(items) {
  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  const paginatedItems = items.slice(startIndex, endIndex);

  const sectionContent = document.querySelector(".section");
  sectionContent.innerHTML = "";

  const rmBoxContainer = document.createElement("div");
  rmBoxContainer.classList.add("rmBox_Container");

  paginatedItems.forEach((item) => {
   const itemHTML = `
        <button class="rmBox_inner" onclick="add('${item.itemCode}')">
          <img src="${item.itemImageUrl}" alt="${item.itemName}" />
          <span class="rmBox_title">${item.itemName}</span>
          <span class="rmBox_money">${item.itemPrice}원</span>
        </button>
      `;
//    const itemHTML = `
//      <button class="rmBox_inner" onclick="add('${item.id}')">
//        <img src="${item.imageUrl}" alt="${item.title}" />
//        <span class="rmBox_title">${item.title}</span>
//        <span class="rmBox_money">${item.price}원</span>
//      </button>
//    `;
    rmBoxContainer.innerHTML += itemHTML;
  });

  sectionContent.appendChild(rmBoxContainer);
}

// 카트 담기

function updateCartSummary() {
  const cartTotalElement = document.getElementById("cartTotal");
  const cartQuantityElement = document.getElementById("cartQuantity");

  let total = 0;
  let quantity = 0;
  for (const cart of arrayCart) {
    //total += cart.price * cart.count;
    //quantity += cart.count;
    total += cart.itemPrice * cart.cartItemAmount;
    quantity += cart.cartItemAmount;
  }

  cartTotalElement.textContent = `총 가격: ${total.toLocaleString()}원`;
  cartQuantityElement.textContent = `수량: ${quantity}`;
}

function updateCartItem(productIndex, newCount) {
  // 로컬 저장소 데이터 불러오기
  const cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];

  for (const cart of cartItems) {
    //if (cart.id === productIndex) {
    if (cart.itemCode === productIndex) {
      //cart.count = newCount;
      cart.cartItemAmount = newCount;
      break;
    }
  }

  // 데이터 업데이트
  localStorage.setItem("cartItems", JSON.stringify(cartItems));

  // 화면 업데이트
  dispCart();
  updateCartSummary();
}

function uuidv4() {
  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
  );
}

//Control : Code
function add(productIndex) {
  //console.log("add");
  //console.log("productIndex:"+productIndex);
  //console.log("arrayCart:"+arrayCart);
    console.log(uuidv4())
    // 388cae56-28e9-434e-a3f9-05fe3502f826


  //이미 담겨있는가? 확인하기
  let found = false;
  for (let cart of arrayCart) {
    if (cart.itemCode == productIndex) {
    //if (cart.id == productIndex) {
      found = true;

      //cart.count += 1;
      //updateCartItem(productIndex, cart.count);
      cart.cartItemAmount += 1;
      updateCartItem(productIndex, cart.cartItemAmount);
      break;
    }
  }

 //console.log("found:"+found);

  if (found == false) {
    const selectedItem = getSelectedItems().find(
      //(item) => item.id === productIndex
      (item) => item.itemCode === productIndex
    );
    if (selectedItem) {
      arrayCart.push({
        cartCode: uuidv4(),
        itemCode: selectedItem.itemCode,
        itemName: selectedItem.itemName,
        itemImageUrl: selectedItem.itemImageUrl,
        itemPrice: selectedItem.itemPrice,
        cartItemAmount: 1,
//        id: productIndex,
//        name: selectedItem.title,
//        imageUrl: selectedItem.imageUrl,
//        price: selectedItem.price,
//        count: 1,
      });

      localStorage.setItem("cartItems", JSON.stringify(arrayCart));
    }
  }

  // 화면 업데이트
  dispCart();
  updateCartSummary();
}

// 비우기 버튼
function removeAll() {
  arrayCart = [];
  localStorage.removeItem("cartItems");

  dispCart();
  updateCartSummary();
}

// 카트에 스크롤 기능 넣기
const cartList = document.getElementById("cartList");
cartList.style.maxHeight = "200px";
cartList.style.overflow = "auto";

//View : HTML/CSS
function dispCart() {
  let cartList = document.getElementById("cartList");
  //지우기
  cartList.innerHTML = "";
  for (let cart of arrayCart) {
    let div = document.createElement("div");
    div.setAttribute("class", "cart_class");

    let img = document.createElement("img");
    //img.setAttribute("src", cart.imageUrl);
    img.setAttribute("src", cart.itemImageUrl);
    img.style.width = "50px";
    img.style.height = "40px";
    div.append(img);

    let span = document.createElement("span");
    span.setAttribute("class", "cart_num");
    //span.innerHTML = cart.count;
    span.innerHTML = cart.cartItemAmount;
    div.append(span);

    cartList.append(div);
  }
  updateCartSummary();
}

//이전, 다음 버튼 ( '<' 과 '>' )
document.getElementById("prevButton").addEventListener("click", function () {
  if (currentPage > 1) {
    currentPage--;
    updateContent(getSelectedItems());
  }
});

document.getElementById("nextButton").addEventListener("click", function () {
  const totalPageCount = Math.ceil(burgerSetItems.length / itemsPerPage);
  if (currentPage < totalPageCount) {
    currentPage++;
    updateContent(getSelectedItems());
  }
});

document.getElementById("recommendMenu").addEventListener("click", function () {
  document.querySelector(".headerText").textContent = "추천 메뉴";
  const sectionContent = document.querySelector(".section");

  resetButtonStyles();
  this.classList.add("selected");

  currentPage = 1;
  updateContent(recommendItems);
});

document.getElementById("burgerSet").addEventListener("click", function () {
  document.querySelector(".headerText").textContent = "버거 & 세트";
  const sectionContent = document.querySelector(".section");

  resetButtonStyles();

  this.classList.add("selected");

  currentPage = 1;
  updateContent(burgerSetItems);
});


document.getElementById("happyMeal").addEventListener("click", function () {
  document.querySelector(".headerText").textContent = "해피밀";
  const sectionContent = document.querySelector(".section");

  resetButtonStyles();

  this.classList.add("selected");

  currentPage = 1;
  updateContent(happyMealItems);
});

document.getElementById("coffee").addEventListener("click", function () {
  document.querySelector(".headerText").textContent = "커피";
  const sectionContent = document.querySelector(".section");

  resetButtonStyles();

  this.classList.add("selected");

  currentPage = 1;
  updateContent(coffeeItems);
});

document.getElementById("dessert").addEventListener("click", function () {
  document.querySelector(".headerText").textContent = "디저트";
  const sectionContent = document.querySelector(".section");

  resetButtonStyles();

  this.classList.add("selected");

  currentPage = 1;
  updateContent(dessertItems);
});

document.getElementById("drinks").addEventListener("click", function () {
  document.querySelector(".headerText").textContent = "음료";
  const sectionContent = document.querySelector(".section");

  resetButtonStyles();

  this.classList.add("selected");

  currentPage = 1;
  updateContent(drinksItems);
});

// 버튼 스타일 초기화
function resetButtonStyles() {
  const buttons = document.querySelectorAll(".nav button");
  buttons.forEach((button) => {
    button.classList.remove("selected");
  });
}
