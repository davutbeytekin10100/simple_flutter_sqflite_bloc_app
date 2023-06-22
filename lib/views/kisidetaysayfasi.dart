
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysample1/cubit/kisidetaycubit.dart';
import 'package:mysample1/entitity/kisiler.dart';

class KisiDetaySayfasi extends StatefulWidget {
  Kisiler kisi;
   KisiDetaySayfasi({super.key, required this.kisi});

  @override
  State<KisiDetaySayfasi> createState() => _KisiDetaySayfasiState();
}

class _KisiDetaySayfasiState extends State<KisiDetaySayfasi> {

  TextEditingController tfKisiAdi=TextEditingController();
  TextEditingController tfKisiTeli=TextEditingController();

  @override
  void initState() {
    super.initState();
    Kisiler kisi=widget.kisi;
    tfKisiAdi.text=kisi.kisi_ad;
    tfKisiTeli.text=kisi.kisi_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        title: Text("Kisi Detay"),
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              TextField(
               controller: tfKisiAdi,
                decoration: InputDecoration(
                  hintText: "Kisi adı...",
                ),
              ),

              TextField(
                controller: tfKisiTeli,
                decoration: InputDecoration(
                  hintText: "Kisi Teli...",
                ),
              ),

              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade500,
                  ),
                  child: Text("Guncelle"),
                  onPressed: (){
                    context.read<KisiDetayCubit>().guncelle(widget.kisi.kisi_id, tfKisiAdi.text, tfKisiTeli.text);
                    Navigator.of(context).pop();
                  },
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
