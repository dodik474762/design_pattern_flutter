// import 'dart:io';

// import 'package:template/helpers/controller.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/events/scanner.events.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/state/scanner.state.dart';
import 'package:template/modules/verifikasibhnbaku/models/verifikasi.models.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  @override
  ScannerState get initialState => InitDataScanner();

  @override
  Stream<ScannerState> mapEventToState(ScannerEvent event) async* {
    // print(event);
    if (event is ScanQr) {
      // print("scannerd");
      String cameraScanResult = await scanner.scan();
      yield OutputHasilScanQr(qrcode: cameraScanResult);
    }
  }
}
