part of com.rick_and_morty.typing;

class Origin {
  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    url = json['url'] as String?;
  }

  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
