import 'package:http/http.dart' as http;
import 'package:template/helpers/controller.dart';
import 'package:template/modules/dashboard/models/dashboard.models.dart';
import 'package:template/routes/api.dart';
import 'dart:convert';

import 'package:template/storage/user.dart';


class DashboardController extends Controller{
  String modules = DashboardModels.modules;

  Future<String> changeDataObject() async{
    return "DATA BOS";
  }
  
  Future<String> getChangeData() async{
    return "Ganti yoiiii";
  }

  Future<List<User>> getData() async{
    List<User> _data = [];
    var request = await http.get(Api.route[modules]['getData']);
    if(request.statusCode == 200){
      var data = json.decode(request.body);      
      List result = data['data'];      
      for(var item in result){
        _data.add(User.fromJson(item));
      }
    }  

    return _data;
  }
}