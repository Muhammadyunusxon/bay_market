import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../components/zoom_tab_animation.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: ZoomAnimation(
                  child: FadeInAnimation(
                      child: Container(
                    height: 75,
                    margin: const EdgeInsets.all(8),
                    color: Colors.lightBlue,
                  )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
