import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:template/modules/verifikasibongkar/controllers/verifikasibongkar.controllers.dart';
import 'package:template/modules/verifikasibongkar/views/listpengajuan.verifikasi.views.dart';



class MainVerifikasiBongkar extends StatefulWidget {
  String kavling, id_lot_barcode;
  MainVerifikasiBongkar({this.kavling, this.id_lot_barcode});

  @override
  _MainVerifikasiBongkarState createState() => _MainVerifikasiBongkarState();
}

class _MainVerifikasiBongkarState extends State<MainVerifikasiBongkar> {
  VerifikasiBongkarController controller;


  @override
  void initState() {
    controller = new VerifikasiBongkarController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VERIFIKASI BONGKAR"),
      ),
      body:SingleChildScrollView(
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
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "SILAKAN MELAKUKAN VERIFIKASI BONGKAR DI KAVLING ${widget.kavling}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GetBuilder<VerifikasiBongkarController>(
                  init: controller,
                  builder: (params){
                    return Text(params.messageBarcode, style: TextStyle(fontSize: 18),);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RaisedButton(
                  color: Colors.orange,
                  child: Text("VERIFIKASI QR"),
                  onPressed: ()async{
                    controller.scanQrKavling(widget.kavling, widget.id_lot_barcode);
                  },
                )
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GetBuilder<VerifikasiBongkarController>(
                    init: controller,
                    builder: (params){
                      if(params.imgResult == null){
                        return Text("Belum ada gambar diambil",
                            style: TextStyle(
                                fontSize: 24, color: Colors.orange));
                      }

                      return RaisedButton(
                        color: Colors.orange,
                        child: Text("VERIFIKASI"),
                        onPressed: ()async{
                          Get.back(result: "reload");
                          controller.verifikasiKavling(widget.id_lot_barcode);
                        },
                      );
                    }
                )
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 6),
                height: 300,
                width: double.infinity,
                child: GetBuilder<VerifikasiBongkarController>(
                  init: controller,
                  builder :(params){
                    if(params.imgResult == null){
                      return Image.asset("assets/no_image.jpg");
                    }

                    return Image.file(params.imgResult);
                  }
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
              controller.getImageFromCamera();
          }),
    );
  }
}
