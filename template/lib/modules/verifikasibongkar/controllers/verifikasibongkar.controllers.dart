
import 'dart:convert';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:http/http.dart' as http;
import 'package:template/modules/login/models/login.models.dart';
import 'package:template/routes/api.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class VerifikasiBongkarController extends GetxController{
  File imgResult;
  var encodeImages;
  String resultBarcode = "";
  String messageBarcode = "";

  void getImageFromCamera() async{
    this.imgResult = null;
    this.encodeImages = "";
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    final dir = await path_provider.getTemporaryDirectory();

    List<String> dataPath = pickedFile.path.split('/');
    String temporaryName =
    dataPath[dataPath.length - 1].replaceAll('.jpg', '');
    temporaryName = temporaryName.replaceAll('.png', '');
    temporaryName = temporaryName.replaceAll('.jpeg', '');
    temporaryName = temporaryName + "-temp.jpg";
    final targetPath = dir.absolute.path + "/${temporaryName}";

    this.imgResult = await FlutterImageCompress.compressAndGetFile(
      pickedFile.path,
      targetPath,
      quality: 50,
      minWidth: 350,
      minHeight: 350,
      // rotate: 90,
    );

    final bytes = await this.imgResult.readAsBytes();
    this.encodeImages = base64.encode(bytes);
    update();
  }

  void verifikasiKavling(String id_lot_barcode) async {
    Map<String, dynamic> params = {};
    params['id_lot_barcode'] = id_lot_barcode;
    params['attatchment'] = this.encodeImages;
    params['departemen'] = LoginModel.departemen;
    params['username'] = LoginModel.user_id;

    var request = await http.post(
        Api.route["penerimaan/verifikasibarcode"]['verifikasiBongkar'],
        body: params);
    if (request.statusCode == 200) {
      var data = json.decode(request.body);
      if(data["is_valid"]){
        Get.snackbar("Informasi", "Data Berhasil Diverifikasi");
        this.imgResult = null;
        this.encodeImages = "";
        update();
      }
    }
  }

  void verifikasiBarcode(String id_lot_barcode) async {
    Map<String, dynamic> params = {};
    params['id_lot_barcode'] = id_lot_barcode;
    params['departemen'] = LoginModel.departemen;
    params['username'] = LoginModel.user_id;

    print("PARAMS ${params.toString()}");
    var request = await http.post(
        Api.route["penerimaan/verifikasibarcode"]['verifikasiBarcode'],
        body: params);
    if (request.statusCode == 200) {
      var data = json.decode(request.body);
      if(data["is_valid"]){
        Get.snackbar("Informasi", "Data Berhasil Diverifikasi");
      }
    }
  }

  void scanQrKavling(String kavlingBenar, id_lot_barcode) async{
    String cameraScanResult = await scanner.scan();
    String kavling_scan = cameraScanResult.replaceAll("_", " ");
    kavling_scan = kavling_scan.replaceAll("%20", " ");
    this.messageBarcode = kavling_scan;
    if(kavling_scan != kavlingBenar){
      Get.snackbar("Informasi", "Kavling Tidak sesuai");
    }else{
      this.resultBarcode = kavling_scan;
      this.verifikasiBarcode(id_lot_barcode);
    }
    update();
  }
}