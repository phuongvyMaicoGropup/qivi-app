import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:qiviapp/pages/test.dart';

import 'app.dart';

void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  final HttpLink httpLink = HttpLink(
    'https://qivi-api.herokuapp.com/api/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  runApp(GraphQLProvider(client: client, child: const MyApp()));
  // runApp(NotificationListenerWidget());
}
