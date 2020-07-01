

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/events/aktifitas.events.dart';
import 'package:template/modules/verifikasibhnbaku/controllers/aktifitas/state/aktifitas.state.dart';
import 'package:template/modules/verifikasibhnbaku/models/verifikasi.models.dart';

class AktifitasBloc extends Bloc<AktifitasEvent, AktifitasState>{

  @override
  AktifitasState get initialState => InitData();

  @override
  Stream<AktifitasState> mapEventToState(AktifitasEvent event) async*{
    if(event is PerbaharuiAktifitas){
      yield OutputAktifitas(aktifitas: VerifikasiModel.aktifitas);
    }
  }
}