
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysample1/repository/kisilerdaorepository.dart';

class KisiKayitCubit extends Cubit<void> {
  KisiKayitCubit() :super(0);

  var krepo = KisilerDaoRepository(); // sınıfa ait olan bi nesne olusturuyorum ki method ve attributeslerine ulalaşbilem

  Future<void> kayit(String kisi_ad,String kisi_tel) async{
    await krepo.kisiKayit(kisi_ad, kisi_tel);
  }

}