import 'dart:convert';

MoviedbCastResponse moviedbActorsResponseFromJson(String str) => MoviedbCastResponse.fromJson(json.decode(str));
String moviedbActorsResponseToJson(MoviedbCastResponse data) => json.encode(data.toJson());

class MoviedbCastResponse {
  
  final int id;
  final List<Cast> cast;
  final List<Cast> crew;

  MoviedbCastResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  MoviedbCastResponse copyWith({
    int? id,
    List<Cast>? cast,
    List<Cast>? crew,
  }) =>
      MoviedbCastResponse(
        id: id ?? this.id,
        cast: cast ?? this.cast,
        crew: crew ?? this.crew,
      );

  factory MoviedbCastResponse.fromJson(Map<String, dynamic> json) => MoviedbCastResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
      };
}

class Cast {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;
  final String department;
  final String job;

  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  Cast copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
    String? department,
    String? job,
  }) =>
      Cast(
        adult: adult ?? this.adult,
        gender: gender ?? this.gender,
        id: id ?? this.id,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        name: name ?? this.name,
        originalName: originalName ?? this.originalName,
        popularity: popularity ?? this.popularity,
        profilePath: profilePath ?? this.profilePath,
        castId: castId ?? this.castId,
        character: character ?? this.character,
        creditId: creditId ?? this.creditId,
        order: order ?? this.order,
        department: department ?? this.department,
        job: job ?? this.job,
      );

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"],
        castId: json["cast_id"] ?? 0,
        character: json["character"] ?? 'uknown',
        creditId: json["credit_id"],
        order: json["order"] ?? 0,
        department: json["department"] ?? 'uknown',
        job: json["job"] ?? 'uknown',
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}
