import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/events/aktifitas.events.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/state/aktifitas.state.dart';
import 'package:template/modules/verifikasibhnbaku/models/verifikasi.models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:template/routes/api.dart';

class AktifitasBloc extends Bloc<AktifitasEvent, AktifitasState> {
  @override
  AktifitasState get initialState => InitData();

  @override
  Stream<AktifitasState> mapEventToState(AktifitasEvent event) async* {
    if (event is PerbaharuiAktifitas) {
      yield OutputAktifitas(aktifitas: VerifikasiModel.aktifitas);
    }

    if (event is GetDataSopirMasukUntukPenerimaan) {
      yield BeforeRetrievingDataSopir();
      try {
        VerifikasiModel.params["id_barcodesopir"] = "";
        var request = await http.post(
            Api.route[VerifikasiModel.modules]
                ['getDataSopirMasukUntukPenerimaan'],
            body: VerifikasiModel.params);
        if (request.statusCode == 200) {
          Map data = json.decode(request.body);
          yield RetrievingDataSopirSuccess(result: data['data']);
        } else {
          yield RetrievingDataSopirFailed(error: request.statusCode.toString());
        }
      } catch (e) {
        yield RetrievingDataSopirFailed(error: e.toString());
      }
    }
  }
}
