import 'dart:convert';

class Wallpaper {
  final String imageURL;
  final String category;
  final String imageCompressed;
  Wallpaper({
    this.imageURL,
    this.category,
    this.imageCompressed,
  });

  Wallpaper copyWith({
    String imageURL,
    String category,
  }) {
    return Wallpaper(
      imageURL: imageURL ?? this.imageURL,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageURL': imageURL,
      'category': category,
    };
  }

  factory Wallpaper.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Wallpaper(
      imageURL: map['imageURL'],
      category: map['category'],
      imageCompressed: map['imageURL'] + "?auto=compress",
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallpaper.fromJson(String source) =>
      Wallpaper.fromMap(json.decode(source));

  @override
  String toString() => 'Wallpaper(imageURL: $imageURL, category: $category)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Wallpaper && o.imageURL == imageURL && o.category == category;
  }

  @override
  int get hashCode => imageURL.hashCode ^ category.hashCode;
}
