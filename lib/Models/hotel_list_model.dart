import 'package:hotel_booking/Controllers/Api_Services.dart';

class HotelListData
{
  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  String reviews;
  String perNight;

  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = '',
    this.dist = 1.8,
    this.rating = 4.5,
    this.reviews = "80",
    this.perNight = "180",
  });
  // factory HotelListData.fromJson(Map<String, dynamic> json) {
  //   return HotelListData(
  //     imagePath: json["data"]["hotels"][0]["property"]["photoUrls"][0],
  //     titleTxt: json["data"]["hotels"][0]["property"]["name"],
  //     subTxt: json["data"]["hotels"][0]["property"]["wishlistName"], perNight: json["data"]["hotels"][0]["property"]["priceBreakdown"]["grossPrice"]["value"].round().toString(),
  //     rating: json["data"]["hotels"][0]["property"]["reviewScore"],
  //     reviews: json["data"]["hotels"][0]["property"]["reviewCount"].round().toString()
  //   );
  // }

  static List<HotelListData> hotelList = dummyList;



  static List<HotelListData> dummyList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotel/hotel_5.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: "80",
      rating: 4.4,
      perNight: "180",
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_4.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 4.0,
      reviews: "74",
      rating: 4.5,
      perNight: "200",
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_3.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 3.0,
      reviews: "62",
      rating: 4.0,
      perNight: "60",
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_2.png',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      dist: 7.0,
      reviews: "90",
      rating: 4.4,
      perNight: "170",
    ),
    HotelListData(
      imagePath: 'assets/hotel/hotel_1.png',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      dist: 2.0,
      reviews: "240",
      rating: 4.5,
      perNight: "200",
    ),
  ];
}
