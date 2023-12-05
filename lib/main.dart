import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/src/app.dart';

main() async {
  await initHiveForFlutter();
  const String graphqlEndpoint = 'https://beta.pokeapi.co/graphql/v1beta';

  final HttpLink httpLink = HttpLink(graphqlEndpoint);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(
    GraphQLProvider(
      client: client,
      child: const App(),
    ),
  );
}
