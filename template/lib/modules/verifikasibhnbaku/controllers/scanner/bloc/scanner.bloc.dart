// import 'dart:io';

// import 'package:template/helpers/controller.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/events/scanner.events.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/state/scanner.state.dart';
import 'package:template/modules/verifikasibhnbaku/models/verifikasi.models.dart';
import 'package:template/routes/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  @override
  ScannerState get initialState => InitDataScanner();

  @override
  Stream<ScannerState> mapEventToState(ScannerEvent event) async* {
    if (event is ScanQr) {
      print("camera_result : ");
      String cameraScanResult = await scanner.scan();
      yield BeforeScanQr();
      try {
        VerifikasiModel.params["nomor_panggil"] = cameraScanResult;
        var request = await http.post(
            Api.route[VerifikasiModel.modules]['verifikasi'],
            body: VerifikasiModel.params);
        if (request.statusCode == 200) {
          // print(request.body);
          var data = json.decode(request.body);
          var msg = data['data'][0]['notifikasi'];
          // print(msg);
          yield QrScanSuccess(
              message: msg.toString(), kavlingScanned: cameraScanResult);
        } else {
          print("GAGAL CAM");
          yield QrScanFailed(error: request.statusCode.toString());
        }
      } catch (e) {
        print("GAGAL CAM2");
        yield QrScanFailed(error: e.message.toString());
      }
    }

    if(event is NewScanQr){
      print("NEW SCAN");
    }
//    scanner.scan().

  }

  @override
  void onError(Object error, StackTrace stackTrace) {
      print("ERROR BOOSS"+error);
  }
}
