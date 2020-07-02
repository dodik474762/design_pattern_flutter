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

class BeforeScanQr extends ScannerState {
  @override
  List<Object> get props => [];
}

class QrScanFailed extends ScannerState {
  String error;
  QrScanFailed({this.error});

  @override
  List<Object> get props => [error];
}

class QrScanSuccess extends ScannerState {
  String message;
  String kavlingScanned;
  QrScanSuccess({this.message, this.kavlingScanned});

  @override
  List<Object> get props => [message, kavlingScanned];
}
