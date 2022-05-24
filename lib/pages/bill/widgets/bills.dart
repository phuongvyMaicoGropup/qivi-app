import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/common/models/bill.dart';
import 'package:qiviapp/pages/bill/widgets/bill_item.dart';

import '../../../domain/controller/bill_controller.dart';
import '../../../domain/controller/controllers.dart';
import '../../../domain/graphql/bill/queries.dart';
import '../../detail_bill/view/detail_bill_page.dart';

class Bills extends GetWidget {
  Bills({Key? key}) : super(key: key);
  void navigateToDetailBill(String id) {
    Get.to(() => DetailBillPage(id));
  }

  bool hasMore = false;
  List bills = [];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BillController());
    return Query(
      options: QueryOptions(
        document: gql(
            billsWithPagination), // this is the query string you just created
        variables: {"skip": controller.page.value, "take": 6},
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
        final Map pageInfo = result.data!['billsWithPagination']['pageInfo'];
        hasMore = pageInfo['hasNextPage'];
        print(hasMore);

        FetchMoreOptions opts = FetchMoreOptions(
          variables: {
            "skip": controller.page.value * 6,
            "take": 6,
          },
          updateQuery: (previousResultData, fetchMoreResultData) {
            controller.isLoading.value = true;
            final List<dynamic> repos = [
              ...previousResultData!['billsWithPagination']['bills']
                  as List<dynamic>,
              ...fetchMoreResultData!['billsWithPagination']['bills']
                  as List<dynamic>
            ];
            controller.page.value = controller.page.value++;

            fetchMoreResultData['billsWithPagination']['bills'] = repos;
            hasMore = fetchMoreResultData['billsWithPagination']['pageInfo']
                ['hasNextPage'];
            controller.isLoading.value = false;

            return fetchMoreResultData;
          },
        );
        bills = result.data?['billsWithPagination']['bills'];

        if (bills == null) {
          return const Text('Chưa có hoá đơn');
        }

        return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {}
              if (notification is ScrollUpdateNotification) {}
              if (notification is ScrollEndNotification) {
                if (controller.isBottom.value &&
                    controller.isLoading.value == false) {
                  if (hasMore) {
                    print("Fetch more bill data");
                    fetchMore!(opts);
                  }
                }
              }
              return false;
            },
            child: ListView.custom(
              // shrinkWrap: true,
              controller: controller.scrollController,
              childrenDelegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: GestureDetector(
                          onTap: () => navigateToDetailBill(bills[index]["id"]),
                          child: BillItem(
                              key: UniqueKey(),
                              bill: Bill.fromJson(bills[index])),
                        ));
                  },
                  childCount: bills.length,
                  findChildIndexCallback: (Key key) {
                    final ValueKey<String> valueKey = key as ValueKey<String>;
                    final String data = valueKey.value;
                    return bills.indexOf(data);
                  }),
            ));
      },
    );
  }
}
