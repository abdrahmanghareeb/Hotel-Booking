import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static String url =
      "https://booking-com15.p.rapidapi.com/api/v1/hotels/searchHotels?dest_id=-290692&search_type=CITY&arrival_date=2024-05-09&departure_date=2024-05-13&languagecode=en-us";

  static Future<Map<String, dynamic>> getResponse() async {
    print("hey i am here");
    // var url = Uri.parse(DotEnv().env["BASEURL"]!);
    var parsedUri = Uri.parse(url);
    print("parsedUri : $parsedUri");
    try {
      var response = await http.get(parsedUri, headers: {
        'X-RapidAPI-Key': 'a3bf256b4emsh82ac65c4db4eac2p1c2aa4jsn1f82750c439d',
        'X-RapidAPI-Host': 'booking-com15.p.rapidapi.com'
      });
      print("response : ${response.body}");
      if (response.statusCode == 200) {
        var ResponseBody = jsonDecode(response.body);
        print("Response body : $ResponseBody");
        return ResponseBody;
        //   var saveToReturn = HotelListData.fromJson(ResponseBody);
        //   print(
        //     "Model titletxt : ${saveToReturn.titleTxt}"+
        //     "Model imagePath : ${saveToReturn.imagePath}"+
        //     "Model perNight : ${saveToReturn.perNight}"+
        //     "Model rating : ${saveToReturn.rating}"+
        //     "Model reviews : ${saveToReturn.reviews}"+
        //     "Model subtxt : ${saveToReturn.subTxt}");
        //   return saveToReturn;
      } else {
        // If the response status is not 200, throw an error
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data: ${e.toString()}');
    }
  }
}
