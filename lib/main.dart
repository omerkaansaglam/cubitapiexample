import 'package:cubitapiexample/features/home/cubit/home_cubit.dart';
import 'package:cubitapiexample/features/home/service/home_service.dart';
import 'package:cubitapiexample/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
   runApp(MultiRepositoryProvider(providers: [
     RepositoryProvider(create: (_) => HomeCubit(HomeService()),)
   ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: HomeView(),
    );
  }
}