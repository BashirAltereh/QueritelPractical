import 'dogs_model.dart';

class CatsModel {
  CatsModel({
    this.cats,
  });

  CatsModel.fromJson(dynamic json) {
    if (json['cats'] != null) {
      cats = [];
      json['cats'].forEach((v) {
        cats?.add(PetItemModel.fromJson(v));
      });
    }
  }

  List<PetItemModel>? cats;

  CatsModel copyWith({
    List<PetItemModel>? cats,
  }) =>
      CatsModel(
        cats: cats ?? this.cats,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cats != null) {
      map['cats'] = cats?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
