import 'dart:convert';

import 'package:calorie_calculator/models/search_models.dart';
import 'package:http/http.dart' as http;

class SearchService {
  String url = "https://api.calorieninjas.com/v1/nutrition?query=";

  Future<List<Items>> getNutrition(String query) async {
    List<Items> foods = [];

    http.Response response = await http.get(
      Uri.parse(url + query),
      headers: {'X-Api-Key': 'n+MOXNhmQRVZ8pnHoV20wg==1x2ZN26AmcPVKmR0'},
    );
    print(Uri.parse(url + query).toString());

    var data = jsonDecode(response.body);
    print(data);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // for (var i in data["items"]) {
      //   Items nutrition = Items.fromMap(i);
      //   foods.add(nutrition);
      //   print(foods);
      // }
    }
    return foods;
  }
}
