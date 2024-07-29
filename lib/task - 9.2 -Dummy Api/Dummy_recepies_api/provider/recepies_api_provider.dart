
import 'package:adv_flutter_ch_9/helper/Dummy/recepies_api_helper/recepies_api_helper.dart';
import 'package:flutter/material.dart';

import '../modal/recepies_api_modal.dart';

class RecepiesApiProvider extends ChangeNotifier{

  RecipesApiHelper recipesApiHelper=RecipesApiHelper();
  RecipesData? recipesData;
  Future<RecipesData?> fromMap()
  async {
    final data=await recipesApiHelper.fetchResApiData();
    recipesData=RecipesData.fromJson(data);
    return recipesData;
  }

}