
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysample1/cubit/anasayfacubit.dart';
import 'package:mysample1/cubit/kisidetaycubit.dart';
import 'package:mysample1/cubit/kisikayitcubit.dart';
import 'package:mysample1/views/myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => KisiKayitCubit()),
        BlocProvider(create: (context) => KisiDetayCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Sqlite Bloc Provider",
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );

  }
}
