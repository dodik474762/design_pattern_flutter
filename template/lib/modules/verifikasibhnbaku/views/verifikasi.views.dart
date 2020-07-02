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
import 'package:http/http.dart' as http;
import 'package:template/routes/api.dart';

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

    // WebSocketConfig.init();
    // WebSocketConfig.socketIO.subscribe('scan', (data) {
    //   // print(data['notifikasi']);
    //   var result = json.decode(data);
    //   VerifikasiModel.aktifitas = result['notifikasi'].toString();
    //   // print(result);
    //   _bloc.add(PerbaharuiAktifitas());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verifikasi Bahan Baku"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  padding: EdgeInsets.all(8),
                  child: RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.all(3),
                      child: Text(
                        "SILAKAN MENUJU KE KAVLING AB 11-5 DAN MELAKUKAN SCAN KARTU PADA KAVLING TSB",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                  )),
              Center(
                child: Text("PDOF010", style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("LUKMAN", style: TextStyle(fontSize: 24)),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("TERIMA",
                    style: TextStyle(fontSize: 24, color: Colors.green)),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: BlocBuilder(
                    bloc: _blocScanner,
                    builder: (context, state) {
                      if (state is QrScanSuccess) {
                        // print(state);
                        return Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Text("${state.message}",
                              style: TextStyle(fontSize: 24)),
                        );
                      }

                      return Text("Belum ada pesan Masuk",
                          style: TextStyle(fontSize: 24, color: Colors.orange));
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: BlocBuilder(
                    bloc: _blocScanner,
                    builder: (context, state) {
                      if (state is QrScanSuccess) {
                        return Text("${state.kavlingScanned}");
                      }

                      return Text("Belum ada Qr Kavling discan",
                          style: TextStyle(fontSize: 24));
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: BlocBuilder(
                    bloc: _blocScanner,
                    builder: (context, state) {
                      if (state is BeforeScanQr) {
                        return Container(
                          height: 50.0,
                          color: Colors.transparent,
                          child: Center(
                            child: new CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is QrScanFailed) {
                        return Text("Scan Gagal ${state.error}",
                            style: TextStyle(fontSize: 24, color: Colors.red));
                      }

                      return Text("", style: TextStyle(fontSize: 24));
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: () async {
            // print(Api.route[VerifikasiModel.modules]['verifikasi']);
            // try {
            //   VerifikasiModel.params["kavling"] = "okeeee";
            //   // print(VerifikasiModel.params);
            //   var request = await http.post(
            //       Api.route[VerifikasiModel.modules]['verifikasi'],
            //       body: {'kavling': 'okeee'});
            //   if (request.statusCode == 200) {
            //     print(request.body);
            //   }
            // } catch (e) {
            //   print("error ${e.message}");
            // }
            _blocScanner.add(ScanQr());
            //scan qrcode
          }),
    );
  }
}
