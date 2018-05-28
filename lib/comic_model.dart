class Comic {
  final String title;
  final String description;
  final String thumbnail;

  Comic(this.title, this.description, this.thumbnail);

  Comic.fromJson(Map json)
      : title = json['title'],
        description = json['description'] ?? '',
        thumbnail = json['thumbnail']['path'] + '.' + json['thumbnail']['extension'].toString().toLowerCase();

}