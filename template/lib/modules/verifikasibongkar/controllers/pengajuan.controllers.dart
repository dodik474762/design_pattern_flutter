
import 'dart:convert';

import 'package:get/get.dart';
import 'package:template/modules/login/models/login.models.dart';
import 'package:template/modules/verifikasibongkar/models/kavling.models.dart';
import 'package:template/routes/api.dart';
import 'package:http/http.dart' as http;
import 'package:template/storage/lot_reservations_barcode.dart';

class PengajuanController extends GetxController{
    bool reload = true;

    void getListPengejuan() async{
      Map<String, dynamic> params = {};
      params["username"] = LoginModel.user_id;
      params["departemen"] = LoginModel.departemen;

      var request = await http
          .post(Api.route["penerimaan/verifikasibarcode"]['getListPengajuanSiapVerifikasiBongkar'], body: params);

      if (request.statusCode == 200) {
//        print(request.body.toString());
        var data = json.decode(request.body);
        List<Lot_reservations_barcode> dataAdd = [];
        for (var item in data['data']) {
          item["id"] = item['id'].toString();
          item["lot_reservation"] = item['lot_reservation'].toString();
          item["issuer"] = item['issuer'].toString();
          item["warehouse_barcode_verified"] = item['warehouse_barcode_verified'].toString();
          item["qc_barcode_verified"] = item['qc_barcode_verified'].toString();
          item["warehouse_barcode_unloaded"] = item['warehouse_barcode_unloaded'].toString();
          item["qc_barcode_unloaded"] = item['qc_barcode_unloaded'].toString();
          dataAdd.add(Lot_reservations_barcode.fromJson(item));
        }

        KavlingModel.data.clear();
        KavlingModel.data.addAll(dataAdd);
        this.reload = false;
        update();
      }
    }
}