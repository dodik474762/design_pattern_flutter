import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/config/socket.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'dart:convert';

import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/bloc/aktifitas.bloc.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/events/aktifitas.events.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/state/aktifitas.state.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/bloc/scanner.bloc.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/events/scanner.events.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/scanner/state/scanner.state.dart';
import 'package:template/modules/verifikasibhnbaku/models/verifikasi.models.dart';

class VerifikasiBhnBaku extends StatefulWidget {
  VerifikasiBhnBaku({Key key}) : super(key: key);

  @override
  _VerifikasiBhnBakuState createState() => _VerifikasiBhnBakuState();
}

class _VerifikasiBhnBakuState extends State<VerifikasiBhnBaku> {
  AktifitasBloc _bloc;
  ScannerBloc _blocScanner;

  @override
  void initState() {
    super.initState();
    _bloc = new AktifitasBloc();
    _blocScanner = new ScannerBloc();

    WebSocketConfig.init();
    WebSocketConfig.socketIO.subscribe('scan', (data) {
      var result = json.decode(data);
      VerifikasiModel.aktifitas = result['aktifitas'].toString();
      print(result['aktifitas']);
      _bloc.add(PerbaharuiAktifitas());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verifikasi Bahan Baku"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
              child: BlocBuilder(
                  bloc: _bloc,
                  builder: (context, state) {
                    if (state is OutputAktifitas) {
                      return Text("${state.aktifitas}");
                    }

                    return Text("Belum ada pesan Masuk");
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: BlocBuilder(
                  bloc: _blocScanner,
                  builder: (context, state) {
                    if (state is OutputHasilScanQr) {
                      return Text("${state.qrcode}");
                    }

                    return Text("Belum ada Qr discan");
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: () {
            _blocScanner.add(ScanQr());
            //scan qrcode
          }),
    );
  }
}
