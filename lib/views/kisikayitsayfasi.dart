
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysample1/cubit/kisikayitcubit.dart';

class KisiKayitSayfasi extends StatefulWidget {
  const KisiKayitSayfasi({super.key});

  @override
  State<KisiKayitSayfasi> createState() => _KisiKayitSayfasiState();
}

class _KisiKayitSayfasiState extends State<KisiKayitSayfasi> {

  TextEditingController tfKisiAdi=TextEditingController();
  TextEditingController tfKisiTeli=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        title: Text("Kisi Kayıt"),
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
                  hintText: "Kisi Adı...",
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    shadowColor: Colors.amber.shade500,

                  ),
                  child: Text("kaydet"),
                  onPressed: (){
                    context.read<KisiKayitCubit>().kayit(tfKisiAdi.text, tfKisiTeli.text);
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
