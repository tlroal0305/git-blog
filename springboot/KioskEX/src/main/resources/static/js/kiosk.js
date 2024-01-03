//kiosk.js

window.onload = function () {

  //cart db에 있는 것도 지운다. fetch_deleteCartItems()
  fetch_deleteCartItems();
  localStorage.removeItem("cartItems");
  localStorage.removeItem("selectedItems");

  var audio = new Audio("./audio/Touch_Order.mp3");
  audio.play();
  audio.autoplay = true;

  function goToOrderSelection() {
    window.location.href = "/loginForm";
  }

  var selectButton = document.getElementById("selectButton");
  selectButton.addEventListener("click", goToOrderSelection);

  const images = [
    "https://i.pinimg.com/564x/d6/4b/bf/d64bbf0b7b8eb8f835f6892f1e58490b.jpg",
    "https://i.pinimg.com/564x/25/18/3b/25183b486dcfbe0f75eee9137eafa9c6.jpg",
    "https://i.pinimg.com/564x/c9/ed/3f/c9ed3f7564dfde8ae4ed4816736cd30f.jpg",
  ];
  const changingImage = document.getElementById("changingImage");
  let currentIndex = 0;

  function changeImage() {
    changingImage.src = images[currentIndex];
    currentIndex = (currentIndex + 1) % images.length;
  }

  setInterval(changeImage, 3000);
};


function fetch_deleteCartItems(){
    fetch("/deleteCartItems", {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
    })
    .then((response) => {
        console.log("response:"+response);
        return response.json();
    }) //HTTP 응답
    .then((json) => {
        //{ status: "ok", result: 5 }
        console.log("json:" + json);
        console.log("json:" + JSON.stringify(json));
    })
    .catch((error) => {
        console.log(error);
    });
}