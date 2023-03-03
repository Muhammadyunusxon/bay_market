import 'package:ddd_lesson/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/home_cubit/home_cubit.dart';
import '../application/main_cubit/main_cubit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainCubit()),
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: const MainPage(),
      ),
    );
  }
}
