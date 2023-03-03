import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class FilterWidget extends StatelessWidget {
  final String title;
  final String emptyTitle;
  final Widget? multiTitle;

  const FilterWidget(
      {Key? key, required this.title, this.emptyTitle = "", this.multiTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Style.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: multiTitle ??
                Text(
                  title.isEmpty ? emptyTitle : title,
                  style: Style.textStyleNormal(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
