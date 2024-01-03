
// <추천 메뉴>
let recommendItems = [
  {
    id: "recommend1",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583727841393.png",
    title: "빅맥®",
    price: "5200",
  },
  {
    id: "recommend2",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1599119588089.png",
    title: "1955 버거™",
    price: "5500",
  },
  {
    id: "recommend3",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583728339451.png",
    title: "맥스파이시® 상하이 버거",
    price: "5200",
  },
  {
    id: "recommend4",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583727633823.png",
    title: "맥치킨® 모짜렐라",
    price: "4700",
  },
  {
    id: "oreo",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1615378570338.png",
    title: "오레오 맥플러리",
    price: "3000",
  },
  {
    id: "berry",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1617837791724.png",
    title: "베리 스트로베리 맥플러리",
    price: "3000",
  },
  {
    id: "recommend7",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1690777108407.png",
    title: "창녕 갈릭 치킨 버거",
    price: "7400",
  },
  {
    id: "macWing",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1619158576990.png",
    title: "맥윙™콤보",
    price: "4000",
  },
  {
    id: "honeyButterFry",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1688446192658.png",
    title: "허니버터 맥쉐이커 후라이",
    price: "2700",
  },
];
// <버거 & 세트>
let burgerSetItems = [
  {
    id: "burger1",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1690777293665.png",
    title: "창녕 갈릭 치킨 버거 세트",
    price: "10900",
  },
  {
    id: "burger2",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1690777625183.png",
    title: "창녕 갈릭 비프 버거 세트",
    price: "10200",
  },
  {
    id: "burger3",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1614163214488.png",
    title: "빅맥® 세트",
    price: "7800",
  },
  {
    id: "burger4",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730166912.png",
    title: "더블 쿼터파운더® 치즈 세트",
    price: "10400",
  },
  {
    id: "burger5",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730926203.png",
    title: "쿼터파운더® 치즈 세트",
    price: "8900",
  },
  {
    id: "burger6",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1653437184803.png",
    title: "맥크리스피™ 디럭스 버거 세트",
    price: "9200",
  },
  {
    id: "burger7",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1653437044613.png",
    title: "맥크리스피™ 클래식 버거 세트",
    price: "8700",
  },
  {
    id: "burger8",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1614163251951.png",
    title: "맥스파이시® 상하이 버거 세트",
    price: "7800",
  },
  {
    id: "burger9",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1599120019760.png",
    title: "1955® 버거 세트",
    price: "8800",
  },
  {
    id: "burger10",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730423662.png",
    title: "맥치킨® 모짜렐라 세트",
    price: "8500",
  },
  {
    id: "burger11",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730386510.png",
    title: "맥치킨® 세트",
    price: "6300",
  },
  {
    id: "burger12",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730048428.png",
    title: "더블 불고기 버거 세트",
    price: "7300",
  },
  {
    id: "burger13",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1644572745053.png",
    title: "에그 불고기 버거 세트",
    price: "6500",
  },
  {
    id: "burger14",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730513407.png",
    title: "불고기 버거 세트",
    price: "5800",
  },
  {
    id: "burger15",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730764292.png",
    title: "슈슈 버거 세트",
    price: "7300",
  },
  {
    id: "burger16",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730718094.png",
    title: "슈비 버거 세트",
    price: "9100",
  },
  {
    id: "burger17",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730466187.png",
    title: "베이컨 토마토 디럭스 세트",
    price: "8700",
  },
  {
    id: "burger18",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730880048.png",
    title: "치즈버거 세트",
    price: "6000",
  },
  {
    id: "burger19",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583730095033.png",
    title: "더블치즈버거 세트",
    price: "7300",
  },
];
// <해피밀>
let happyMealItems = [
  {
    id: "happyMeal1",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583727790570.png",
    title: "해피밀 불고기 버거",
    price: "5500",
  },
  {
    id: "happyMeal2",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583728270768.png",
    title: "해피밀 햄버거™",
    price: "5500",
  },
  {
    id: "happyMeal3",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1612402426518.png",
    title: "해피밀 맥너겟® 4조각",
    price: "5500",
  },
];
// <커피>
let coffeeItems = [
  {
    id: "coffee1",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1658814730858.png",
    title: "디카페인 아이스크림 라떼",
    price: "4300",
  },
  {
    id: "coffee2",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1655284674592.png",
    title: "아이스크림 라떼",
    price: "4300",
  },
  {
    id: "coffee3",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1680590857356.png",
    title: "자두 천도복숭아 칠러",
    price: "3700",
  },
  {
    id: "coffee4",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1681287171454.png",
    title: "제주 한라봉 칠러",
    price: "3700",
  },
  {
    id: "coffee5",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677678747710.png",
    title: "바닐라 라떼",
    price: "4500",
  },
  {
    id: "coffee6",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1654652258015.png",
    title: "아이스 바닐라 라떼",
    price: "4500",
  },
  {
    id: "coffee7",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677680098077.png",
    title: "카페라떼",
    price: "4000",
  },
  {
    id: "coffee8",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677679191098.png",
    title: "디카페인 카페라떼",
    price: "4000",
  },
  {
    id: "coffee9",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1610885438226.png",
    title: "아이스 카페라떼",
    price: "4000",
  },
  {
    id: "coffee10",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1610887213766.png",
    title: "디카페인 아이스 카페라떼",
    price: "4000",
  },
  {
    id: "coffee11",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677680268942.png",
    title: "아메리카노",
    price: "3300",
  },
  {
    id: "coffee12",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677679695867.png",
    title: "디카페인 아메리카노",
    price: "3300",
  },
  {
    id: "coffee13",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1610887612850.png",
    title: "아이스 아메리카노",
    price: "3300",
  },
  {
    id: "coffee14",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1610889471102.png",
    title: "디카페인 아이스 아메리카노",
    price: "3300",
  },
  {
    id: "coffee15",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677679931462.png",
    title: "카푸치노",
    price: "4000",
  },
  {
    id: "coffee16",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677679466906.png",
    title: "디카페인 카푸치노",
    price: "4000",
  },
  {
    id: "coffee17",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1677680438743.png",
    title: "드립 커피",
    price: "2700",
  },
  {
    id: "coffee18",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1610889794131.png",
    title: "아이스 드립 커피",
    price: "2500",
  },
];

// <디저트>
let dessertItems = [
  {
    id: "berry",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1617837791724.png",
    title: "베리 스트로베리 맥플러리",
    price: "3700",
  },
  {
    id: "oreo",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1615378570338.png",
    title: "오레오 맥플러리",
    price: "3700",
  },
  {
    id: "dessert3",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1615378501027.png",
    title: "딸기 오레오 맥플러리",
    price: "3700",
  },
  {
    id: "dessert4",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1615378442605.png",
    title: "초코 오레오 맥플러리",
    price: "3700",
  },
  {
    id: "dessert5",
    imageUrl:
      "https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290248522400.png",
    title: "딸기 선데이 아이스크림",
    price: "2800",
  },
  {
    id: "dessert6",
    imageUrl:
      "https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290248295110.png",
    title: "초코 선데이 아이스크림",
    price: "2800",
  },
  {
    id: "dessert7",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1657246835409.png",
    title: "바닐라 선데이 아이스크림",
    price: "2800",
  },
];

// <음료>
let drinksItems = [
  {
    id: "drinks1",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1688445855221.png",
    title: "7곡 쉐이크",
    price: "3900",
  },
  {
    id: "drinks2",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583889953745.png",
    title: "코카-콜라",
    price: "2400",
  },
  {
    id: "drinks3",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1583890010342.png",
    title: "코카-콜라 제로",
    price: "2400",
  },
  {
    id: "drinks4",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1631160642498.png",
    title: "스프라이트",
    price: "2400",
  },
  {
    id: "drinks5",
    imageUrl:
      "https://www.mcdonalds.co.kr/upload/product/pcList/1631160682409.png",
    title: "환타",
    price: "2400",
  },
  {
    id: "drinks6",
    imageUrl:
      "https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290255488970.png",
    title: "바닐라 쉐이크",
    price: "3500",
  },
  {
    id: "drinks7",
    imageUrl:
      "https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290257347040.png",
    title: "딸기 쉐이크",
    price: "3500",
  },
  {
    id: "drinks8",
    imageUrl:
      "https://www.mcdonalds.co.kr/uploadFolder/product/prol_201901290257444640.png",
    title: "초코 쉐이크",
    price: "3500",
  },
];

