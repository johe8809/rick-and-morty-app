part of com.rick_and_morty.typing;

class Character {
  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    status = CharacterStatus.fromString(json['status']! as String);
    species = json['species'] as String?;
    type = json['type'] as String?;
    gender = json['gender'] as String?;
    origin = json['origin'] != null
        ? Origin.fromJson(
            json['origin'] as Map<String, dynamic>,
          )
        : null;
    location = json['location'] != null
        ? Origin.fromJson(
            json['location'] as Map<String, dynamic>,
          )
        : null;
    image = json['image'] as String?;
    episode = json['episode'] != null
        ? List<String>.from(json['episode'] as List<dynamic>)
        : <String>[];
    url = json['url'] as String?;
    created = json['created'] as String?;
  }

  int? id;
  String? name;
  CharacterStatus? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Future<Map<String, dynamic>> toJson() async {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}
