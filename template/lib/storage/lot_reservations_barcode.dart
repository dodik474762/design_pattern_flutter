
class Lot_reservations_barcode{
  String id;
  String lot_reservation;
  String issuer;
  String attachment;
  String warehouse_barcode_verified;
  String qc_barcode_verified;
  String warehouse_barcode_unloaded;
  String qc_barcode_unloaded;
  String pengajuan;
  String no_op;
  String kavling;
  String imgkavling;

  Lot_reservations_barcode({this.id, this.lot_reservation, this.issuer, this.attachment,
    this.warehouse_barcode_verified, this.qc_barcode_verified, this.warehouse_barcode_unloaded,
    this.qc_barcode_unloaded, this.pengajuan, this.no_op, this.kavling, this.imgkavling});


  Lot_reservations_barcode.fromJson(Map<String, dynamic> json){
    this.id = json['id'];
    this.lot_reservation = json['lot_reservation'];
    this.issuer = json['issuer'];
    this.attachment = json['attachment'];
    this.warehouse_barcode_verified = json['warehouse_barcode_verified'];
    this.qc_barcode_verified = json['qc_barcode_verified'];
    this.warehouse_barcode_unloaded = json['warehouse_barcode_unloaded'];
    this.qc_barcode_unloaded = json['qc_barcode_unloaded'];
    this.pengajuan = json['pengajuan'];
    this.no_op = json['no_op'];
    this.kavling = json['kavling'];
    this.imgkavling = json['imgkavling'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lot_reservation'] = this.lot_reservation;
    data['issuer'] = this.issuer;
    data['attachment'] = this.attachment;
    data['warehouse_barcode_verified'] = this.warehouse_barcode_verified;
    data['qc_barcode_verified'] = this.qc_barcode_verified;
    data['warehouse_barcode_unloaded'] = this.warehouse_barcode_unloaded;
    data['qc_barcode_unloaded'] = this.qc_barcode_unloaded;
    data['pengajuan'] = this.pengajuan;
    data['no_op'] = this.no_op;
    data['kavling'] = this.kavling;
    data['imgkavling'] = this.imgkavling;

    return data;
  }
}