class DogsModel {
  DogsModel({
    this.dogs,
  });

  DogsModel.fromJson(dynamic json) {
    if (json['dogs'] != null) {
      dogs = [];
      json['dogs'].forEach((v) {
        dogs?.add(PetItemModel.fromJson(v));
      });
    }
  }

  List<PetItemModel>? dogs;

  DogsModel copyWith({
    List<PetItemModel>? dogs,
  }) =>
      DogsModel(
        dogs: dogs ?? this.dogs,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dogs != null) {
      map['dogs'] = dogs?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class PetItemModel {
  PetItemModel({
    this.name,
    this.photo,
    this.age,
    this.weight,
    this.description,
  });

  PetItemModel.fromJson(dynamic json) {
    name = json['name'];
    photo = json['photo'];
    age = json['age'];
    weight = json['weight'];
    description = json['description'];
  }

  String? name;
  String? photo;
  int? age;
  int? weight;
  String? description;

  PetItemModel copyWith({
    String? name,
    String? photo,
    int? age,
    int? weight,
    String? description,
  }) =>
      PetItemModel(
        name: name ?? this.name,
        photo: photo ?? this.photo,
        age: age ?? this.age,
        weight: weight ?? this.weight,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['photo'] = photo;
    map['age'] = age;
    map['weight'] = weight;
    map['description'] = description;
    return map;
  }
}
