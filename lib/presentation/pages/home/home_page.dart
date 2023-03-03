import 'package:ddd_lesson/presentation/pages/home/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home_cubit/home_cubit.dart';
import '../../../domain/model/room_model.dart';
import '../../../infrastructure/service/app_helper.dart';
import '../../styles/styles.dart';
import '../../utils/my_drop_down.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  List listOfType = ["Kvartiralar", "Tijorat ko’chmas mulk", "Yangi uylar"];

  List listOfDis = ["0 kv", "10 kv", "20 kv"];

  // List<Room> listOfRoom = [Room(title: "1 xona"),Room(title: "2 xona")];

  List<Room> listOfRoom =
      List.generate(6, (index) => Room(title: "$index xona"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 12),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Style.primaryColor,
                )),
            const SizedBox(width: 15),
            Expanded(
                child: TextFormField(
              decoration: Style.myDecoration(
                  title: "Qidirish", prefixIcon: const Icon(Icons.search)),
            )),
            const SizedBox(width: 15),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list,
                  color: Style.primaryColor,
                )),
          ],
        ),
        TabBar(
            labelColor: Style.textColor,
            indicatorColor: Style.primaryColor,
            controller: tabController,
            tabs: const [Tab(text: "Arenda"), Tab(text: "Sotib Olish")]),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Style.bgColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Qanday Uy qidiryapsiz?",
                style: Style.textStyleNormal(),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (p, s) {
                          return p.type != s.type;
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              AppHelper.showCustomDialog(
                                initIndex: listOfType.indexOf(state.type),
                                context: context,
                                title: "Turi",
                                list: listOfType,
                                onSelect: (int index) {
                                  context
                                      .read<HomeCubit>()
                                      .changeType(listOfType[index]);
                                },
                              );
                            },
                            child: FilterWidget(
                              title: state.type,
                              emptyTitle: 'Turi',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: GestureDetector(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (p, s) {
                          return p.distance != s.distance;
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              AppHelper.showCustomDialog(
                                initIndex: listOfDis.indexOf(state.distance),
                                context: context,
                                title: "Maydoni",
                                list: listOfDis,
                                onSelect: (int index) {
                                  context
                                      .read<HomeCubit>()
                                      .changeDis(listOfDis[index]);
                                },
                              );
                            },
                            child: FilterWidget(
                              title: state.distance,
                              emptyTitle: 'Maydoni',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              AppHelper.showCustomDialog(
                                context: context,
                                title: "Xonalar",
                                multiSelected: true,
                                list: listOfRoom,
                                onSelect: (int value) {},
                                initIndex: 0,
                                onSelectList: (List<dynamic>? value) {
                                  listOfRoom = value as List<Room>;
                                  context.read<HomeCubit>().refresh();
                                  print("000");
                                },
                              );
                            },
                            child: FilterWidget(
                              title: state.type,
                              multiTitle: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ...listOfRoom.map((e) {
                                      return e.isActive
                                          ? Text(
                                              "${e.title} ",
                                              style: Style.textStyleNormal(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          : const SizedBox.shrink();
                                    }),
                                  ]),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: GestureDetector(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (p, s) {
                          return p.distance != s.distance;
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              AppHelper.showCustomDialog(
                                initIndex: listOfDis.indexOf(state.distance),
                                context: context,
                                title: "Narxi",
                                list: listOfDis,
                                onSelect: (int index) {
                                  context
                                      .read<HomeCubit>()
                                      .changeDis(listOfDis[index]);
                                },
                              );
                            },
                            child: FilterWidget(
                              title: state.distance,
                              emptyTitle: 'Narxi',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: TabBarView(
          controller: tabController,
          children: const [
            Text("data"),
            Text("data"),
          ],
        )),
      ]),
    );
  }
}
