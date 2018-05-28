class Character {
  int id;
  String name;
  String description;
  String thumbnail;
  Map<String, dynamic> urls = new Map();
  Map<String, dynamic> availableComics = new Map();

//  int numberComics;
//  int numberEvents;

//  Character(this.id, this.name, this.description, this.thumbnail, this.urls,
//      this.availableComics);
//
//  factory Character.fromJson(Map json) {
//    var urls;
//    for (var url in json['urls']) {
//      var type = url['type'];
//      urls[type] = url['url'];
//    }
//    return new Character(
//        json['id'],
//        json['name'],
//        json['description'],
//        json['thumbnail']['path'] +
//            '.' +
//            json['thumbnail']['extension'].toString().toLowerCase(),
//        urls,
//        {
//          'comics': json['comics']['available'],
//          'events': json['events']['available']
//        });
//      }
  }

//    return new
//  }
//      : id = json['id'],
//        name = json['name'],
//        description = json['description'] ?? '',
//        thumbnail = json['thumbnail']['path'] +
//            '.' +
//            json['thumbnail']['extension'].toString().toLowerCase(),
//        urls = {
//          'detail' : json['urls']['detail']['url']
//        },
//        availableComics = {
//          'comics': json['comics']['available'],
//          'events': json['events']['available']
//        };
