
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysample1/entitity/kisiler.dart';
import 'package:mysample1/repository/kisilerdaorepository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit() : super(<Kisiler>[]); // bunun default olan consyrutoru boyle oluyor..

  var krepo=KisilerDaoRepository(); // sınıftan bi nesne olusturuyoruz biz.


  Future<void> kisileriYukle() async{
    var liste = await krepo.tumKisileriAl(); // nesne sayesinde sınıfın methodlarına erişimi saglıyorum burada ben.
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async{
    var liste= await krepo.kisiAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisi_id) async{
    await krepo.kisiSil(kisi_id);
    await kisileriYukle();
  }


}