import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/common/widgets/button.dart';
import 'package:qiviapp/config/custom_text.dart';
import 'package:qiviapp/domain/graphql/bill/mutations.dart';
import 'package:qiviapp/domain/graphql/customer/queries.dart';
import 'package:qiviapp/pages/bill/widgets/widgets.dart';
import 'package:qiviapp/providers/search_controller.dart';

import '../../../common/function/functions.dart';
import '../../../common/models/bill.dart';
import '../../../config/config.dart';
import '../../../domain/graphql/bill/queries.dart';
import '../../update_bill/view/update_bill_page.dart';
import '../widgets/widgets.dart';

class DetailBillPage extends HookWidget {
  DetailBillPage(this.id, {Key? key}) : super(key: key);
  final String id;
  VoidCallback? refetchQuery;
  @override
  Widget build(BuildContext context) {
    final updateBill = useMutation(
      MutationOptions(
          document: gql(updateBillMutation),
          onCompleted: (dynamic resultData) {
            // print(resultData);
            Get.snackbar("Thông báo", "Cập nhập đơn hàng thành công",
                backgroundColor: CustomColors.appGreen,
                colorText: Colors.white);
          },
          onError: (error) {
            Get.snackbar(
                "Thông báo", "Cập nhập đơn hàng thất bại. Vui lòng thử lại ",
                backgroundColor: CustomColors.appPink, colorText: Colors.white);
          }),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chi tiết đơn hàng"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 15, bottom: 40),
              child: Query(
                options: QueryOptions(
                    document: gql(billByIdQuery), variables: {"id": id}),
                builder: (QueryResult result,
                    {VoidCallback? refetch, FetchMore? fetchMore}) {
                  refetchQuery = refetch;
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var data = result.data?['billById'];

                  if (data == null) {
                    return const Text('Chưa có hoá đơn');
                  }
                  Bill bill = Bill.fromJson(data);

                  return Column(
                    children: [
                      BillInfo(bill),
                      Invoice(bill.invoice!),
                      (bill.isSuccess)
                          ? ButtonWidget("Cập nhập dữ liệu", () {
                              Get.to(UpdateBillPage(bill));
                            }, Get.width * 0.9)
                          : ButtonWidget("Đã giao thành công", () {
                              updateBill.runMutation({
                                "customerId": bill.userInfo!.id,
                                "id": bill.id,
                                "invoice": bill.invoice,
                                "isSuccess": true,
                                "note": bill.note,
                                "lastUpdated":
                                    "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                                "created": bill.created,
                                "total": bill.total,
                                "amountOwed": bill.amountOwed,
                              });
                            }, Get.width * 0.9, Colors.green, Colors.white),
                      const SizedBox(height: 10),
                      Mutation(
                        options: MutationOptions(
                          document: gql("""
mutation(){
  removeBill(id : "$id")
}
"""),
                          update: (cache, result) {
                            return cache;
                          },
                          onError: (error) {
                            Get.back();
                            Get.snackbar("Thông báo ", "Xoá đơn hàng thất bại ",
                                backgroundColor: Colors.red);
                          },
                          onCompleted: (dynamic resultData) {
                            Get.back();
                            Get.snackbar(
                                "Thông báo ", "Xoá đơn hàng thành công ",
                                backgroundColor: Colors.green);
                          },
                        ),
                        builder: (
                          runMutation,
                          result,
                        ) {
                          return ButtonWidget("Xoá đơn hàng ", () {
                            showMyDialog(context, "Xoá đơn hàng ",
                                "Bạn có chắc chắn muốn xoá đơn hàng?", () {
                              Get.back();
                              runMutation({id: bill.id});
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
