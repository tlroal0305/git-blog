function updateAction() {
  let itemNo = document.getElementById("itemNo").value;
  let itemName = document.getElementById("inputName").value;
  let itemImageUrl = document.getElementById("inputImg").value;
  let itemPrice = document.getElementById("inputPrice").value;
  let itemCode = document.getElementById("itemCode").value;
  let itemCate = document.getElementById("inputCate").value;
  let itemUpdateDatetime = document.getElementById("inputJoinDate").value;

  let params = {
    itemNo: itemNo,
    itemName: itemName,
    itemImageUrl: itemImageUrl,
    itemPrice: itemPrice,
    itemCode: itemCode,
    itemCate: itemCate,
    itemUpdateDatetime: itemUpdateDatetime,
  };
  console.log(JSON.stringify(params));

  fetch("/ItemUpdateAction", {
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
