import 'package:carousel_slider/carousel_slider.dart';
import 'package:carsel_slider_plugin/full_screen_slider.dart';
import 'package:carsel_slider_plugin/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          SizedBox(height: 10,),
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
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  backgroundColor: WidgetStatePropertyAll(Colors.redAccent)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreenSlider()));
                },
                child: Text('Full Screen Slider',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18,letterSpacing: 2),),
              ),
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
