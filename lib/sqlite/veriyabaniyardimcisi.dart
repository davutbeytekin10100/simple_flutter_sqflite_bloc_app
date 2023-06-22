
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi { // bununla ama veritabanına erişimi saglamaktir.
  static final String veritabaniAdi= "rehber.sqlite"; // bu benim veritabnanımın adıdır yani.

  static Future<Database> veritabaniErisim() async{ // static dememizin sebebi sınıfıon ısmıyle erişimi saglayabilkmemizden dolyaıdır..
   String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi); // veritababına eişimi saglama k için bu yolu kullan diyorum ben yani.

    if(await databaseExists(veritabaniYolu)){
      print("Veritabani Zaten Var , Kopyalamaya Gerek Yok");
    }

    else{
      ByteData data= await rootBundle.load("veritabani/$veritabaniAdi");
      print("data : >>> $data");
      print("");

      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      print("bytes : $bytes");
      print("");

      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veritabani Kopyalandı");
    }
    
    return openDatabase(veritabaniYolu); // veri,tabnımız açıyoruz burda.
  }

}