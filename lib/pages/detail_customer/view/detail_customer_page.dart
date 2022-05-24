import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/common/widgets/button.dart';
import 'package:qiviapp/domain/graphql/customer/queries.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/function/functions.dart';
import '../../../common/models/bill.dart';
import '../../../common/models/customer.dart';
import '../../../config/config.dart';
import '../../../domain/graphql/customer/queries.dart';
import '../widgets/widgets.dart';

class DetailCustomerPage extends HookWidget {
  DetailCustomerPage(this.id, {Key? key}) : super(key: key);
  final String id;
  RxString phone = "".obs;

  @override
  Widget build(BuildContext context) {
    final updateCustomer = useMutation(
      MutationOptions(
          document: gql(detailCustomerQuery),
          onCompleted: (dynamic resultData) {
            // print(resultData);
            Get.snackbar("Thông báo", "Cập nhập khách hàng thành công",
                backgroundColor: CustomColors.appGreen);
          },
          onError: (error) {
            Get.snackbar(
                "Thông báo", "Cập nhập khách hàng thất bại. Vui lòng thử lại ",
                backgroundColor: CustomColors.appPink);
          }),
    );
    return Scaffold(
        appBar: AppBar(
            title: Center(child: const Text("Chi tiết khách hàng")),
            actions: [
              IconButton(
                  onPressed: () => launch("tel://#${phone.value}"),
                  icon: const Icon(Icons.phone)),
            ]),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 15, bottom: 40),
              child: Query(
                options: QueryOptions(
                    fetchPolicy: FetchPolicy.cacheAndNetwork,
                    pollInterval: const Duration(seconds: 10),
                    document: gql(detailCustomerQuery),
                    variables: {"customerId": id}),
                builder: (QueryResult result,
                    {VoidCallback? refetch, FetchMore? fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  Customer customer = Customer.fromJson(result.data?['user']);
                  List billsData = result.data?['bills'];
                  List<Bill> bills = [];
                  billsData.forEach((a) => bills.add(Bill.fromJson(a)));
                  phone.value = customer.phoneNumber;
                  if (customer == null) {
                    return const Text('Thông tin không tồn tại');
                  }
                  double amountOwed = 0;
                  double total = 0;
                  bills.forEach((element) {
                    amountOwed += element.amountOwed;
                    total += element.total!;
                  });

                  return Column(
                    children: [
                      CustomerInfo(customer, amountOwed, total),
                      const SizedBox(height: 20),
                      bills != []
                          ? Text("Đơn hàng đã mua",
                              style: CustomTexts.textHeadingBlack.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500))
                          : Container(),
                      Bills(bills),
                      const SizedBox(height: 20),
                      Mutation(
                        options: MutationOptions(
                          document: gql("""
mutation{
  removeUser(id: "$id")
}
"""),
                          onError: (error) {
                            Get.back();
                            Get.snackbar("Thông báo ",
                                "Xoá khách hàng ${customer.name} thất bại ",
                                backgroundColor: Colors.red);
                          },
                          update: (cache, result) {
                            return cache;
                          },
                          onCompleted: (dynamic resultData) {
                            Get.back();
                            Get.snackbar("Thông báo ",
                                "Xoá khách hàng ${customer.name} thành công ",
                                backgroundColor: Colors.green,
                                colorText: Colors.white);
                          },
                        ),
                        builder: (
                          runMutation,
                          result,
                        ) {
                          return ButtonWidget("Xoá khách hàng ", () {
                            showMyDialog(context, "Xoá khách hàng ",
                                "Điều này đồng nghĩa với việc các đơn hàng thuộc về khách hàng này sẽ bị xoá",
                                () {
                              Get.back();
                              runMutation({id: customer.id});
                            });
                          }, Get.width * 0.9, Colors.red, Colors.white);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
