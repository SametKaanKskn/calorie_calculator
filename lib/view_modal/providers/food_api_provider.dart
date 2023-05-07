import 'package:flutter/widgets.dart';

import '../../models/search_models.dart';
import '../services/searc_service.dart';

class FoodApiProvider with ChangeNotifier {
  List<Items> _itemsList = [];

  List<Items> get getItemsList => _itemsList;

  var service = SearchService();

  Future<void> getNutrition(String query) async {
    _itemsList = await service.getNutrition(query);
    notifyListeners();
  }
}
