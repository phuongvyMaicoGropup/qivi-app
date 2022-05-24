import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/domain/graphql/customer/queries.dart';

class CustomerRepository {
  CustomerRepository._();
  final allCustomerResult = useQuery(
    QueryOptions(
      document:
          gql(allCustomerQuery), // this is the query string you just created
    ),
  );
}
