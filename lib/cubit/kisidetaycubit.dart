
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysample1/repository/kisilerdaorepository.dart';

class KisiDetayCubit extends Cubit<void> {
  KisiDetayCubit() :super(0);

  KisilerDaoRepository krepo=KisilerDaoRepository(); // sınıfa ait olan bi nesn eolsuturuyoruz biz.

  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    await krepo.kisiGuncelle(kisi_id, kisi_ad, kisi_tel);
  }

}