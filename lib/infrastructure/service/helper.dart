import 'package:flutter/material.dart';

import '../../presentation/styles/styles.dart';

abstract class MyDialogs {
  MyDialogs._();

  static simpleDialog(
      {required BuildContext context,
      required List list,
      required ValueChanged onTap,
      required VoidCallback onSummit}) {
    return showDialog(
        context: context,
        builder: (_) => Dialog(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Turi",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Style.textColor),
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(
                        height: 1.4,
                        child: Drawer(
                          backgroundColor: Style.strokeColor,
                          elevation: 0,
                        )),
                    ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 3),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (c, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.circle_outlined,
                                    color: Style.primaryColor,
                                  ),
                                  const SizedBox(width: 14),
                                  Text(list[index]),
                                ],
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                        height: 1.4,
                        child: Drawer(
                          backgroundColor: Style.strokeColor,
                          elevation: 0,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Bekor qilish")),
                        TextButton(
                            onPressed: () {}, child: const Text("Tanlash")),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
