import 'package:flutter/material.dart';

import '../../infrastructure/service/helper.dart';
import '../styles/styles.dart';

class MyDropDown extends StatelessWidget {
  final String value;
  final List list;

  const MyDropDown({
    Key? key,
    required this.value,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyDialogs.simpleDialog(
            context: context, list: list, onTap: (s) {}, onSummit: () {});
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Style.whiteColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: Style.textStyleNormal(),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
