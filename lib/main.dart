import 'package:collection_app/Screeen/home/Home.dart';
import 'package:collection_app/repository/bloc/Schem/scheme_bloc.dart';
import 'package:collection_app/repository/bloc/id/user_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository/bloc/CustomerView/customer_view_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserIdBloc>(
          create: (context) => UserIdBloc(),
        ),
        BlocProvider<SchemeBloc>(
          create: (context) => SchemeBloc(),
        ),
        BlocProvider<CustomerViewBloc>(
          create: (context) => CustomerViewBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
