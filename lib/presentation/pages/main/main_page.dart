import 'package:ddd_lesson/application/main_cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ads_page.dart';
import '../home/home_page.dart';
import '../placePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List listOfPage = [
    const HomePage(),
    const Placeholder(),
    const PlacePage(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: listOfPage[state.selected],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => AdmobPage()));
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selected,
              onTap: (s) {
                context.read<MainCubit>().changePage(s);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.house), label: "Bay house"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline), label: "Sevimlilar"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box), label: "Bay house"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline), label: "Bay house"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Bay house"),
              ],
            ),
          ),
        );
      },
    );
  }
}
