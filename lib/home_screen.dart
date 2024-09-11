import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsel_slider_plugin/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'images.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   final _stateController = Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Carousel Slider',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: const Text(
              'Auto Slider',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.more_vert_rounded,color: Colors.black,),
            ),
          ),
          Stack(
            alignment:
            Alignment.bottomCenter,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  height: 200,
                  autoPlay: true,
                  // reverse: true,
                  viewportFraction: 1,
                  //   enlargeCenterPage: true,
                  // pageSnapping: false,
                  // enlargeStrategy: CenterPageEnlargeStrategy.height,
                  //   enableInfiniteScroll: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    _stateController.currentIndex.value=index;
                  },
                ),
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = images[index];
                  return buildImage(urlImage, index);

                },
              ),
              Obx((){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex: _stateController.currentIndex.value,
                    count: images.length,
                    effect: ExpandingDotsEffect(
                        dotHeight: 6,
                        dotWidth: 6,
                      activeDotColor: Colors.redAccent,
                      dotColor: Colors.white
                    ),
                  ),
                );
              })
            ],
          ),
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemCount: _stateController.options.length,
              itemBuilder: (context, index) {
                  return ListTile(
                    title: Obx((){
                      return 
                    }),
                  );
              },
            ),
          )

        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        urlImage,
      )
    );
  }
}
