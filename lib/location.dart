import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class LocationService {

  Future<String>getPlaceId(String input) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=AIzaSyAaV-7bOTONs2ciGt7tS69YJA9jhxGCa3o";

    var response = await http.get(Uri.parse(url)) ;
    var result = convert.jsonDecode(response.body) ;
    var placeId = result['candidates'][0]['place_id'];
    return placeId;
  }

  Future<Map<String, dynamic>> getToPlace(String input) async{
    final placeId = await getPlaceId(input);
    var url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyAaV-7bOTONs2ciGt7tS69YJA9jhxGCa3o";
    var place = await Dio().getUri(Uri.parse(url));

    var result = place.data;

    var places  = result['result'] as Map<String,dynamic>;

    print(places);
    return places;
  }
}
