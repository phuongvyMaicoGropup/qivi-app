import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../common/function/functions.dart';
import '../../../common/models/bill.dart';
import '../../../config/config.dart';
import '../../../domain/graphql/bill/queries.dart';
import '../../detail_bill/view/view.dart';

class NewBills extends StatelessWidget {
  const NewBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.9,
        decoration: CustomBoxs.mainDecoration,
        child: Column(
          children: [
            Text("Đơn hàng chưa giao ",
                style: CustomTexts.textHeadingBlack
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Container(
                child: Query(
              options: QueryOptions(
                document: gql(notDoneBill),
                fetchPolicy: FetchPolicy.cacheAndNetwork,
              ),
              builder: (QueryResult result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (result.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                List bills = result.data?['allBill'];

                if (bills == null) {
                  return const Text('Chưa có hoá đơn');
                }

                return ListView.custom(
                  shrinkWrap: true,
                  childrenDelegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () =>
                                navigateToDetailBill(bills[index]["id"]),
                            child: Container(
                                width: Get.width * 0.9,
                                margin: const EdgeInsets.only(
                                    bottom: 10, right: 10, left: 10),
                                decoration: CustomBoxs.cyanDecoration,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(bills[index]["userInfo"]["name"]),
                                      Text(convertMoney(bills[index]["total"])),
                                    ],
                                  ),
                                )));
                      },
                      childCount: bills.length,
                      findChildIndexCallback: (Key key) {
                        final ValueKey<String> valueKey =
                            key as ValueKey<String>;
                        final String data = valueKey.value;
                        return bills.indexOf(data);
                      }),
                );
              },
            ))
          ],
        ));
  }

  void navigateToDetailBill(String id) {
    Get.to(() => DetailBillPage(id));
  }
}
