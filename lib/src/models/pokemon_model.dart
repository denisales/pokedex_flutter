class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  // final Map<String, dynamic> images;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    // required this.images,
  });

  factory Pokemon.fromMap(Map<String, dynamic> data) {
    // final images = jsonDecode(data['images'][0]['sprites']);

    return Pokemon(
      id: data['id'],
      name: data['name'],
      types: (data['types'] as List<dynamic>)
          .map<String>((type) => type['pokemon_v2_type']['name'])
          .toList(),
      // images: images,
    );
  }
}
