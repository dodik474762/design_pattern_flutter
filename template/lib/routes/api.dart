import 'package:template/config/url.dart';
import 'package:template/modules/dashboard/models/dashboard.models.dart';

//untuk route url api per modules
class Api{

  static Map route = {
    DashboardModels.modules:{
      'getData': Url.appsurl+"/login/getData"
    }
  };
}