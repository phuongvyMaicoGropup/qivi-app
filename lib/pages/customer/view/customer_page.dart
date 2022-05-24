import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:qiviapp/pages/customer/widgets/widgets.dart';
import 'package:qiviapp/providers/search_controller.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({Key? key}) : super(key: key);

  void _navigateToAddCustomer() {
    // Get.toNamed("/add-bill");
  }

  @override
  Widget build(BuildContext context) {
    SearchController searchController = Get.put(SearchController());
    var size = Get.size;
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Trang khách hàng")),
          actions: [
            IconButton(
                onPressed: () => _openAddCustomer(context),
                icon: const FaIcon(FontAwesomeIcons.plus))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Customers()],
              ),
            ),
          ),
        ));
  }

  void _openAddCustomer(BuildContext context) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: Get.height * 0.4,
            color: Colors.white,
            child: const Center(child: AddCustomer()),
          ),
        );
      },
    );
  }
}
