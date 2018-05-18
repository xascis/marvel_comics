class Character {
  final int id;
  final String name;
  final String description;
//  final String url;

  Character({this.id, this.name, this.description});

  factory Character.fromJson(Map<String, dynamic> json) {
    return new Character(
        id: json['id'],
        name: json['name'],
        description: json['description']
    );
  }
}