
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:template/modules/dashboard/controllers/dashboard.controller.dart';
import 'package:template/modules/provider/controllers/provider.controller.dart';


//untuk registrasi controller , jika controller tidak diregistrasi di sini maka tidak akan jalan
class Register{
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context)=> ProviderController()),
    ChangeNotifierProvider(create: (context)=> DashboardController()),
  ];
}