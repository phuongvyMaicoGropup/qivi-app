import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qiviapp/config/config.dart';
import 'package:qiviapp/domain/controller/home_controller.dart';
import 'package:qiviapp/pages/customer/customer.dart';
import 'package:qiviapp/pages/home/widgets/widgets.dart';

import 'customer/view/customer_page.dart';
import 'home/home.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            currentIndex: controller.tabIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: CustomColors.appCyanText,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.moneyBill1), label: "Hoá đơn"),
              BottomNavigationBarItem(
                  icon: FaIcon(Icons.home), label: "Trang chủ"),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.person), label: "Khách hàng"),
            ],
          ),
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              BillPage(),
              HomePage(title: "Quỳnh Vy Store"),
              CustomerPage()
            ],
          ));
    });
  }
}
