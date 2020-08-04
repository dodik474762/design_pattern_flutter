
import 'package:get/state_manager.dart';

class ExampleController extends GetxController{
  String result = "";

  void getResult (String result){
    this.result = result;
    update();
  }
}