class Character{
  int id;
  String name;
  String description;
  String thumbnail;
  Map<String, dynamic> urls;
  Map<String, dynamic> availableComics;

  Character({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
    this.urls,
    this.availableComics
  });
}