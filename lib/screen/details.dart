import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Constants/constant.dart';
import 'package:kbs_real_estate_trading/Models/EstateModel.dart';
import 'package:kbs_real_estate_trading/screen/imageView.dart';
import 'package:kbs_real_estate_trading/widgets.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Details extends StatefulWidget {
  
  final EstateModel details;

  const Details({super.key, required this.details});

  @override
  State<Details> createState() => _DetailsState();
}
  
class _DetailsState extends State<Details> {
  String? length,width, price,description;


  @override
  void initState() {
    super.initState();
    length = widget.details.length;
    width = widget.details.width;
    price = widget.details.price;
    description = widget.details.description;
  }
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Constants.PRIMARYCOLORS,
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          title:appBar(size) ),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: (size.width / 120)),
              width: size.width,
              height: (size.height / 7) * 2,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                        height: (size.height / 7) * 2,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        onPageChanged: ((index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        })),
                    itemCount: 5,
                    itemBuilder: ((context, index, realIndex) {
                      return InkWell(
                        onTap: (){
                          Get.to(()=>ImageView());
                        },
                        child: Image.asset(
                          "asset/images/field.jpg",
                          fit: BoxFit.fill,
                          width: size.width,
                        ),
                      );
                    }),
                  ),
                   Positioned(
                    left:0,
                    right: 0,
                    bottom: 20,
                     child: Align(
                                 alignment: Alignment.bottomCenter,
                                 child: indexIndicator()),
                   ),
                ],
              ),
            ),
            moreDetails(size,length,width,price,description)
           
          ],
        ));
  }

  Widget indexIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      effect: WormEffect(
        dotColor: Constants.PRIMARYCOLORS,
        activeDotColor: Colors.white,
        dotHeight: 8,
         dotWidth: 8),
      count: 5);
}
