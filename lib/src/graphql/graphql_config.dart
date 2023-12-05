import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  GraphQlConfig._();

  static const String _graphqlEndpoint =
      'https://beta.pokeapi.co/graphql/v1beta';

  static GraphQLClient createGraphQLClient() {
    final HttpLink httpLink = HttpLink(_graphqlEndpoint);

    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
  }
}
