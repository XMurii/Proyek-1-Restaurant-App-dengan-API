import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyek_1_restaurant_app_dengan_api/data/model/restaurant_list_response.dart';

class ApiServices {
  static const String _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListResponse> getRestaurantList () async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant list!');
    }
  }
}