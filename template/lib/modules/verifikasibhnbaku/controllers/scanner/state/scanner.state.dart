import 'package:equatable/equatable.dart';

abstract class ScannerState extends Equatable {
  const ScannerState();
}

class InitDataScanner extends ScannerState {
  const InitDataScanner();

  @override
  List<Object> get props => [""];
}

class OutputHasilScanQr extends ScannerState {
  String qrcode;
  OutputHasilScanQr({this.qrcode});

  @override
  List<Object> get props => [qrcode];
}
