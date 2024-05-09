import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/datas/dummy_datas.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});