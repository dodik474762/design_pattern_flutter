import 'package:template/config/url.dart';
import 'package:template/modules/dashboard/models/dashboard.models.dart';
import 'package:template/modules/login/models/login.models.dart';
import 'package:template/modules/verifikasibhnbaku/models/verifikasi.models.dart';

//untuk route url api per modules
class Api {
  static Map route = {
    DashboardModels.modules: {'getData': Url.appsurl + "/login/getData"},
    VerifikasiModel.modules: {
      'verifikasi': Url.appsurl + "/verifikasi/verify",
      'getDataSopirMasukUntukPenerimaan':
          Url.appsurl + "/verifikasi/getDataSopirMasukUntukPenerimaan",
    },
    "penerimaan/verifikasibarcode": {
      "getListPengajuanSiapVerifikasiBongkar":Url.appsurl + "/penerimaan/verifikasibarcode/getListPengajuanSiapVerifikasiBongkar",
      "verifikasiBongkar": Url.appsurl + "/penerimaan/verifikasibarcode/verifikasiBongkar",
      "verifikasiBarcode": Url.appsurl + "/penerimaan/verifikasibarcode/verifikasiBarcode"
    },
    LoginModel.modules:{
      "sign_in": Url.appsurl + "/"+LoginModel.modules+"/sign_in",
    }
  };
}
