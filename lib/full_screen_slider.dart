import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsel_slider_plugin/fade_transition.dart';
import 'package:carsel_slider_plugin/images.dart';
import 'package:carsel_slider_plugin/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenSlider extends StatelessWidget {
   FullScreenSlider({super.key});
   final _stateController = Get.put(StateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        // title: const Text('Wallpaper',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx((){
        return FadeTransAnimation(
          duration: 1000,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(imagesUrl[_stateController.currentIndexFull.value])
                )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Center(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    // autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    height: 500,
                    // autoPlay: true,
                    // reverse: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    // pageSnapping: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(seconds: 3),
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
              ),
            ),
          ),
        );
      }),
    );
  }
   Widget buildImage(String urlImage, int index) {
     return Container(
         decoration: BoxDecoration(
             // color: Colors.grey,
             borderRadius: BorderRadius.circular(8)
         ),
         margin: EdgeInsets.symmetric(horizontal: 5),
         child: Image.asset(
           urlImage,
         )
     );
   }
}
