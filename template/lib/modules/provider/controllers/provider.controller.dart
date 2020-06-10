
import 'package:template/helpers/controller.dart';
import 'package:template/modules/provider/models/providers.models.dart';

class ProviderController extends Controller{
  // String word = "";


  changeWord(String params){
    ProviderModels.word = params;
    notifyListeners();
  }

  String getWord(){
    return ProviderModels.word;
  }

}