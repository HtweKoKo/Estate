import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Constants/constant.dart';
import 'package:kbs_real_estate_trading/Controller/ReadEstateDataController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets.dart';

class ImageView extends StatefulWidget {

   ImageView({Key? key}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
    int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider.builder(
            itemCount: 4,
             itemBuilder: ((context, index, realIndex) {
               return Padding(
                 padding: const EdgeInsets.all(3.0),
                 child: Image.asset("asset/images/field2.jpg"),
               );
             }), 
             options: CarouselOptions(
                  height: (size.height/5)*3,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: ((index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                    
                  })
             )),
             indexIndicator()

        ],
    );

    // return ListView.builder(
    
    //   scrollDirection: Axis.horizontal,
    //   itemCount: 5,
    //   itemBuilder: ((context, index) {
  
    //   return   Center(
        
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Image.asset("asset/images/field2.jpg",
    //   width: size.width,
    //   height: size.height/2,
    //   ),
    //     ));
     
    //   }));
    
     
    
  }

  Widget indexIndicator()=> AnimatedSmoothIndicator(
    activeIndex:currentIndex , 
    effect: WormEffect(
      offset: 8,
      dotWidth: 8,
      dotHeight: 8,
      dotColor: Constants.PRIMARYCOLORS,
      activeDotColor: Colors.white

    ),
    count: 5);
}