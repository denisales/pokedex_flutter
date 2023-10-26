import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(
  'https://beta.pokeapi.co/graphql/v1beta', // Substitua pela URL da sua API GraphQL
);

final GraphQLClient client = GraphQLClient(
  link: _httpLink,
  cache: GraphQLCache(),
);
