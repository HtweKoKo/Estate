import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kbs_real_estate_trading/Constants/constant.dart';
import 'package:kbs_real_estate_trading/screen/FbPage.dart';
import 'package:kbs_real_estate_trading/screen/ForREnt.dart';
import 'package:kbs_real_estate_trading/screen/ForSale.dart';
import 'package:kbs_real_estate_trading/screen/TabBarView/Between_30M_200M.dart';
import 'package:kbs_real_estate_trading/screen/TabBarView/Under30M.dart';
import 'package:kbs_real_estate_trading/screen/details.dart';
import 'package:kbs_real_estate_trading/screen/setting.dart';
import 'package:kbs_real_estate_trading/widgets.dart';

import '../Controller/ReadEstateDataController.dart';
import '../Controller/under30MController.dart';
import '../Models/EstateModel.dart';
import 'addDataForm.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var _under30MController = Under30MController();
  var _readEstateDataController = ReadEstateDataController();
  int _currentIndex = 0;
  Widget _body = ForSale();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.PRIMARYCOLORS,
            toolbarHeight: 70,
            elevation: 1,
            bottom: (_currentIndex == 2)
                ? null
                : TabBar(isScrollable: true, tabs: [
                    Tab(
                      text: "home",
                    ),
                    Tab(text: "under 50M"),
                    Tab(
                      text: "between 50M and 300M",
                    ),
                    Tab(
                      text: "Above 300M",
                    ),
                    // Tab(
                    //   text: "under 500M",
                    // ),
                    // Tab(
                    //   text: "over 500M",
                    // ),
                  ]),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => AddDataForm());
                  },
                  icon: Icon(Icons.add))
            ],
            title: Container(
              width: size.width / 1.1,
              height: size.height / 12,
              child: Image.asset(
                "asset/images/kbsLogo.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "for sale"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "for rent"),
              BottomNavigationBarItem(icon: Icon(Icons.more), label: "More"),
            ],
            onTap: (value) {
              setState(() {
                _currentIndex = value;
                if (_currentIndex == 1) {
                  _body = ForRent();
                } else if (_currentIndex == 2) {
                  _body = Setting();
                } else {
                  _body = ForSale();
                }
              });
            },
          ),
          body: _body,
          // body: TabBarView(
          //     children: [ForSale(), Setting(), B30MAnd200M(), FbPage()]),
        ));
  }
}
