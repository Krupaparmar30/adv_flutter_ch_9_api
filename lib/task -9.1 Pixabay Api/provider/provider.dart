import 'package:adv_flutter_ch_9/helper/pixaapi_api_helper/pixaapi_api_helper.dart';
import 'package:adv_flutter_ch_9/task%20-9.1%20Pixabay%20Api/modal/modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PixaApiProvider extends ChangeNotifier{

ApiHelper apiHelper = ApiHelper();
PixaBayModal? pixaBayModal;
  String searchIma='';
  void getImages(String ima)
  {
    searchIma=ima;
    notifyListeners();
  }

  Future<PixaBayModal?> fromMap(String ima)
  async {
    final data= await apiHelper.fetchApiData(ima);
    pixaBayModal=PixaBayModal.fromjson(data);

    return pixaBayModal;

  }

}


