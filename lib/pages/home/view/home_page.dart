import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qiviapp/config/config.dart';
import 'package:qiviapp/domain/controller/home_controller.dart';
import 'package:qiviapp/pages/home/widgets/widgets.dart';

import '../../../domain/graphql/home/queries.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  String app = '''query{
  
  category{
    categoryId
    description
  }
}''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Query(
          options: QueryOptions(
            document: gql(homeData),
            fetchPolicy: FetchPolicy.cacheAndNetwork,
            pollInterval: Duration(seconds: 10),
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            List allBill = result.data!['allBill'];
            List notDoneBills = result.data!['notDoneBills'];
            List owedBills = result.data!['owedBills'];

            double amount = 0;
            for (int i = 0; i < allBill.length; i++) {
              amount += allBill[i]['total'];
            }
            final oCcy = NumberFormat("#,##0", "en_US");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // AppBanner(),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: CustomColors.appCyanText,
                    ),
                    padding: CustomBoxs.mainPadding,
                    width: Get.width,
                    height: Get.height * 0.26,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: Get.height * 0.01),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: const Text("Quỳnh Vy Store",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25)),
                          ),
                          SizedBox(height: Get.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.card_giftcard,
                                        color: CustomColors.appCyanText,
                                        size: 25),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Chưa giao",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                      Text(
                                          notDoneBills.length.toString() +
                                              " đơn",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ],
                              )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.attach_money_outlined,
                                        color: CustomColors.appCyanText,
                                        size: 25),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Chưa thanh toán",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                      Text(owedBills.length.toString() + " đơn",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tổng doanh thu: ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                              Text(oCcy.format(amount),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25)),
                            ],
                          )),
                        ],
                      ),
                    )),
                // Expanded(child: NewBills())
              ],
            );
          },
        ),
      ),
    );
  }
}
