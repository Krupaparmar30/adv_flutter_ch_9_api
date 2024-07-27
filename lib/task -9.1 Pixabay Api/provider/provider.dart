import 'package:adv_flutter_ch_9/helper/pixaapi_api_helper/pixaapi_api_helper.dart';
import 'package:adv_flutter_ch_9/task%20-9.1%20Pixabay%20Api/modal/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PixaApiProvider extends ChangeNotifier{

  PixaApiHelper pixaApiHelper=PixaApiHelper();
  PixaModal? pixaModal;
  Future<PixaModal?> fromMap()
  async {
    final data= await pixaApiHelper.fetchApiData();
    pixaModal=PixaModal.fromJson(data);
    notifyListeners();
    return pixaModal;

  }

}