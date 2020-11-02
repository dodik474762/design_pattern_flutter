import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:search_page/search_page.dart';
import 'package:template/modules/verifikasibongkar/controllers/pengajuan.controllers.dart';
import 'package:template/modules/verifikasibongkar/models/kavling.models.dart';
import 'package:template/modules/verifikasibongkar/views/main.verifikasi.views.dart';
import 'package:template/storage/lot_reservations_barcode.dart';


class ListPengajuanVerifikasiView extends StatefulWidget {
  @override
  _ListPengajuanVerifikasiViewState createState() => _ListPengajuanVerifikasiViewState();
}

class _ListPengajuanVerifikasiViewState extends State<ListPengajuanVerifikasiView> {
  PengajuanController controller;

  @override
  void initState() {
    controller = new PengajuanController();
    controller.getListPengejuan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DAFTAR KAVLING"),
      ),
      backgroundColor: Colors.white,
      body: FooterView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: GetBuilder<PengajuanController>(
              init: controller,
              builder: (params){
                if(!params.reload){
                  return ListView.builder(
                    itemCount: KavlingModel.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final Lot_reservations_barcode params = KavlingModel.data[index];
                      return ListTile(
                        title: Text(params.kavling, style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text('-'),
                        trailing: Text('PILIH', style: TextStyle(color: Colors.pinkAccent),),
                        onTap: () async{
                          String result = await Get.to(MainVerifikasiBongkar(
                            id_lot_barcode: params.id.toString(),
                            kavling: params.kavling.toString(),
                          ));

                          if(result == "reload"){
                            controller.reload = true;
                            controller.getListPengejuan();
                            controller.update();
                          }
                        },
                      );
                    },
                  );
                }

                return CircularProgressIndicator();
              },
            )
          )
        ],
        footer: Footer(
          backgroundColor: Colors.white,
          child: Text("Wonokoyo"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        backgroundColor: Colors.pinkAccent,
        tooltip: "Cari Kavling",
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Lot_reservations_barcode>(
            items: KavlingModel.data,
            searchLabel: 'Cari Kavling',
            suggestion: Center(
              child: Text('Cari Kavling Berdasarkan Nama'),
            ),
            failure: Center(
              child: Text('Tidak ada antrian ditemukan :('),
            ),
            filter: (data) => [
              data.kavling,
            ],
            builder: (data) => ListTile(
              title: Text(data.kavling, style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('-'),
              trailing: Text('PILIH', style: TextStyle(color: Colors.pinkAccent),),
              onTap: (){
                Get.to(MainVerifikasiBongkar(
                  id_lot_barcode: data.id.toString(),
                  kavling: data.kavling.toString(),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
