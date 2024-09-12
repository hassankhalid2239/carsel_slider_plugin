import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsel_slider_plugin/fade_transition.dart';
import 'package:carsel_slider_plugin/images.dart';
import 'package:carsel_slider_plugin/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerticalSlider extends StatelessWidget {
  VerticalSlider({super.key});
  final _stateController = Get.put(StateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: Colors.white,
          title:  Obx((){
            return Text('Image${_stateController.currentIndexFull.value}',style: TextStyle(color: Colors.white),);
          }),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              // autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              height: 600,
              // autoPlay: true,
              // reverse: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              // pageSnapping: false,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              // enableInfiniteScroll: false,
              // autoPlayInterval: const Duration(seconds: 3),
              scrollDirection: Axis.vertical,
              onPageChanged: (index, reason) {
                _stateController.currentIndexFull.value=index;
              },
            ),
            itemCount: imagesUrl.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = imagesUrl[index];
              return buildImage(urlImage, index);

            },
          ),
        )
    );
  }
  Widget buildImage(String urlImage, int index) {
    return Image.asset(
      urlImage,
    );
  }
}
