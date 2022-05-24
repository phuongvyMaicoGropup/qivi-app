import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qiviapp/pages/bill/bill.dart';
import 'package:qiviapp/pages/home/home.dart';
import 'package:qiviapp/pages/login/login.dart';

import 'domain/binding/bindings.dart';
import 'pages/add_bill/view/add_bill_page.dart';
import 'pages/customer/view/customer_page.dart';
import 'pages/dashboard.dart';

class MyApp extends GetWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialRoute: '/',
      getPages: [
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            transition: Transition.zoom,
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
            name: '/bill',
            page: () => BillPage(),
            binding: BillBinding(),
            transition: Transition.native,
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
            name: '/customer',
            page: () => const CustomerPage(),
            binding: AddCustomerBinding(),
            transition: Transition.native,
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
            name: '/add-bill',
            page: () => AddBillPage(),
            transition: Transition.native,
            binding: AddBillBinding(),
            transitionDuration: const Duration(seconds: 1)),
        GetPage(
          name: '/',
          binding: HomeBinding(),
          page: () => Dashboard(),
        ),
      ],
      // home: Dashboard(),
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true)
          .copyWith(backgroundColor: const Color(0xFFDDDDDD)),
    );
  }
}
