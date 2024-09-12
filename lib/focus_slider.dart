import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsel_slider_plugin/fade_transition.dart';
import 'package:carsel_slider_plugin/images.dart';
import 'package:carsel_slider_plugin/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusSlider extends StatelessWidget {
  FocusSlider({super.key});
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
              height: 400,
              // autoPlay: true,
              reverse: true,
              // viewportFraction: 2,
              enlargeCenterPage: true,
              // pageSnapping: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: false,
              // autoPlayInterval: const Duration(seconds: 3),
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
    return Container(
        decoration: BoxDecoration(
          // color: Colors.grey,
            borderRadius: BorderRadius.circular(8)
        ),
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: InteractiveViewer(
          maxScale: 8,
          panEnabled: true,
          clipBehavior: Clip.none,
          child: Image.asset(
            urlImage,
          ),
        )
    );
  }
}
