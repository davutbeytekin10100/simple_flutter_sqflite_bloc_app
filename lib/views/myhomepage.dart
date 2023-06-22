
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysample1/cubit/anasayfacubit.dart';
import 'package:mysample1/entitity/kisiler.dart';
import 'package:mysample1/views/kisidetaysayfasi.dart';
import 'package:mysample1/views/kisikayitsayfasi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool aramaYapiliyorMu=false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle(); // program ilk açıldığında kaçkişi varsa veritabanında o kadar kişi yuklenecektir.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        title: aramaYapiliyorMu ?
        TextField(
          decoration: InputDecoration(
            hintText: "kisi Ara...",
          ),
          onChanged: (aramaSonucu) {
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ):
            Text("Kisiler"),

        actions: [
          aramaYapiliyorMu ?
              IconButton(
                icon: Icon(Icons.cancel,color: Colors.white,),
                onPressed: (){
                  setState(() {
                    aramaYapiliyorMu=false;
                  });
                  context.read<AnasayfaCubit>().kisileriYukle();
                },
              ) :

              IconButton(
                icon: Icon(Icons.search,color: Colors.white,),
                onPressed: (){
                  setState(() {
                    aramaYapiliyorMu=true;
                  });
                },
              ),
        ],
      ),

      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        builder: (context,kisilerListesi) {
          if(kisilerListesi.isNotEmpty) {

            return ListView.builder(
              itemCount: kisilerListesi.length,
              itemBuilder: (context,indeks) {
                var kisi=kisilerListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>KisiDetaySayfasi(kisi: kisi))).then((value) {
                     context.read<AnasayfaCubit>().kisileriYukle();
                    });
                  },
                  child: Card(
                    color: Colors.pink.shade500,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                           children: [

                             Text("${kisi.kisi_ad} - ${kisi.kisi_tel}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                             Spacer(),

                             IconButton(
                               icon: Icon(Icons.delete_outline,color: Colors.white,),
                               onPressed: (){
                                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${kisi.kisi_ad} silinsin mi? "),
                                   action: SnackBarAction(
                                     label: "EVET",
                                     onPressed: (){
                                       context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                     },
                                   ),
                                 ));
                               },
                             ),

                           ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          else{
            return Center();
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.pink.shade500,),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>KisiKayitSayfasi())).then((value) {
           context.read<AnasayfaCubit>().kisileriYukle();
          });
        },
      ),

    );
  }
}
