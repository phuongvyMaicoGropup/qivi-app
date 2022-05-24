import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/common/models/customer.dart';
import 'package:qiviapp/domain/graphql/customer/queries.dart';
import 'package:qiviapp/pages/customer/widgets/customer_item.dart';
import 'package:qiviapp/pages/detail_customer/view/detail_customer_page.dart';

class Customers extends StatelessWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(allCustomerQuery),
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        pollInterval: const Duration(minutes: 1),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        List? repositories = result.data?['users'];

        if (repositories == null) {
          return const Text('Chưa có khách hàng');
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: repositories.length,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () => navigateToDetail(repositories[index]['id']),
                child: CustomerItem(
                    key: Key(repositories[index]['id']),
                    customer: Customer.fromJson(repositories[index])),
              )),
        );
      },
    );
  }

  void navigateToDetail(String id) {
    Get.to(DetailCustomerPage(id));
  }
}
