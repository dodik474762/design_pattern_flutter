import 'package:template/config/url.dart';
import 'package:template/modules/dashboard/models/dashboard.models.dart';

class Api{

  static Map route = {
    DashboardModels.modules:{
      'getData': Url.apps_url+"/login/getData"
    }
  };
}